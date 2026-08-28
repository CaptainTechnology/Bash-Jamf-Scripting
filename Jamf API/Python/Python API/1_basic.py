# 200 OK: Request successful, data returned.
# 201 Created: New resource created.
# 204 No Content: Success but no data returned.
# 400 Bad Request: Invalid request.
# 401 Unauthorized: Missing or invalid API key.
# 500 Internal Server Error: Server encountered an error.

# 200 → Success
# 201 → Created
# 204 → Success, no response body
# 400 → Bad request
# 401 → Unauthorized
# 403 → Forbidden
# 404 → Not found
# 409 → Conflict
# 500 → Server error

import requests
import json

# url="https://jsonplaceholder.typicode.com/users/"

# response=requests.get(url)

# requests
# requests.get(url, params={key: value}, args)

# if response.status_code==200:
#     print("Date received Successfully!")
#     print(response.text)
# else:
#     print(f"Error Happened : {resource.status_code}")

# or better use case

# if response.ok:
#     print("Data received Successfully!")
#     # print(response.text) # alrady in json

#     # convert the data into python directory
#     # data=response.json()
#     # print(data)

#     # For beautiful output: and if you want to store it in a file
#     # print(json.dumps(response.json(), indent=4))
#     # with open ("data.json","w",encoding="utf-8") as f:
#     #     json.dump(response.json(),f,indent=4)
# else:
#     print(f"Error Happened : {resource.status_code}")



# get specific user data

# user_id=1
# url=f"https://jsonplaceholder.typicode.com/users/{user_id}"
# #for example :  https://jamftechnology.jamfcloud.com/api/v1/categories/5


# response=requests.get(url)

# if response.ok:
#     print(f"Data received for UserID : {user_id}")
#     data=response.text
#     print(data)
# else:
#     print(f"Failed to retrieved data : {response.status_code}")


# . GET with query parameters

# Suppose an API has:
# /users?name=Anees&city=Mumbai

# url = "https://example.com/users"
# params={
#     "name":"Anees",
#     "city":"Mumbai"
# }

# response=requests.get(url,params=params)
# print(response.url) 
# #Most Importaint it will create : https://example.com/users?name=Anees&city=Mumbai



# Post request
# requests.post(url, data={key: value}, json={key: value}, args)

# use to create something

# url = "https://jsonplaceholder.typicode.com/posts"
# data={
#     "title": "My first APIs",
#     "body": "Learning Python API",
#     "userId": 1
# }

# response=requests.post(url,json=data)

# if response.ok:
#     print(response.json())
# else:
#     print(response.status_code)


#Put request

# put(url, data, args)


url = "https://jsonplaceholder.typicode.com/posts/1"

# data = {
#     "id": 1,
#     "title": "Updated title",
#     "body": "Updated content",
#     "userId": 1
# }

# response = requests.put(url, json=data)

# print(response.status_code)
# print(response.json())

# patch # change only specific thing

# url = "https://jsonplaceholder.typicode.com/posts/1"

# data = {
#     "title": "New title"
# }

# response = requests.patch(url, json=data)

# print(response.status_code)
# print(response.json())

# import requests

# url = "https://jsonplaceholder.typicode.com/posts/1"

# response = requests.delete(url)

# print(response.status_code)




# headers

url = "https://jsonplaceholder.typicode.com/posts"

headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

# headers = { # for jamf 
#     "Authorization": f"Bearer {token}",
#     "Accept": "application/json",
#     "Content-Type": "application/json"
# }

data = {
    "title": "Python API",
    "body": "Learning requests",
    "userId": 1
}

response = requests.post(
    url,
    headers=headers,
    json=data
)

print(response.status_code)
print(response.json())






# learn later

"""
 # url = "https://jsonplaceholder.typicode.com/posts/1"
 
 # response=requests.get(url)
 # print(response.status_code)
 # if response.status_code==200:
 #     print("data retrived successfully")
 #     print(response.text)
 #     # data=response.json()
 #     # print(json.dumps(data, indent=4))


 # import requests
 # import json
 # api_url="https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&outputsize=full& apikey=demo"
 
 # response=requests.get(api_url)
 
 # # print(response)
 
 # if response.status_code==200:
 #     print("Successfully retrieved data")
 #     print(response)
 #     data=response.json()
 #     # with open("response.json", "w", encoding="utf-8") as f:
 #     #     json.dump(data, f, indent=4)
 #     # print(data)
 # else:
 #     print("Failed")
 
 # # print(data) # accesable becouse if doesnt create seprate scope like local
          
 # first_data=data["Meta Data"]
 # print(first_data)
"""
