import os
import requests
from dotenv import load_dotenv
import json

# 1. Load our secret credentials from the .env file
load_dotenv()
JAMF_URL = os.getenv("JAMF_URL", "").rstrip("/")
CLIENT_ID = os.getenv("JAMF_CLIENT_ID")
CLIENT_SECRET = os.getenv("JAMF_CLIENT_SECRET")

def get_jamf_token():
    """Step 1: Log in and get our temporary access pass (token)."""
    url = f"{JAMF_URL}/api/v1/oauth/token"
    headers = {"Content-Type": "application/x-www-form-urlencoded"}
    payload = {
        "client_id": CLIENT_ID,
        "client_secret": CLIENT_SECRET,
        "grant_type": "client_credentials",
    }
    try:
        response = requests.post(url, headers=headers, data=payload)
        response.raise_for_status() 
        token = response.json().get("access_token")
        print("✅ Successfully logged in and got the token!")
        return token
    except Exception as e:
        print(f"❌ Failed to get token: {e}")
        return None

def get_config_profiles(token):
    """Step 2: Fetch all macOS Configuration Profiles using the Classic API."""
    endpoint = f"{JAMF_URL}/JSSResource/osxconfigurationprofiles"
    headers = {
        "Authorization": f"Bearer {token}",
        "Accept": "application/json"
    }
    print("\n--- Fetching macOS Configuration Profiles ---")
    try:
        response = requests.get(endpoint, headers=headers)
        response.raise_for_status() 
        data = response.json()
        profiles_list = data.get("os_x_configuration_profiles", [])
        
        print(f"✅ Found {len(profiles_list)} Configuration Profiles.\n")
        
        # Save a local JSON copy for testing purposes
        with open("Profiles.json", "w", encoding="utf-8") as f:
            json.dump(profiles_list, f, indent=4)
            
    except Exception as e:
        print(f"❌ Error fetching profiles: {e}")

# def backup_profile(token, profile_id, filepath):
    """Downloads the raw XML of a single configuration profile."""
    endpoint = f"{JAMF_URL}/JSSResource/osxconfigurationprofiles/id/{profile_id}"
    headers = {
        "Authorization": f"Bearer {token}",
        "Accept": "application/xml"
    }
    try:
        response = requests.get(endpoint, headers=headers)
        response.raise_for_status()
        with open(filepath, "w", encoding="utf-8") as file:
            file.write(response.text)
    except Exception as e:
        print(f"❌ Error backing up profile {profile_id}: {e}")

# def backup_all_profiles(token, folder_name="Jamf_Profile_Backups"):
    """Step 3: Fetches all profiles and backs them up into a specific folder."""
    if not os.path.exists(folder_name):
        os.makedirs(folder_name)
        print(f"\n📁 Created backup folder: '{folder_name}'")
    else:
        print(f"\n📁 Using existing folder: '{folder_name}'")

    endpoint = f"{JAMF_URL}/JSSResource/osxconfigurationprofiles"
    headers = {
        "Authorization": f"Bearer {token}",
        "Accept": "application/json"
    }

    try:
        response = requests.get(endpoint, headers=headers)
        response.raise_for_status() 
        data = response.json()
        profiles_list = data.get("os_x_configuration_profiles", [])
        
        print(f"🔍 Starting backup of {len(profiles_list)} profiles...\n")
        
        for profile in profiles_list:
            profile_id = profile["id"]
            raw_name = profile["name"]
            
            # Clean up the name so it is safe for a file system
            safe_name = "".join([c for c in raw_name if c.isalpha() or c.isdigit() or c == ' ']).rstrip()
            filename = f"{safe_name}_{profile_id}.xml"
            filepath = os.path.join(folder_name, filename)
            
            backup_profile(token, profile_id, filepath)
            
        print(f"✅ All backups completed successfully! Check your '{folder_name}' folder.")
        
    except Exception as e:
        print(f"❌ Error fetching profiles for backup: {e}")


# don't use this , this is working properly but directly changing the profiles genral section
# don't use this , this is working properly but directly changing the profiles genral section
# don't use this , this is working properly but directly changing the profiles genral section
# don't use this , this is working properly but directly changing the profiles genral section

# def update_profile_category(token, profile_id, category_name):
#     """Step 4: Move a configuration profile into a specific category."""
#     endpoint = f"{JAMF_URL}/JSSResource/osxconfigurationprofiles/id/{profile_id}"
#     headers = {
#         "Authorization": f"Bearer {token}",
#         "Content-Type": "application/xml",
#         "Accept": "application/json"
#     }
    
#     # ---------------------------------------------------------
#     # FIX: Clean the ampersand so XML doesn't break
#     safe_category_name = category_name.replace("&", "&amp;")
#     # ---------------------------------------------------------

#     xml_payload = f"""
#     <os_x_configuration_profile>
#         <general>
#             <category>
#                 <name>{safe_category_name}</name>
#             </category>
#         </general>
#     </os_x_configuration_profile>
#     """
#     try:
#         response = requests.put(endpoint, headers=headers, data=xml_payload)
#         response.raise_for_status()
#         print(f"✅ Success! Profile ID {profile_id} is now in '{category_name}'.")
#     except Exception as e:
#         print(f"❌ Error updating profile {profile_id}: {e}")

# def logout(token):
#     """Step 5: Destroy the token so nobody else can use it."""
#     endpoint = f"{JAMF_URL}/api/v1/auth/invalidate-token"
#     headers = {"Authorization": f"Bearer {token}"}
#     requests.post(endpoint, headers=headers)
#     print("\n🔒 Successfully logged out (token invalidated).")

# --- THIS IS WHERE THE SCRIPT ACTUALLY STARTS RUNNING ---
if __name__ == "__main__":
    my_token = get_jamf_token()
    
    if my_token:
        # 1. Fetch profiles and save to JSON (Commented out for now)
        # get_config_profiles(my_token)
        
        # 2. Take a complete backup before making changes (Commented out for now)
        # backup_all_profiles(my_token, folder_name="Jamf_Profile_Backups")

        # 3. Define our mapping of Profile IDs to their new Categories
        # profiles_to_categorize = {
        #     2: "Security & Compliance",
        #     20: "Security & Compliance",
        #     22: "Security & Compliance",
        #     78: "Security & Compliance",
        #     79: "Security & Compliance",
        #     5: "Identity & Access",
        #     11: "Identity & Access",
        #     13: "Identity & Access",
        #     14: "Identity & Access",
        #     16: "Identity & Access",
        #     3: "Software & Browsers",
        #     21: "Software & Browsers",
        #     33: "Software & Browsers",
        #     34: "Software & Browsers",
        #     77: "OS Updates & Patching",
        #     82: "OS Updates & Patching",
        #     12: "User Experience & Branding",
        #     88: "User Experience & Branding",
        #     18: "Testing & QA",
        #     75: "Testing & QA",
        #     80: "Testing & QA",
        #     83: "Testing & QA"
        # }

        # 4. Loop through our dictionary and move each profile
        print("\n--- Starting Bulk Category Move ---")
        # for profile_id, category_name in profiles_to_categorize.items():
        #     update_profile_category(my_token, profile_id, category_name)
            
        # 5. Always log out at the end to be safe
        logout(my_token)