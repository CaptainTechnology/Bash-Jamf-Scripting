print("This is hello file") # this will run automatically when imported in another file

def add(a, b):
    print("addition function")
    return a + b

add(22,33) # this funciton will run directly on another file if imported call funciton and all in below inside __name__

if __name__ == "__main__":
    # below code will run when this file will be execute directly
    print("This is running directly") # this code will not run automatically when import in another file 