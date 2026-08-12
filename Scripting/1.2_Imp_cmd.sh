

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