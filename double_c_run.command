#!/bin/bash

echo "next line by default work even if error happen"

this is the error

echo "this is next line ofter error"

set -e
#  this is used to terminat the script if error happen

echo "first line ofter set -e"

hello "i'm " erro
echo "this will not execute becouse error heppend"

# work diffrent using zsh or bash
# arr=(a b c)
# echo $arr

echo $UID #login user id
echo $RANDOM # random number will be genrated
