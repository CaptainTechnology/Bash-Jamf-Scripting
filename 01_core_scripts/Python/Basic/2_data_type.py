
# Text Type:	str
# Numeric Types:	int, float, complex
# Sequence Types:	list, tuple, range
# Mapping Type:	dict
# Set Types:	set, frozenset
# Boolean Type:	bool
# Binary Types:	bytes, bytearray, memoryview
# None Type:	NoneType

# # Numbers

# x = 1    # int
# y = 2.8  # float
# z = 3+5j # complex
# print(x,type(x))
# print(y,type(y))
# print(z,type(z))

# # conversion

# x = 1    # int
# y = 2.8  # float
# z = 1j   # complex

# #convert from int to float:
# a = float(x)

# #convert from float to int:
# b = int(y)

# #convert from int to complex:
# c = complex(y)

# print(a)
# print(b)
# print(c)

# print(a,type(a))
# print(b,type(b))
# print(c,type(c))


# Random Number
# import random
# print(random.randrange(1,20)) # Float give an error, only intiger

# # casting

# print(str(2),int("4"),float("5"))


# string

# name="captain"
# a = """Lorem ipsum dolor sit amet,
# consectetur adipiscing elit,
# sed do eiusmod tempor incididunt
# ut labore et dolore magna aliqua.
# Line spacing will be as it is"""
# print(a)

# a = "Hello "
# print(a[1]) # 3
# print(len(a))

# for x in "banana":
#   print(x)

# txt = "The best things in life are free!"
# print("free" in txt) # True
# print("games" not in txt) # True


# a = " Hello, World "
# print(a.upper())
# print(a.lower())

# print(a.strip()) # remove white space from bigging and end
# print(a.replace("H","K"))

# #Split # return the list from a string based on seprator

# l=a.split(",")
# print(l,type(l))

# age = 36
#This will produce an error:
# txt = "My name is John, I am "+age
# print(txt)
# Use F-String insted to add the varialbe inside it

# name='captain'
# age=24

# Intro=F"My Name is {name} and I'm {age} Years old" # F 
# print(Intro)
# Intro=f"{name} is a {age} old good person" # f same work F f
# print(Intro)


# price = 59
# txt = f"The price is {price:.2f} dollars" # Peform action on it
# txt = f"The price is {price*33} dollars" # Peform action on it
# print(txt)

# txt = "Hello, welcome to my world."

# x = txt.find("welcome")

# print(x)


#  boolean

# print(10 > 9)
# print(10 == 9)
# print(10 < 9)


# print(bool("Hello"))
# print(bool(15))
# print(bool(0))
# print(bool([]))


# list
# List items can be of any data type:

# thislist = ["apple", "banana", "cherry",True,12]
# print(thislist)
# print(thislist[0])
# print(len(thislist))
# print(thislist[1])
# print(thislist[-1]) # cherry

# if "apple" in thislist:
#     print("Yes apple is present")

# thislist[1] = "blackcurrant"
# print(thislist)
# thislist[1:3] = ["Papaya", "watermelon"]
# print(thislist)

# thislist.append("orange")
# thislist.insert(1,"Graps")

# thislist.remove("cherry")
# thislist.pop()
# thislist.pop(2) # cherry will be remove ( -1 last 1 last secon 2 third from last)
# del thislist[0]
# del thislist
# thislist.clear()
# print(thislist)


thislist = ["apple", "banana", "cherry",True,12,False,"Last Item"]

# for item in thislist:
#     print(f"Item is : {item}")

# for i in range(len(thislist)):
#     print(f"Fruit : {thislist[i]}")

# list1=[1,2,3,4,5]
# # list2=list1
# # list1[0]=786
# # print(list1[0],list1[0]) # both changes

# new_list=[]
# for i in list1:
#     new_list.append(i)

# or 
# mylist = thislist.copy()
# print(new_list)

# thislist = ["Orange", "Mango", "Kiwi", "pineapple", "banana"]
# thislist.sort()
# print(thislist)

# thislist = [100, 50, 65, 82, 23]
# # thislist.sort()
# # print(thislist)

# # thislist = ["orange", "mango", "kiwi", "pineapple", "banana"]
# thislist.sort(reverse = True)
# print(thislist)



# touples
# unchangable and store any data type values in single variable

# tuple1=(1,2,3,"Manager","captain","jack","sparrow",True,False)
# print(tuple1)
# print(tuple1[5])
# # tuple1[0]="changed" # Error

# if "Manager" in tuple1:
#     print("Manager is available in tuple1")

# basically tuple can't be changed (update,remove etc) there is a workaround. You can convert the tuple into a list, change the list, and convert the list back into a tuple.

# x = ("apple", "banana", "cherry")
# y = list(x)
# y[1] = "kiwi"
# x = tuple(y)

# print(x)
# # del x # we can delete the touple completly (work)
# # del x[0] # can't do this
# print(x)

# unpack tuple

# fruits = ("apple", "banana", "cherry")

# (green, yellow, red) = fruits

# print(green)
# print(yellow)
# print(red)

# for fruit in fruits:
#     print(fruit)



# A set is a collection that stores unique values.

# Unordered → No fixed position/index.
# Mutable → You can add or remove values.
# No duplicates → Duplicate values are automatically removed.
# {} or set() → {1, 2, 3} creates a set; set() creates an empty set.

# https://www.w3schools.com/python/python_sets.asp

# myset = {"apple", "banana", "cherry"}
# print(myset)
# # You cannot access items in a set by referring to an index or a key.
# # print(myset[0]) # error

# for x in myset:
#   print(x)

# print("banana" in myset) # True

# myset.add("orange") # not fix where orange will be add
# print(myset)

# thisset = {"apple", "banana", "cherry"} 
# tropical = {"pineapple", "mango", "papaya"}

# thisset.update(tropical) # merging

# print(thisset)

# thisset = {"apple", "banana", "cherry"}

# thisset.remove("banana") 
# # thisset.remove("pineapple") # error use discard insted for safe remove

# print(thisset)

# thisset = {"apple", "banana", "cherry"}

# for x in thisset:
#   print(x)


# directory


# https://www.w3schools.com/python/python_dictionaries.asp
# Dictionaries are used to store data values in key:value pairs.
# A dictionary is a collection which is ordered*, changeable and do not allow duplicates.
# The values in dictionary items can be of any data type:

thisdict = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964,
  # "year":2001 # this will give and erro
  "colors": ["red", "white", "blue"]
}

print(thisdict)
print(thisdict["year"])
print(thisdict["model"])
print(len(thisdict))

keys=thisdict.keys()
values=thisdict.values()
items= thisdict.items()
print(keys)
print(values)
print(items)


