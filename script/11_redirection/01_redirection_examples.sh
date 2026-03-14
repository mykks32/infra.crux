#!/bin/bash
# Shell Redirection Examples
# Demonstrates basic input/output/error redirection

# 1. Redirect standard output to a file (overwrite)
# Syntax: command > file
# Usage: Saves the output of the command to a file, overwriting it.
echo "Hello World" > output/output.txt

# 2. Append standard output to a file
# Syntax: command >> file
# Usage: Adds output to the end of the file without removing existing content.
echo "Appending another line" >> output/output.txt

# 3. Redirect standard error to a file
# Syntax: command 2> file
# Usage: Saves only error messages to a file.
ls /nonexistent 2> output/error.log

# 4. Redirect both standard output and error to the same file
# Syntax: command > file 2>&1
# Usage: Saves both output and error messages to a single file.
ls /nonexistent > output/combined.log 2>&1
ls >> output/combined.log 2>&1

# 5. Redirect input from a file
# Syntax: command < file
# Usage: Uses the content of a file as input to a command
echo -e "banana\napple\ncherry" > output/fruits.txt
sort < output/fruits.txt > output/sorted_fruits.txt

# 6. Here-document for multi-line input
# Syntax:
#   command <<EOF
#   line1
#   line2
#   EOF
# Usage: Sends multiple lines of input to a command or file
cat <<EOF > output/multi_line.txt
This is line 1
This is line 2
This is line 3
EOF

# 7. Combine append and error redirection
# Syntax: command >> file 2>&1
# Usage: Appends both output and errors to a file
echo "Testing combined append" >> output/combined.log 2>&1

# 8. Summary of redirection symbols
# >   : redirect stdout (overwrite)
# >>  : redirect stdout (append)
# 2>  : redirect stderr
# 2>&1: merge stderr into stdout
# <   : take input from file
# <<EOF: here-document for multi-line input