


# ls -l >> list.txt # store ls -l data in list.txt ( write )
# ls -l > list.txt # remove all the data and store new one ( overwrite remove previous)

# cp source_file destination_file
# mv source_file destination_directory:
# Options
# The cp command has options to change how it works:
# -r - Copy all files and folders inside a directory
# -i - Ask before replacing files
# -u - Copy only if the source is newer
# -v - Verbose mode, show files being copied

# (
#  # cp "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources"
#  # cp -r "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources"
#  # cp -i "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources"
#  # cp -u "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources" 

#  # mv "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting" 

# )

# rm filename
# Options
# The rm command has options to change how it works:

# -r - Delete a folder and everything inside it
# -i - Ask before deleting each file
# -f - Force delete without asking
# -v - Verbose mode, show files being removed


# touch filename
# touch hello.txt
# if [[ -f hello.txt ]]
# then
#     echo "File information : $(ls -l hello.txt)"
# else
#     echo "File not Found!"
# fi

# information=$(ls -l hello.txt)
# echo $information

# mkdir

# mkdir new_directory
# mkdir -p parent/child # create parent directory as well


# man [command] 


# cat # the cat command is used to show the content of files in the terminal. You can also use it to combine multiple files into one.

# -n - Add numbers to each line
# -b - Add numbers only to lines with text
# -s - Remove extra empty lines
# -v - Show non-printing characters (except for tabs and end of line)

# cat can be used to create the file and overiting the file

# cat > data.js # create file and add the data on it commond+D , remove all the data and add new data or clean file with new data
# cat >> data.txt # add data line by line and ctrl+D # overwrite data and don't remove old data 


# alias ll="ls -l" # ll will work as ls -l

# alias gs="git status" # check git status
# alias la="ls -a"
# unalias gs # remove an alias

# nano ~/.bashrc # add permanant alias add (alias ll='ls -la")
# source ~/.bashrc # now save and apply