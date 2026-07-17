

# Resource : https://support.jamf.com/en/articles/11004245-grant-full-disk-access-for-application-or-process-name

commond to get application information needed for jamf configuration profile : /usr/bin/codesign --display --requirements - < drag application here>


nykaa-it@TechInfo-FVFDHBDGM6KH Bash-Jamf-Scripting % /usr/bin/codesign --display --requirements - '/Applications/Google
 Chrome.app'
Executable=/Applications/Google Chrome.app/Contents/MacOS/Google Chrome
designated => (identifier "com.google.Chrome" or identifier "com.google.Chrome.beta" or identifier "com.google.Chrome.dev" or identifier "com.google.Chrome.canary") and anchor apple generic and certificate 1[field.1.2.840.113635.100.6.2.6] /* exists */ and certificate leaf[field.1.2.840.113635.100.6.1.13] /* exists */ and certificate leaf[subject.OU] = EQHXZ8M8AV