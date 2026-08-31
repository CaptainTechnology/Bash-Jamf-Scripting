import requests
from dotenv import load_dotenv 
import os
# if .env is in another location then load_dotenv("/location/jamf.env") but best method use .env in same folder scturcte

load_dotenv()

print(load_dotenv())
Jamf_url=os.getenv("JAMF_URL","").rstrip("/") # remove /from last if exist
Client_id=os.getenv("JAMF_CLIENT_ID")
Client_secret=os.getenv("JAMF_CLIENT_SECRET")

# print(Jamf_url)
# print(Client_id)
# print(Client_secret)

url=f"{Jamf_url}/api/v1/categories"

def Get_jamf_token():
    url = f"{Jamf_url}/api/v1/oauth/token"
    headers = {"Content-Type": "application/x-www-form-urlencoded"}
    payload = {
        "client_id": Client_id,
        "client_secret": Client_secret,
        "grant_type": "client_credentials",
    }

    try:
       # Send the login request
        response = requests.post(url, headers=headers, data=payload)
        response.raise_for_status() # Check for errors and handle the error
        token = response.json().get("access_token") # every time token will be diffrent and will auto expired in 60 secend
        return token
    except Exception as e:
        print(f"Failed to get token : {e}")
        return None

def Invalidate_token(token):
    """Step 3: Destroy the token so nobody else can use it."""
    endpoint = f"{Jamf_url}/api/v1/auth/invalidate-token"
    headers = {"Authorization": f"Bearer {token}"}
    
    requests.post(endpoint, headers=headers)
    print("🔒 Successfully logged out (token invalidated).")

def Get_categories(token):
    url=f"{Jamf_url}/api/v1/categories"
    headers={
        "Authorization":f"Bearer {token}",
        "Accept":"application/json"
    }

    try:
        response=requests.get(url,headers=headers)
        response.raise_for_status()
        data=response.json() # now it's in the form of directory
        return data
    except Exception as e:
        print(f"Error occured : {e}")

def Add_Category(token,category):
    url=f"{Jamf_url}/api/v1/categories"
    headers={
        "Authorization":f"Bearer {token}",
        "Accept":"application/json",
        "Content-Type": "application/json"
    }
    # payload={
    #     "name": "New Category3",
    #     "priority": 8
    # }

    try:
        # payload={
        #     "name":"Category 4",
        #     "priority":8
        # }
        response=requests.post(url,headers=headers,json=category)
        response.raise_for_status()
        print(response.json())
    except Exception as e:
        print(f"Error occured : {e}")

def Add_Categories(token,categories):
    url=f"{Jamf_url}/api/v1/categories"
    # print(categories)
    # print(categories[0])
    headers={
        "Authorization":f"Bearer {token}",
        "Accept":"application/json",
        "Content-type":"application/json"
    }
    for category in categories:
        try:
            response=requests.post(url,headers=headers,json=category)
            response.raise_for_status()  # most useful even if you don't want to see the error
            print("Category Created : ", response.json())
        except Exception as e:
            print(f"Error occured : {e}")

# category delete methods




if __name__ == "__main__":
    token=Get_jamf_token()
    if token:
        categories_data=Get_categories(token)
        # print(categories_data)
        # print(categories_data["totalCount"])
        # Add_Category(token,{"name": "New Category 5","priority": 8 })
        # categories=({"name": "New Category 6","priority": 7 },{"name": "New Category 10","priority": 9 })
        # Add_Categories(token,categories)

        # Invalidate_token(token)

