How to use:
Save the script as script.sh and make it executable:


chmod +x script.sh
For a single domain:

./script.sh data.txt (target.com)


This will create a file named (target.com).txt containing only URLs starting with https:// or http:// related to (target.com).

For multiple domains: If you have a file called urls.txt with domains:


./script.sh data.txt urls.txt
