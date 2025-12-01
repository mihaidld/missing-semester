#! /bin/sh

# save error logs in log file
for file in $(ls *.sh); do
    if ! grep inuit "$file" > /dev/null 2> /dev/null; then 
        echo "On $(date) file $file does not have any inuit" >>logs.txt;
    fi
done 

