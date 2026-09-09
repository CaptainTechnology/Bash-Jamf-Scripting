#!/bin/bash

# function fn {
#     echo "this is function"
# }

# fn

# sFn(){
#     echo "this is second function"
# }

# sFn

# # argument in function

# addition(){
#     local first=$1
#     local second=$2
#     let sum=$first+$second
#     echo $sum
# }

# addition 10 20
# addition 1 2
# addition 5 20

# # sub(){
# #     local first=$1
# #     local second=$2
# #     let sum=$first-$second
# #     echo $sum
# # }

# # sub 10 20

# # mul(){
# #     local first=$1
# #     local second=$2
# #     let sum=$first*$second
# #     echo $sum
# # }
# # mul 2 3

first=10
second=20
fun(){
    local first=$1
    local second=$2
    echo $(($first+$second))
}

fun 40 50