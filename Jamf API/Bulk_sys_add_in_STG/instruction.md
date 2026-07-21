# SOP: Add Multiple Macs to a Static Group in Jamf Pro Using Python

## Prerequisites

- Jamf Pro Administrator access
- Static Computer Group
- API Client (Client ID & Client Secret)
- Python 3
- `requests` library (`pip3 install requests`)
- CSV file containing serial numbers

---

## Step 1: Create a Static Computer Group

1. Go to **Computers → Computer Groups**.
2. Click **New**.
3. Select **Static Computer Group**.
4. Enter a name and click **Save**.

---

## Step 2: Get the Static Group ID

Open the Static Group and note the **Group ID** from the URL.

Example:

```
https://jamftechnology.jamfcloud.com/computergroups.html?id=97&o=r
```

**Group ID = 97**

---

## Step 3: Create an API Role

Go to:

**Settings → System → API Roles and Clients → API Roles**

Create a new role and assign:

- Computers → **Read**
- Computer Groups → **Read**
- Computer Groups → **Update**

Save the role.

---

## Step 4: Create an API Client

Go to:

**Settings → System → API Roles and Clients → API Clients**

1. Create a new API Client.
2. Assign the API Role.
3. Enable **Client Credentials**.
4. Generate the **Client Secret**.
5. Copy the **Client ID** and **Client Secret**.

---

## Step 5: Prepare the CSV File

Create a file named **serials.csv**.

Example:

```csv
C02ABCDE12345
C02ABCDE12346
C02ABCDE12347
```

---

## Step 6: Configure the Python Script

Update the following values:

```python : add_to_static_group.py # this is complete script file
JAMF_URL = "https://jamftechnology.jamfcloud.com"
CLIENT_ID = "YOUR_CLIENT_ID"
CLIENT_SECRET = "YOUR_CLIENT_SECRET"
GROUP_ID = 97
CSV_FILE = "/path/to/serials.csv"
```

---

## Step 7: Run the Script

Open Terminal and navigate to the script location:

```bash
cd "/Users/username/Desktop/Bulk_sys_add_in_STG/Jamf API"
```

Run:

```bash
python3 add_to_static_group.py
```

---

## Script Workflow

```
Authenticate to Jamf
        ↓
Read Serial Numbers from CSV
        ↓
Find Computer ID for each Serial Number
        ↓
Add Computer ID to Static Group
        ↓
Repeat until all devices are added
```

---

## Verify

Go to:

**Computers → Computer Groups → Your Static Group**

Verify that all devices have been added successfully.

> **Note:** Jamf Pro requires **Computer IDs**, so the script first looks up each serial number and then adds the corresponding Computer ID to the Static Group.