
#!/bin/bash

# curl stands for Client URL. It allows your Mac to communicate with a URL/server using protocols such as HTTP and HTTPS.
# It's a versatile tool for downloading files, testing APIs, and more.

#!/bin/bash

# ==========================================
# curl Basics - Bash Examples
# ==========================================

# # 1. Basic GET request
# curl https://example.com

# # 2. Download using the remote filename
# curl -O https://example.com/file.pkg

# # 3. Download using a custom filename
# curl -o myfile.pkg https://example.com/file.pkg

# # 4. Display HTTP headers only
# curl -I https://example.com

# # 5. Follow redirects
# curl -L https://example.com

# # 6. Download while following redirects
# curl -L -o installer.pkg https://example.com/download

# # 7. POST request with form data
# curl -X POST https://example.com/api \
#   -d "username=admin&password=123"

# # 8. POST JSON data
# curl -X POST "https://example.com/api/endpoint" \
#   -H "Content-Type: application/json" \
#   -d '{"name":"Test Mac"}'

# # 9. Basic authentication
# curl -u username:password https://example.com/api

# # 10. Bearer token authentication
# TOKEN="your_token_here"
# curl -H "Authorization: Bearer $TOKEN" \
#   https://example.com/api

# # 11. Verbose/debug mode
# curl -v https://example.com

# # 12. Get only the HTTP status code
# STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://example.com)

# echo "HTTP Status: $STATUS"

# # 13. Use curl result in an if statement
# if [[ "$STATUS" == "200" ]]; then
#     echo "Server is reachable"
# else
#     echo "Server returned HTTP $STATUS"
# fi

# wget 
# The wget command is used to download files from the web. It's a powerful tool for downloading single files, entire websites, or even batch downloads.
# wget url

# # 1. Download a file
# wget "https://example.com/file.zip"

# # 2. Download with custom filename
# wget -O "myfile.zip" "https://example.com/file.zip"

# # 3. Continue an interrupted download
# wget -c "https://example.com/file.zip"

# # 4. Download quietly
# wget -q "https://example.com/file.zip"

# # 5. Download recursively (directory)
# wget -r "https://example.com/files/"

# # 6. Recursive download without parent directories
# wget -r -np "https://example.com/files/"

# # 7. Recursive download with cleaner local paths
# wget -r -np -nH --cut-dirs=1 "https://example.com/files/"

# # 8. Download multiple URLs from a file
# wget -i urls.txt

# # 9. Set connection timeout
# wget --timeout=30 "https://example.com/file.zip"

# # 10. Limit download speed
# wget --limit-rate=500k "https://example.com/file.zip"

# # 11. Retry failed downloads
# wget -t 3 "https://example.com/file.zip"

# # 12. Show help
# wget --help




# SSH (Secure Shell) is a secure protocol that allows you to connect to another computer over a network and execute commands remotely.
# ssh username@hostname_or_IP
# ssh admin@192.168.1.50


# ssh -p PORT username@hostname
# default port is 22

# ssh -p 2222 admin@192.168.1.50


# Run a command remotely
# ssh username@hostname "command"
# ssh admin@192.168.1.50 "hostname"
# ssh admin@192.168.1.50 "df -h"
# ssh admin@192.168.1.50

# ssh nykaa-it@172.37.98.67


# practical

# On Mac 2 — Remote Mac
# 1. System Settings → General → Sharing → Remote Login → ON ( ssh nykaa-it@172.37.98.67 )
# ipconfig getifaddr en0 (172.37.98.67)

# On Mac 1 — Your Mac
# ssh username@192.168.1.25 (nykaa-it@172.37.98.67)




