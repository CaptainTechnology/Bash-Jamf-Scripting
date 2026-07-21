import requests
import csv

print("Script started")
JAMF_URL = "https://jamftechnology.jamfcloud.com"

# REDACTED FOR SECURITY - Paste your newly generated ones here!
CLIENT_ID = "" 
CLIENT_SECRET = ""

GROUP_ID = 97
CSV_FILE = "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Jamf API/Bulk_sys_add_in_STG/serials.csv"
MISSING_FILE = "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Jamf API/Bulk_sys_add_in_STG/not_found_serials.txt"

print("Configuration loaded")

# 1. Get OAuth Token using Jamf API Clients
print("Getting OAuth token...")
token_url = f"{JAMF_URL}/api/oauth/token"
token_data = {
    "client_id": CLIENT_ID,
    "client_secret": CLIENT_SECRET,
    "grant_type": "client_credentials"
}

response = requests.post(token_url, data=token_data)

if response.status_code != 200:
    print(f"Failed to get token! Status: {response.status_code}")
    print(response.text)
    exit()

token = response.json().get("access_token")
print("Token successfully retrieved!")

# 2. Read Serial Numbers from the CSV
print(f"Reading serial numbers from {CSV_FILE}...")
raw_serials = []

try:
    with open(CSV_FILE, mode='r', encoding='utf-8-sig') as file:
        csv_reader = csv.reader(file)
        for row in csv_reader:
            if row: 
                serial = row[0].strip()
                if serial and serial.lower() not in ["serial number", "serial", "serialnumber"]: 
                    raw_serials.append(serial)
except FileNotFoundError:
    print(f"Error: Could not find the file at {CSV_FILE}")
    exit()

if not raw_serials:
    print("No serials found in CSV. Exiting.")
    exit()

# 3. Validate Serial Numbers against Jamf Inventory
print(f"Checking Jamf to verify {len(raw_serials)} devices exist...")
valid_serials = []
missing_serials = []

headers_json = {
    "Authorization": f"Bearer {token}",
    "Accept": "application/json"
}

for serial in raw_serials:
    # Make a quick GET request to see if the computer exists
    check_url = f"{JAMF_URL}/JSSResource/computers/serialnumber/{serial}"
    check_response = requests.get(check_url, headers=headers_json)
    
    if check_response.status_code == 200:
        valid_serials.append(serial)
    else:
        missing_serials.append(serial)

# 4. Handle Missing Devices
if missing_serials:
    print(f"\n[WARNING] {len(missing_serials)} devices were NOT found in Jamf.")
    with open(MISSING_FILE, mode='w') as file:
        for missing in missing_serials:
            file.write(f"{missing}\n")
    print(f"Created list of missing devices here: {MISSING_FILE}\n")
else:
    print("All devices found in Jamf!")

# 5. Build XML Payload and Add Valid Devices to Group
if not valid_serials:
    print("There are no valid devices to add to the group. Exiting.")
    exit()

print(f"Building XML payload for {len(valid_serials)} valid devices...")
xml_payload = f"<computer_group><id>{GROUP_ID}</id><computer_additions>"

for serial in valid_serials:
    xml_payload += f"<computer><serial_number>{serial}</serial_number></computer>"

xml_payload += "</computer_additions></computer_group>"

print("Uploading valid devices to Jamf Pro static group...")
group_url = f"{JAMF_URL}/JSSResource/computergroups/id/{GROUP_ID}"
headers_xml = {
    "Authorization": f"Bearer {token}",
    "Content-Type": "application/xml",
    "Accept": "application/xml"
}

put_response = requests.put(group_url, headers=headers_xml, data=xml_payload.encode('utf-8'))

if put_response.status_code in (200, 201):
    print(f"Success! {len(valid_serials)} devices have been added to Static Group {GROUP_ID}.")
else:
    print(f"Failed to update group. Status: {put_response.status_code}")
    print(put_response.text)

print("Script finished.")
