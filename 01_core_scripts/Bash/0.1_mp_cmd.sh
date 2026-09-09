ls -l >> list.txt # store ls -l data in list.txt ( write )
ls -l > list.txt # remove all the data and store new one ( overwrite remove previous)

cp source_file destination_file
mv source_file destination_directory:
Options
The cp command has options to change how it works:
-r - Copy all files and folders inside a directory
-i - Ask before replacing files
-u - Copy only if the source is newer
-v - Verbose mode, show files being copied

(
 # cp "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources"
 # cp -r "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources"
 # cp -i "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources"
 # cp -u "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources" 

 # mv "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Resources/1-basic.sh" "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting" 

)

rm filename
Options
The rm command has options to change how it works:

-r - Delete a folder and everything inside it
-i - Ask before deleting each file
-f - Force delete without asking
-v - Verbose mode, show files being removed


touch filename
touch hello.txt
if [[ -f hello.txt ]]
then
    echo "File information : $(ls -l hello.txt)"
else
    echo "File not Found!"
fi

information=$(ls -l hello.txt)
echo $information

mkdir

mkdir new_directory
mkdir -p parent/child # create parent directory as well


man [command] 


cat # the cat command is used to show the content of files in the terminal. You can also use it to combine multiple files into one.

-n - Add numbers to each line
-b - Add numbers only to lines with text
-s - Remove extra empty lines
-v - Show non-printing characters (except for tabs and end of line)

cat can be used to create the file and overiting the file

cat > data.js # create file and add the data on it commond+D , remove all the data and add new data or clean file with new data
cat >> data.txt # add data line by line and ctrl+D # overwrite data and don't remove old data 


alias ll="ls -l" # ll will work as ls -l

alias gs="git status" # check git status
alias la="ls -a"
unalias gs # remove an alias

nano ~/.bashrc # add permanant alias add (alias ll='ls -la")
source ~/.bashrc # now save and apply



tail /var/log/jamf.log # used to show the last lines

tail /var/log/jamf.log

tail -n 10 /var/log/jamf.log # print last 10 lines
tail -f /var/log/jamf.log # this will grow as new log will be added useful for real time log
tail -fn 10 /var/log/jamf.log # shows last 10 lines as the file grow

head
head /var/log/jamf.log


ps commond used for process
the ps command is used to report a snapshot of current processes.

ps aux #show all process
ps aux | grep -i "jamf" 


top

top on macOS is used to monitor running processes in real time—CPU, memory, process IDs, and system load. It's very useful for Jamf/macOS troubleshooting.

top 
top -s 2 # refresh every 2 second
top -pid 65001

df
df in macOS is used to check disk/storage space. It's very useful for Jamf scripts, especially before installing applications or macOS updates.

df 
df -h 
df -h / # check root disk
df -a # show all file system
df -h / | tail -1 | awk '{print $4}' # show available space
df -h / | tail -1 | awk '{print $3}' # show used space
df -h / | tail -1 | awk '{print $2}' # total disk size

du
-h - Show sizes in human-readable format (e.g., KB, MB)
-s - Show only the total size for each item
-a - Show sizes for all files, not just directories
-c - Produce a grand total
--max-depth=N - Limit the depth of directory traversal

du folder_file
du "Users/nykaa-it/Desktop/Bash-Jamf-Scripting"
du -sh "/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh"

du -ah  # show directory and files and size as well
du -sh .
du -c # grand total as well


free is not supported in mac
vm_stat
top -l 1 | grep PhysMem  # show memory

kill
kill pid
kill -9 pid

pkill "Calendar" # case sensative
sudo pkill -f "process_name"

uptime
18:23  up 2 days, 10 mins, 1 user, load averages: 2.42 2.86 3.15

18:23 # current time
 up 2 days, 10 mins, # system has been up for 2 day 10 min
  1 user,  # current login users
  load averages: 2.42 2.86 3.15 # 

ping : ping in macOS is used to test network connectivity between the Mac and another device/server. It's very useful for Jamf troubleshooting

ping www.google.com
ping -c 4 google.com #ping only 4 packets