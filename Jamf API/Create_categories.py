import os
import requests
from dotenv import load_dotenv

# 1. Load our secret credentials from the .env file
load_dotenv()
JAMF_URL = os.getenv("JAMF_URL", "").rstrip("/")
CLIENT_ID = os.getenv("JAMF_CLIENT_ID")
CLIENT_SECRET = os.getenv("JAMF_CLIENT_SECRET")


# 2. A simple list of the categories we want to create
CATEGORIES_TO_CREATE = [
    "Security & Compliance",
    "Identity & Access",
    "Software & Browsers",
    "OS Updates & Patching",
    "User Experience & Branding",
    "Testing & QA"
]

def get_jamf_token():
    """Step 1: Log in and get our temporary access pass (token)."""
    url = f"{JAMF_URL}/api/v1/oauth/token"
    
    # We tell Jamf we are sending a web form
    headers = {"Content-Type": "application/x-www-form-urlencoded"}
    
    # Our login details
    payload = {
        "client_id": CLIENT_ID,
        "client_secret": CLIENT_SECRET,
        "grant_type": "client_credentials",
    }

    try:
        # Send the login request
        response = requests.post(url, headers=headers, data=payload)
        response.raise_for_status() # Check for errors
        
        # Extract the token from the response
        token = response.json().get("access_token")
        print("✅ Successfully logged in and got the token!")
        return token
    except Exception as e:
        print(f"❌ Failed to get token: {e}")
        return None

# def create_categories(token, categories):
    """Step 2: Go through our list and create each category."""
    endpoint = f"{JAMF_URL}/api/v1/categories"
    
    # We use the token to prove we are allowed to do this
    headers = {
        "Authorization": f"Bearer {token}",
        "Accept": "application/json",
        "Content-Type": "application/json",
    }

    print(f"\n--- Starting to create {len(categories)} categories ---")
    
    # Loop through each name in our list one by one
    for name in categories:
        payload = {"name": name, "priority": 9}
        
        try:
            # Send the request to create the category
            response = requests.post(endpoint, headers=headers, json=payload)
            
            # If the category already exists, Jamf sends back a '409' status code
            if response.status_code == 409:
                print(f"⏭️  Skipped: '{name}' (It already exists)")
            else:
                # Check for other errors
                response.raise_for_status()
                print(f"✅ Created: '{name}'")
                
        except Exception as e:
            print(f"❌ Error creating '{name}': {e}")
            
    print("--- Finished! ---\n")

# def get_categories(token):
    """Step 2: Fetch all existing categories from Jamf Pro."""
    # Point exactly to the endpoint we tested in the Swagger UI
    endpoint = f"{JAMF_URL}/api/v1/categories"
    
    # We pass the token to prove we have permission to read this data
    headers = {
        "Authorization": f"Bearer {token}",
        "Accept": "application/json"
    }

    print("\n--- Fetching Categories ---")
    
    try:
        # Notice we are using requests.get() here to read data
        response = requests.get(endpoint, headers=headers)
        response.raise_for_status() # Check for errors like a 401 Unauthorized
        
        # Convert the JSON response into a Python dictionary we can read
        data = response.json()
        
        # Jamf stores the actual list of categories inside a key called 'results'
        categories_list = data.get("results", [])
        
        print(f"✅ Found {len(categories_list)} categories. Here they are:\n")
        
        # Loop through the list and print out the name and ID of each one
        for category in categories_list:
            print(f"📁 Name: {category['name']}  |  ID: {category['id']}")
            
    except Exception as e:
        print(f"❌ Error fetching categories: {e}")






def logout(token):
    """Step 3: Destroy the token so nobody else can use it."""
    endpoint = f"{JAMF_URL}/api/v1/auth/invalidate-token"
    headers = {"Authorization": f"Bearer {token}"}
    
    requests.post(endpoint, headers=headers)
    print("🔒 Successfully logged out (token invalidated).")

# --- THIS IS WHERE THE SCRIPT ACTUALLY STARTS RUNNING ---
if __name__ == "__main__":
    
    # 1. Get the token
    my_token = get_jamf_token()
    
    # 2. If we successfully got the token, create the categories

    if my_token:
        # get_categories(my_token)
        # create_categories(my_token, CATEGORIES_TO_CREATE)

        # 3. Always log out at the end to be safe
        logout(my_token)