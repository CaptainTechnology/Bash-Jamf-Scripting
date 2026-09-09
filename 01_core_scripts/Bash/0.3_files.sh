# zip command in macOS, The zip command is used to compress files and folders into a .zip file
# zip [options] archive.zip file

# zip -r backup.zip Documents/ Scripts/ test.txt config.conf

# zip -r backup.zip . # careful zip evering in current directory

# unzip -l backup.zip
# unzip backup.zip
# unzip backup.zip -d destination/
mkdir -p data unzip data.zip -d data # create and unzip into a folder

# unzip -o data1.zip -d datas # unzip without promt replace the existiong file