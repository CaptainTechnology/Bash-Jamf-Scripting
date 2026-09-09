# python --version

print("Welcome to Python Buddy!")

# comments

"""
this is multi line comment

"""

# x=10
# y=20
# print(x,y)
# print(x+y)
# print(x*y)

# x = 4       # x is of type int
# x = "Sally" # x is now of type str
# print(x)

# x = str(3)    # x will be '3'
# y = int(3)    # y will be 3
# z = float(3)  # z will be 3.0

# print(type(x))
# print(type(y))
# print(type(z))


#snake_case_variable use this becouse it's most useful , alway use this

# my_name="captain"
# my_name="captainnik" #overrite
# print(my_name)
#     # print(34) # will give error



# x = "John"
# # is the same as
# x = 'John'
# print(x)

# a = 4
# A = "Sally"
# #A will not overwrite a

# x, y, z = "Orange", "Banana", "Cherry"
# print(x)
# print(y)
# print(z)

# # a,b=10 # error variable and value must be same

# x = y = z = "Orange"
# print(x)
# print(y)
# print(z)

# x=10,20,30 
# print(x) # (10,20,30) !hahahah

# fruits = ["apple", "banana", "cherry"] #unpack list
# x, y, z = fruits
# print(x)
# print(y)
# print(z)


# output variables

# x = "Python"
# y = "is"
# z = "awesome"
# print(x, y, z) # use this always

# x = "Python "
# y = "is "
# z = "awesome"
# a=23
# print(x+y+z) #adding
# # print(a+x) # Error , that why we should use comma seprated

# x = 5
# y = 10
# print(x+y)

# global variable # defined outside all the function

# If you create a variable with the same name inside a function, this variable will be local, and can only be used inside the function. The global variable with the same name will remain as it was, global and with the original value

global_variable=10

def my_fun1():
    global_variable=20 # it will act as local variable ! hahaha
    print("this work as local variable : ",global_variable)
   
def my_fun2():
    print("global variable : ",global_variable) # will be changed based on the function call location

def my_fun3():
    global global_variable # now we are accessing global variable here
    global_variable="Changed Global Variable"

my_fun2()
my_fun3()
my_fun1()
my_fun2()
print(global_variable) # here it will be changed



print(response)

if response.status_code == 200:
    name = "captain"
    print("Successfully retrieved data")
else:
    print("Failed")

print(name) # accesable becoue if else doesn't create seprate scope treat as global

name = "Anees"   # Global

def test():
    print(name)  # Can access global variable

test()
print(name)      # Can access global variable

#scoping # ac
def test():
    name = "Anees"   # Local
    print(name)      # ✅ Works

test()

print(name)          # ❌ Error