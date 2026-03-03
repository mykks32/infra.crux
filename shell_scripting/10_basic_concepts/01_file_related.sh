#!/bin/bash

# basename - strip directory info and only give filename

# dirname - strip the filename and gives directory path

# realpath - gives you full path for a file

#!/bin/bash

# Example file path
file="/home/user/projects/test/example.txt"

echo "Original Path: $file"
# Output -> Original Path: /home/user/projects/test/example.txt

echo "Basename (filename only):"
basename "$file"
# Output -> Basename (filename only): example.txt

echo "Dirname (directory path only):"
dirname "$file"
# Output -> Dirname (directory path only): /home/user/projects/test

echo "Realpath (absolute path):"
realpath "$file"
# Output -> realpath: /home/user/projects/test/example.txt: No such file or directory
