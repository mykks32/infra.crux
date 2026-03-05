# Linux Commands Reference Guide

A comprehensive reference for Linux commands organized by category, covering syntax, descriptions, and usage examples.

---

## Table of Contents

1. [Basic Commands](#1-basic-commands)
2. [File Management](#2-file-management)
3. [Utility Commands](#3-utility-commands)
4. [Zip / Unzip](#4-zip--unzip)
5. [Download & Package Management](#5-download--package-management)
6. [Access Remote Server](#6-access-remote-server)
7. [Working with Permissions](#7-working-with-permissions)
8. [Memory Info](#8-memory-info)
9. [System Info](#9-system-info)
10. [Process Management](#10-process-management)
11. [Networking Info](#11-networking-info)
12. [User Creation & Scheduling](#12-user-creation--scheduling)

---

## 1. Basic Commands

### 1. `pwd` — Print Working Directory
**Syntax:** `pwd`  
**Description:** Displays the full path of the current working directory.

```bash
$ pwd
/home/user/documents
```

---

### 2. `whoami` — Current User
**Syntax:** `whoami`  
**Description:** Prints the username of the currently logged-in user.

```bash
$ whoami
john
```

---

### 3. `date` — Display or Set Date/Time
**Syntax:** `date [OPTION]... [+FORMAT]`  
**Description:** Displays the current date and time, or sets the system date.

```bash
$ date
Thu Mar  5 10:30:00 UTC 2026

$ date "+%Y-%m-%d"
2026-03-05

$ date "+%H:%M:%S"
10:30:00
```

---

### 4. `ls` — List Directory Contents
**Syntax:** `ls [OPTION]... [FILE]...`  
**Description:** Lists files and directories in the specified (or current) directory.

| Option | Description |
|--------|-------------|
| `-l`   | Long listing format |
| `-a`   | Show hidden files |
| `-h`   | Human-readable file sizes |
| `-r`   | Reverse order |
| `-t`   | Sort by modification time |

```bash
$ ls
Documents  Downloads  Pictures

$ ls -la
drwxr-xr-x 2 john john 4096 Mar 5 10:00 Documents

$ ls -lh /var/log
-rw-r--r-- 1 root root 1.2M Mar 5 09:00 syslog
```

---

### 5. `clear` — Clear Terminal Screen
**Syntax:** `clear`  
**Description:** Clears all text from the terminal screen.

```bash
$ clear
```

---

## 2. File Management

### 6. `cat` — Concatenate and Display Files
**Syntax:** `cat [OPTION]... [FILE]...`  
**Description:** Reads files and outputs their content to standard output. Also used to concatenate files.

```bash
$ cat file.txt
Hello, World!

$ cat file1.txt file2.txt > combined.txt

$ cat -n file.txt        # Show line numbers
     1  Hello, World!
```

---

### 7. `less` — View File (Scrollable)
**Syntax:** `less [OPTION] FILE`  
**Description:** Opens a file for reading with scroll support. Press `q` to quit, `/` to search.

```bash
$ less /var/log/syslog
$ less +F /var/log/syslog   # Follow mode (like tail -f)
```

---

### 8. `more` — View File Page by Page
**Syntax:** `more [OPTION] FILE`  
**Description:** Displays file content one screen at a time. Press `Space` to advance, `q` to quit.

```bash
$ more /etc/passwd
$ ls -la | more
```

---

### 9. `touch` — Create Empty File / Update Timestamps
**Syntax:** `touch [OPTION]... FILE...`  
**Description:** Creates a new empty file, or updates the access/modification timestamp of an existing file.

```bash
$ touch newfile.txt
$ touch -t 202601010000 file.txt    # Set specific timestamp
$ touch file1.txt file2.txt file3.txt
```

---

### 10. `rm` — Remove Files or Directories
**Syntax:** `rm [OPTION]... FILE...`  
**Description:** Deletes files or directories permanently.

| Option | Description |
|--------|-------------|
| `-r`   | Recursive (for directories) |
| `-f`   | Force, no prompt |
| `-i`   | Interactive prompt before each removal |

```bash
$ rm file.txt
$ rm -rf old_directory/
$ rm -i *.log               # Prompt before each deletion
```

> ⚠️ **Warning:** `rm -rf` is irreversible. Double-check before running.

---

### 11. `vi` — Visual Editor
**Syntax:** `vi [FILE]`  
**Description:** A powerful terminal-based text editor. Opens in command mode; press `i` to insert, `Esc` to exit insert mode, `:wq` to save and quit.

```bash
$ vi config.txt

# Common commands inside vi:
# i         → Insert mode
# Esc       → Return to command mode
# :w        → Save
# :q        → Quit
# :wq       → Save and quit
# :q!       → Quit without saving
# dd        → Delete line
# yy        → Copy (yank) line
# p         → Paste
```

---

### 12. `nano` — Simple Text Editor
**Syntax:** `nano [OPTION] [FILE]`  
**Description:** A beginner-friendly terminal text editor with on-screen shortcuts.

```bash
$ nano file.txt
$ nano +10 file.txt         # Open at line 10

# Key shortcuts:
# Ctrl+O  → Save
# Ctrl+X  → Exit
# Ctrl+W  → Search
# Ctrl+K  → Cut line
# Ctrl+U  → Paste
```

---

### 13. `mkdir` — Make Directory
**Syntax:** `mkdir [OPTION]... DIRECTORY...`  
**Description:** Creates one or more new directories.

```bash
$ mkdir projects
$ mkdir -p projects/web/src     # Create nested directories
$ mkdir dir1 dir2 dir3          # Create multiple at once
```

---

### 14. `rmdir` — Remove Empty Directory
**Syntax:** `rmdir [OPTION]... DIRECTORY...`  
**Description:** Removes empty directories only.

```bash
$ rmdir empty_folder
$ rmdir -p a/b/c                # Remove nested empty dirs
```

---

### 16. `cd` — Change Directory
**Syntax:** `cd [DIRECTORY]`  
**Description:** Changes the current working directory.

```bash
$ cd /home/user/documents
$ cd ..                         # Go up one level
$ cd ~                          # Go to home directory
$ cd -                          # Go to previous directory
```

---

### 18. `cp` — Copy Files and Directories
**Syntax:** `cp [OPTION]... SOURCE DEST`  
**Description:** Copies files or directories from source to destination.

```bash
$ cp file.txt backup.txt
$ cp -r folder/ backup_folder/  # Copy directory recursively
$ cp -p file.txt /tmp/          # Preserve file attributes
```

---

### 19. `mv` — Move or Rename Files
**Syntax:** `mv [OPTION]... SOURCE DEST`  
**Description:** Moves files/directories to a new location, or renames them.

```bash
$ mv old_name.txt new_name.txt  # Rename
$ mv file.txt /tmp/             # Move to another directory
$ mv *.txt archive/             # Move multiple files
```

---

### 20. `head` — Display Beginning of File
**Syntax:** `head [OPTION]... [FILE]...`  
**Description:** Outputs the first N lines of a file (default: 10).

```bash
$ head file.txt
$ head -n 20 file.txt           # Show first 20 lines
$ head -c 100 file.txt          # Show first 100 bytes
```

---

### 21. `tail` — Display End of File
**Syntax:** `tail [OPTION]... [FILE]...`  
**Description:** Outputs the last N lines of a file. `-f` follows the file in real time.

```bash
$ tail file.txt
$ tail -n 50 file.txt
$ tail -f /var/log/syslog       # Live log monitoring
```

---

### 22. `sort` — Sort Lines of Text
**Syntax:** `sort [OPTION]... [FILE]...`  
**Description:** Sorts lines of text alphabetically or numerically.

```bash
$ sort names.txt
$ sort -r names.txt             # Reverse order
$ sort -n numbers.txt           # Numeric sort
$ sort -u file.txt              # Sort and remove duplicates
$ sort -k2 file.txt             # Sort by 2nd column
```

---

### 23. `uniq` — Filter Duplicate Lines
**Syntax:** `uniq [OPTION]... [INPUT [OUTPUT]]`  
**Description:** Removes or reports adjacent duplicate lines. Often used after `sort`.

```bash
$ sort file.txt | uniq
$ sort file.txt | uniq -c       # Count occurrences
$ sort file.txt | uniq -d       # Show only duplicates
```

---

### 24. `split` — Split a File into Pieces
**Syntax:** `split [OPTION]... [FILE [PREFIX]]`  
**Description:** Splits a file into multiple smaller files.

```bash
$ split -l 100 large.txt part_  # Split into 100-line chunks
$ split -b 1M bigfile.bin chunk_ # Split into 1MB chunks
```

---

### 25. `grep` — Search Text Using Patterns
**Syntax:** `grep [OPTION]... PATTERN [FILE]...`  
**Description:** Searches for lines matching a pattern (regular expressions supported).

```bash
$ grep "error" logfile.txt
$ grep -i "error" logfile.txt   # Case-insensitive
$ grep -r "TODO" ./src/         # Recursive search
$ grep -n "function" script.sh  # Show line numbers
$ grep -v "debug" logfile.txt   # Invert match (exclude)
```

---

### 26. `egrep` — Extended Grep
**Syntax:** `egrep [OPTION]... PATTERN [FILE]...`  
**Description:** Like `grep` but supports extended regular expressions. Equivalent to `grep -E`.

```bash
$ egrep "error|warning" log.txt
$ egrep "[0-9]{3}-[0-9]{4}" contacts.txt
$ egrep "^(root|admin)" /etc/passwd
```

---

### 28. `shuf` — Shuffle Lines Randomly
**Syntax:** `shuf [OPTION]... [FILE]...`  
**Description:** Randomly permutes lines of input.

```bash
$ shuf names.txt
$ shuf -n 5 names.txt           # Pick 5 random lines
$ shuf -i 1-100 -n 10          # 10 random numbers from 1-100
```

---

### 29. `wc` — Word Count
**Syntax:** `wc [OPTION]... [FILE]...`  
**Description:** Counts lines, words, and bytes in a file.

```bash
$ wc file.txt
  42  300 1800 file.txt          # lines  words  bytes

$ wc -l file.txt                 # Lines only
$ wc -w file.txt                 # Words only
$ wc -c file.txt                 # Bytes only
```

---

### 30. `cmp` — Compare Two Files Byte by Byte
**Syntax:** `cmp [OPTION]... FILE1 FILE2`  
**Description:** Reports the first byte and line where two files differ.

```bash
$ cmp file1.txt file2.txt
file1.txt file2.txt differ: byte 42, line 3

$ cmp -l file1.txt file2.txt    # List all differing bytes
```

---

### 31. `diff` — Show Differences Between Files
**Syntax:** `diff [OPTION]... FILE1 FILE2`  
**Description:** Compares files line by line and shows the differences.

```bash
$ diff original.txt updated.txt
$ diff -u original.txt updated.txt   # Unified format (patch-style)
$ diff -r dir1/ dir2/                # Compare directories
```

---

### 32. `find` — Search for Files
**Syntax:** `find [PATH] [EXPRESSION]`  
**Description:** Searches for files in a directory hierarchy based on name, type, size, date, and more.

```bash
$ find /home -name "*.txt"
$ find . -type f -mtime -7          # Modified in last 7 days
$ find /tmp -size +10M              # Files larger than 10MB
$ find . -name "*.log" -delete      # Find and delete
$ find / -user john -type f         # Files owned by john
```

---

### 33. `updatedb` — Update File Database
**Syntax:** `updatedb [OPTION]...`  
**Description:** Updates the database used by `locate`. Usually run as root or via cron.

```bash
$ sudo updatedb
```

---

### 34. `locate` — Find Files Quickly
**Syntax:** `locate [OPTION]... PATTERN`  
**Description:** Searches a pre-built database (updated by `updatedb`) for matching filenames — much faster than `find`.

```bash
$ locate passwd
$ locate -i readme              # Case-insensitive
$ locate "*.conf" | head -20
```

---

## 3. Utility Commands

### 35. `history` — Command History
**Syntax:** `history [N]`  
**Description:** Displays previously run commands. Use `!N` to re-run command number N.

```bash
$ history
$ history 20                    # Last 20 commands
$ !42                           # Re-run command #42
$ !!                            # Re-run last command
$ history -c                    # Clear history
```

---

### 36. `help` — Built-in Shell Help
**Syntax:** `help [COMMAND]`  
**Description:** Displays help for bash built-in commands.

```bash
$ help cd
$ help for
$ help                          # List all built-ins
```

---

### 37. `man` — Manual Pages
**Syntax:** `man [OPTION] [SECTION] COMMAND`  
**Description:** Opens the manual page for a command. Press `q` to quit, `/` to search.

```bash
$ man ls
$ man 5 passwd                  # Section 5 (file formats)
$ man -k "copy file"            # Search by keyword
```

---

### 38. `which` — Locate a Command
**Syntax:** `which [OPTION] COMMAND...`  
**Description:** Shows the full path of a command's executable.

```bash
$ which python3
/usr/bin/python3

$ which bash
/bin/bash
```

---

### 39. `bc` — Basic Calculator
**Syntax:** `bc [OPTION]... [FILE]...`  
**Description:** An arbitrary-precision calculator. Use `-l` for math library (enables `sqrt`, `sin`, etc.).

```bash
$ echo "5 * 3 + 2" | bc
17

$ echo "scale=4; 22/7" | bc     # 4 decimal places
3.1428

$ bc -l <<< "sqrt(2)"
1.41421356237309504880
```

---

### 40. `cal` — Display Calendar
**Syntax:** `cal [OPTION] [[MONTH] YEAR]`  
**Description:** Displays a calendar for the current or specified month/year.

```bash
$ cal
$ cal 3 2026                    # March 2026
$ cal -y                        # Full current year
$ cal -3                        # Previous, current, next month
```

---

### 41. `uptime` — System Uptime
**Syntax:** `uptime [OPTION]`  
**Description:** Shows how long the system has been running, along with load averages.

```bash
$ uptime
10:30:00 up 3 days,  4:15,  2 users,  load average: 0.12, 0.08, 0.05

$ uptime -p                     # Pretty format
up 3 days, 4 hours, 15 minutes
```

---

### 42. `script` — Record Terminal Session
**Syntax:** `script [OPTION]... [FILE]`  
**Description:** Records everything printed to the terminal into a file (default: `typescript`).

```bash
$ script session.log            # Start recording
$ script -a session.log         # Append to existing file
# Type 'exit' or Ctrl+D to stop recording
```

---

### 43. `alias` — Create Command Shortcuts
**Syntax:** `alias [name='command']`  
**Description:** Creates a shorthand alias for a longer command. Add to `~/.bashrc` to persist.

```bash
$ alias ll='ls -la'
$ alias gs='git status'
$ alias ..='cd ..'
$ alias                         # List all current aliases
$ unalias ll                    # Remove an alias
```

---

## 4. Zip / Unzip

### 44 & 45. `gzip` / `gunzip` — Compress and Decompress Files
**Syntax:** `gzip [OPTION]... FILE...` / `gunzip [OPTION]... FILE...`  
**Description:** Compresses files using the GNU zip format (`.gz`). The original file is replaced by the compressed version.

```bash
$ gzip file.txt                 # Creates file.txt.gz
$ gzip -k file.txt              # Keep original file
$ gzip -d file.txt.gz           # Decompress (same as gunzip)
$ gunzip file.txt.gz            # Decompress
$ gzip -9 file.txt              # Maximum compression
$ gzip -l file.txt.gz           # Show compression stats
```

---

### 46. `tar` — Archive Files
**Syntax:** `tar [OPTION]... [FILE]...`  
**Description:** Creates and extracts archive files (`.tar`, `.tar.gz`, `.tar.bz2`). Does not compress by default unless combined with flags.

| Flag | Description |
|------|-------------|
| `-c` | Create archive |
| `-x` | Extract archive |
| `-v` | Verbose output |
| `-f` | Specify filename |
| `-z` | Use gzip compression |
| `-j` | Use bzip2 compression |

```bash
$ tar -cvf archive.tar folder/           # Create tar
$ tar -czvf archive.tar.gz folder/       # Create compressed tar.gz
$ tar -xvf archive.tar                   # Extract tar
$ tar -xzvf archive.tar.gz -C /tmp/      # Extract to /tmp
$ tar -tvf archive.tar                   # List contents
```

---

### 47. `zip` — Package and Compress Files
**Syntax:** `zip [OPTION]... ZIPFILE FILES...`  
**Description:** Creates a ZIP archive from files and directories.

```bash
$ zip archive.zip file1.txt file2.txt
$ zip -r archive.zip folder/            # Include directory recursively
$ zip -9 archive.zip file.txt           # Maximum compression
$ zip -e archive.zip file.txt           # Encrypt with password
```

---

### 48. `unzip` — Extract ZIP Archives
**Syntax:** `unzip [OPTION]... ZIPFILE [FILES]`  
**Description:** Extracts files from a ZIP archive.

```bash
$ unzip archive.zip
$ unzip archive.zip -d /tmp/            # Extract to specific directory
$ unzip -l archive.zip                  # List contents without extracting
$ unzip -o archive.zip                  # Overwrite without prompting
```

---

## 5. Download & Package Management

### 49. `wget` — Download Files from Web
**Syntax:** `wget [OPTION]... URL`  
**Description:** Downloads files from HTTP, HTTPS, or FTP servers.

```bash
$ wget https://example.com/file.zip
$ wget -O custom_name.zip https://example.com/file.zip
$ wget -c https://example.com/large.iso  # Resume download
$ wget -r https://example.com/           # Recursive download
$ wget -q https://example.com/file.txt   # Quiet mode
```

---

### 50. `curl` — Transfer Data with URLs
**Syntax:** `curl [OPTION]... URL`  
**Description:** Transfers data to/from servers. Supports many protocols: HTTP, HTTPS, FTP, SFTP, etc.

```bash
$ curl https://example.com
$ curl -O https://example.com/file.zip          # Download file
$ curl -o output.html https://example.com       # Custom filename
$ curl -X POST -d '{"key":"val"}' https://api.example.com
$ curl -H "Authorization: Bearer TOKEN" https://api.example.com
$ curl -I https://example.com                   # Show headers only
```

---

### 51. `apt` — Package Manager (Debian/Ubuntu)
**Syntax:** `apt [OPTION] COMMAND`  
**Description:** High-level interface for the APT package management system used on Debian-based systems.

```bash
$ sudo apt update                          # Refresh package list
$ sudo apt upgrade                         # Upgrade all packages
$ sudo apt install nginx                   # Install a package
$ sudo apt remove nginx                    # Remove a package
$ sudo apt purge nginx                     # Remove + config files
$ sudo apt search python                   # Search for packages
$ sudo apt show nginx                      # Package details
$ sudo apt autoremove                      # Remove unused packages
```

---

### 52. `rpm` — RPM Package Manager (Red Hat)
**Syntax:** `rpm [OPTION] PACKAGE`  
**Description:** Installs, queries, and removes RPM packages on Red Hat-based systems.

```bash
$ sudo rpm -ivh package.rpm                # Install
$ sudo rpm -Uvh package.rpm                # Upgrade
$ sudo rpm -e package_name                 # Remove
$ rpm -qa                                  # List all installed packages
$ rpm -qi package_name                     # Package info
$ rpm -ql package_name                     # List installed files
```

---

### 53 & 54. `yum` / `dnf` — Package Managers (RHEL/Fedora)
**Syntax:** `yum [OPTION] COMMAND` / `dnf [OPTION] COMMAND`  
**Description:** High-level package managers for Red Hat/CentOS/Fedora. `dnf` is the modern replacement for `yum`.

```bash
$ sudo yum install httpd
$ sudo dnf install nginx
$ sudo dnf update
$ sudo dnf remove package_name
$ sudo dnf search keyword
$ sudo dnf list installed
$ sudo dnf info package_name
```

---

### 55. `systemctl` — Manage System Services
**Syntax:** `systemctl [COMMAND] [SERVICE]`  
**Description:** Controls the systemd system and service manager.

```bash
$ sudo systemctl start nginx
$ sudo systemctl stop nginx
$ sudo systemctl restart nginx
$ sudo systemctl enable nginx              # Start on boot
$ sudo systemctl disable nginx
$ systemctl status nginx
$ systemctl list-units --type=service      # List all services
```

---

### 56. `printenv` — Print Environment Variables
**Syntax:** `printenv [VARIABLE]...`  
**Description:** Prints the value of environment variables.

```bash
$ printenv                                 # Print all variables
$ printenv PATH
$ printenv HOME USER SHELL
```

---

### 57. `export` — Set Environment Variables
**Syntax:** `export [NAME[=VALUE]]...`  
**Description:** Sets and exports environment variables to child processes.

```bash
$ export MY_VAR="Hello"
$ export PATH="$PATH:/opt/myapp/bin"
$ export -p                                # List exported variables
```

---

### 58. `source` — Execute a Script in Current Shell
**Syntax:** `source FILE` or `. FILE`  
**Description:** Reads and executes commands from a file in the current shell session. Used to reload config files.

```bash
$ source ~/.bashrc
$ source ~/.bash_profile
$ . /etc/profile
```

---

### 59. `awk` — Pattern Scanning and Processing
**Syntax:** `awk [OPTION] 'PROGRAM' [FILE]`  
**Description:** A powerful text-processing tool for pattern matching, field extraction, and reporting.

```bash
$ awk '{print $1}' file.txt                # Print first column
$ awk -F: '{print $1}' /etc/passwd         # Use : as delimiter
$ awk '{sum += $1} END {print sum}' nums.txt  # Sum a column
$ awk '/error/ {print NR, $0}' log.txt     # Print matching lines with numbers
$ awk 'NR==5,NR==10' file.txt             # Print lines 5–10
```

---

### 60. `cut` — Extract Columns from Text
**Syntax:** `cut [OPTION]... [FILE]...`  
**Description:** Removes or extracts sections from each line of input.

```bash
$ cut -d: -f1 /etc/passwd                  # Extract usernames
$ cut -c1-10 file.txt                      # Extract characters 1-10
$ cut -d, -f2,4 data.csv                   # Columns 2 and 4 from CSV
```

---

### 61. `sed` — Stream Editor
**Syntax:** `sed [OPTION]... 'SCRIPT' [FILE]...`  
**Description:** Non-interactive text editor for filtering and transforming text streams.

```bash
$ sed 's/old/new/' file.txt                # Replace first occurrence per line
$ sed 's/old/new/g' file.txt               # Replace all occurrences
$ sed -i 's/foo/bar/g' file.txt            # Edit file in-place
$ sed -n '5,10p' file.txt                  # Print lines 5-10
$ sed '/^#/d' config.txt                   # Delete comment lines
```

---

### 62. `tr` — Translate or Delete Characters
**Syntax:** `tr [OPTION]... SET1 [SET2]`  
**Description:** Translates, squeezes, or deletes characters from standard input.

```bash
$ echo "Hello" | tr 'a-z' 'A-Z'           # Uppercase
HELLO

$ echo "hello world" | tr ' ' '_'         # Replace spaces
hello_world

$ echo "aabbcc" | tr -s 'a-z'             # Squeeze repeated chars
abc

$ cat file.txt | tr -d '\r'               # Remove carriage returns
```

---

### 63. `truncate` — Shrink or Extend File Size
**Syntax:** `truncate [OPTION]... FILE...`  
**Description:** Sets a file's size to a specified length.

```bash
$ truncate -s 0 logfile.log               # Empty the file
$ truncate -s 1M file.txt                 # Set file to 1MB
$ truncate -s +500K file.txt              # Increase size by 500KB
```

---

### 64. `echo` — Display Text
**Syntax:** `echo [OPTION]... [STRING]...`  
**Description:** Outputs text to standard output. Commonly used in scripts.

```bash
$ echo "Hello, World!"
$ echo $HOME
$ echo -n "No newline"                    # Suppress trailing newline
$ echo -e "Line1\nLine2"                  # Enable escape sequences
$ echo "text" >> file.txt                 # Append to file
```

---

### 65. `su` — Switch User
**Syntax:** `su [OPTION] [USERNAME]`  
**Description:** Switches to another user account. Defaults to root if no user specified.

```bash
$ su root
$ su - john                               # Switch and load john's environment
$ su -c "command" username                # Run single command as user
```

---

### 66. `exit` — Exit Shell or Script
**Syntax:** `exit [N]`  
**Description:** Exits the current shell or script. N is the exit status (0 = success).

```bash
$ exit
$ exit 0                                  # Successful exit
$ exit 1                                  # Exit with error
```

---

## 6. Access Remote Server

### 68. `ssh` — Secure Shell
**Syntax:** `ssh [OPTION] [USER@]HOST`  
**Description:** Connects to a remote machine securely over an encrypted channel.

```bash
$ ssh user@192.168.1.10
$ ssh -p 2222 user@host.com               # Custom port
$ ssh -i ~/.ssh/mykey.pem user@host.com   # Use specific key
$ ssh user@host "ls /var/log"             # Run remote command
$ ssh -L 8080:localhost:80 user@host      # Port forwarding
```

---

### 69. `scp` — Secure Copy
**Syntax:** `scp [OPTION] SOURCE DESTINATION`  
**Description:** Copies files between local and remote systems over SSH.

```bash
$ scp file.txt user@host:/remote/path/
$ scp user@host:/remote/file.txt ./       # Download from remote
$ scp -r folder/ user@host:/remote/       # Copy directory
$ scp -P 2222 file.txt user@host:/tmp/    # Custom port
```

---

## 7. Working with Permissions

### 70. `chmod` — Change File Permissions
**Syntax:** `chmod [OPTION]... MODE FILE...`  
**Description:** Changes the access permissions of files or directories. Permissions: `r`=4, `w`=2, `x`=1.

```bash
$ chmod 755 script.sh                     # rwxr-xr-x
$ chmod 644 file.txt                      # rw-r--r--
$ chmod +x script.sh                      # Add execute for all
$ chmod -R 755 folder/                    # Recursive
$ chmod u=rwx,g=rx,o=r file.txt          # Symbolic notation

# Permission reference:
# 7 = rwx, 6 = rw-, 5 = r-x, 4 = r--, 0 = ---
```

---

### 71. `chown` — Change File Owner
**Syntax:** `chown [OPTION]... [OWNER][:[GROUP]] FILE...`  
**Description:** Changes the ownership of a file or directory.

```bash
$ sudo chown john file.txt
$ sudo chown john:developers file.txt     # Change owner and group
$ sudo chown -R www-data /var/www/        # Recursive
$ sudo chown :staff file.txt              # Change group only
```

---

### 72. `chgrp` — Change Group Ownership
**Syntax:** `chgrp [OPTION]... GROUP FILE...`  
**Description:** Changes the group ownership of files or directories.

```bash
$ sudo chgrp developers project/
$ sudo chgrp -R staff /srv/shared/       # Recursive
$ chgrp $(id -gn) file.txt              # Set to current group
```

---

## 8. Memory Info

### 73. `free` — Display Memory Usage
**Syntax:** `free [OPTION]`  
**Description:** Shows total, used, and available RAM and swap memory.

```bash
$ free
$ free -h                                 # Human-readable (GB/MB)
$ free -m                                 # In megabytes
$ free -s 5                               # Refresh every 5 seconds
```

---

### 74. `top` — Real-Time Process Monitor
**Syntax:** `top [OPTION]`  
**Description:** Displays a live, dynamic view of running processes, CPU, and memory usage. Press `q` to quit.

```bash
$ top
$ top -u john                             # Filter by user
$ top -n 5                                # Refresh 5 times then exit

# Interactive keys in top:
# k → Kill process (enter PID)
# M → Sort by memory
# P → Sort by CPU
# q → Quit
```

---

### 75. `du` — Disk Usage of Files
**Syntax:** `du [OPTION]... [FILE]...`  
**Description:** Estimates the disk space used by files and directories.

```bash
$ du -h folder/                           # Human-readable
$ du -sh folder/                          # Summary only
$ du -ah /var/log/                        # All files, human-readable
$ du -h --max-depth=1 /                   # Top-level directories
$ du -sh * | sort -h                      # Sort by size
```

---

### 76. `df` — Disk Space of Filesystems
**Syntax:** `df [OPTION]... [FILE]...`  
**Description:** Reports available disk space on all mounted filesystems.

```bash
$ df -h                                   # Human-readable
$ df -T                                   # Show filesystem type
$ df /home                                # Specific mount point
$ df -i                                   # Show inode usage
```

---

## 9. System Info

### 77. `hostname` — Show or Set Hostname
**Syntax:** `hostname [OPTION] [NAME]`  
**Description:** Displays or sets the system's network hostname.

```bash
$ hostname
myserver

$ hostname -I                             # Show IP addresses
$ hostname -f                             # Fully qualified domain name
$ sudo hostname newname                   # Set hostname temporarily
```

---

### 78. `lscpu` — CPU Architecture Info
**Syntax:** `lscpu [OPTION]`  
**Description:** Displays detailed information about the CPU architecture.

```bash
$ lscpu
$ lscpu | grep "CPU(s)"                   # Number of CPUs
$ lscpu | grep "Model name"               # CPU model
```

---

### 79. `arch` — Machine Architecture
**Syntax:** `arch`  
**Description:** Prints the machine hardware name (e.g., `x86_64`, `aarch64`).

```bash
$ arch
x86_64
```

---

### 80. `lsblk` — List Block Devices
**Syntax:** `lsblk [OPTION]... [DEVICE]`  
**Description:** Lists all block devices (disks, partitions) in a tree format.

```bash
$ lsblk
$ lsblk -f                                # Show filesystem info
$ lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT
```

---

### 81. `uname` — System Information
**Syntax:** `uname [OPTION]`  
**Description:** Prints system information (kernel version, OS, hardware platform, etc.).

```bash
$ uname -a                                # All information
$ uname -r                                # Kernel release
$ uname -s                                # Kernel name
$ uname -m                                # Machine hardware
$ uname -n                                # Network hostname
```

---

## 10. Process Management

### 82. `ps` — List Running Processes
**Syntax:** `ps [OPTION]`  
**Description:** Displays a snapshot of current running processes.

```bash
$ ps
$ ps aux                                  # All processes (detailed)
$ ps aux | grep nginx
$ ps -ef                                  # Full format listing
$ ps -u john                              # Processes by user
```

---

### 83. `pgrep` — Find Process by Name
**Syntax:** `pgrep [OPTION]... PATTERN`  
**Description:** Looks up processes by name and returns their PIDs.

```bash
$ pgrep nginx
$ pgrep -l python                         # Show names too
$ pgrep -u john                           # Processes by user
$ pgrep -x bash                           # Exact name match
```

---

### 84. `kill` — Kill a Process by PID
**Syntax:** `kill [SIGNAL] PID...`  
**Description:** Sends a signal to a process. Default signal is SIGTERM (15).

```bash
$ kill 1234                               # Graceful termination
$ kill -9 1234                            # Force kill (SIGKILL)
$ kill -l                                 # List all signals
$ kill -SIGSTOP 1234                      # Pause process
$ kill -SIGCONT 1234                      # Resume process
```

---

### 85. `pkill` — Kill Process by Name
**Syntax:** `pkill [OPTION]... PATTERN`  
**Description:** Sends a signal to processes matching a name pattern. Avoids needing to look up PIDs manually.

```bash
$ pkill nginx
$ pkill -9 chrome                         # Force kill all chrome
$ pkill -u john                           # Kill all of john's processes
```

---

### 86. `jobs` — List Background Jobs
**Syntax:** `jobs [OPTION] [JOBSPEC]`  
**Description:** Lists currently active jobs (background/suspended processes) in the current shell.

```bash
$ jobs
[1]-  Running    sleep 100 &
[2]+  Stopped    vim file.txt
```

---

### 87. `bg` — Resume Job in Background
**Syntax:** `bg [JOBSPEC]`  
**Description:** Continues a suspended job in the background.

```bash
$ bg %1                                   # Resume job 1 in background
$ bg                                      # Resume most recent stopped job
```

---

### 88. `fg` — Bring Job to Foreground
**Syntax:** `fg [JOBSPEC]`  
**Description:** Brings a background or suspended job to the foreground.

```bash
$ fg %1                                   # Bring job 1 to foreground
$ fg                                      # Bring most recent job forward
```

---

### 89. `nohup` — Run Command Immune to Hangups
**Syntax:** `nohup COMMAND [ARG]...`  
**Description:** Runs a command that persists after the terminal is closed (immune to SIGHUP). Output goes to `nohup.out`.

```bash
$ nohup ./long_script.sh &
$ nohup python3 server.py > server.log 2>&1 &
```

---

## 11. Networking Info

### 90. `ifconfig` — Network Interface Configuration
**Syntax:** `ifconfig [INTERFACE] [OPTION]`  
**Description:** Configures or displays network interface parameters. (Deprecated in favor of `ip`, but still widely used.)

```bash
$ ifconfig                                # Show all interfaces
$ ifconfig eth0                           # Show specific interface
$ sudo ifconfig eth0 192.168.1.50        # Assign IP address
$ sudo ifconfig eth0 up                  # Enable interface
$ sudo ifconfig eth0 down                # Disable interface
```

---

### 92. `ping` — Test Network Connectivity
**Syntax:** `ping [OPTION]... HOST`  
**Description:** Sends ICMP echo requests to test if a host is reachable.

```bash
$ ping google.com
$ ping -c 4 google.com                    # Send exactly 4 packets
$ ping -i 2 google.com                    # Send every 2 seconds
$ ping -s 1024 host.com                   # Custom packet size
```

---

### 92. `telnet` — Remote Login Protocol
**Syntax:** `telnet HOST [PORT]`  
**Description:** Connects to a remote host using the Telnet protocol. Also useful for testing port connectivity.

```bash
$ telnet 192.168.1.1 80                   # Test if port 80 is open
$ telnet smtp.example.com 25             # Test SMTP connection
```

> ⚠️ Telnet transmits data in plaintext. Use SSH for secure connections.

---

### 93. `netstat` — Network Statistics
**Syntax:** `netstat [OPTION]`  
**Description:** Displays network connections, routing tables, and interface statistics. (Being replaced by `ss`.)

```bash
$ netstat -tuln                           # TCP/UDP listening ports
$ netstat -an                             # All connections
$ netstat -rn                             # Routing table
$ netstat -p                              # Show process using socket
```

---

### 94. `traceroute` — Trace Network Path
**Syntax:** `traceroute [OPTION] HOST`  
**Description:** Displays the route packets take to reach a network host, showing each hop.

```bash
$ traceroute google.com
$ traceroute -m 15 google.com            # Limit to 15 hops
$ traceroute -n google.com               # No DNS resolution (faster)
```

---

### 95. `reboot` — Restart the System
**Syntax:** `reboot [OPTION]`  
**Description:** Reboots the system. Requires superuser privileges.

```bash
$ sudo reboot
$ sudo reboot --force                     # Force reboot
```

---

### 96. `shutdown` — Power Off or Restart
**Syntax:** `shutdown [OPTION] [TIME] [MESSAGE]`  
**Description:** Safely shuts down or reboots the system, with optional delay and broadcast message.

```bash
$ sudo shutdown -h now                    # Halt immediately
$ sudo shutdown -r now                    # Reboot immediately
$ sudo shutdown -h +10 "Maintenance"     # Shutdown in 10 minutes
$ sudo shutdown -c                        # Cancel scheduled shutdown
```

---

## 12. User Creation & Scheduling

### 97. `useradd` — Create a New User
**Syntax:** `useradd [OPTION]... LOGIN`  
**Description:** Creates a new user account.

```bash
$ sudo useradd john
$ sudo useradd -m john                    # Create home directory
$ sudo useradd -m -s /bin/bash john       # With bash shell
$ sudo useradd -m -G sudo,developers john # With groups
$ sudo useradd -e 2026-12-31 john         # Set expiry date
```

---

### 98. `passwd` — Set or Change Password
**Syntax:** `passwd [OPTION] [USER]`  
**Description:** Changes the password for a user account.

```bash
$ passwd                                  # Change your own password
$ sudo passwd john                        # Change another user's password
$ sudo passwd -l john                     # Lock account
$ sudo passwd -u john                     # Unlock account
$ sudo passwd -e john                     # Force password change on next login
```

---

### 100. `id` — Show User Identity
**Syntax:** `id [OPTION]... [USER]`  
**Description:** Prints real and effective user/group IDs.

```bash
$ id
uid=1000(john) gid=1000(john) groups=1000(john),27(sudo)

$ id john                                 # Show another user's ID
$ id -u                                   # Print UID only
$ id -g                                   # Print GID only
$ id -G                                   # Print all group IDs
```

---

### 101. `userdel` — Delete a User
**Syntax:** `userdel [OPTION] LOGIN`  
**Description:** Removes a user account from the system.

```bash
$ sudo userdel john
$ sudo userdel -r john                    # Also remove home directory and mail
```

---

### 102. `groupdel` — Delete a Group
**Syntax:** `groupdel GROUP`  
**Description:** Removes a group from the system. The group must have no members.

```bash
$ sudo groupdel developers
```

---

### 103. `at` — Schedule One-Time Task
**Syntax:** `at TIME`  
**Description:** Schedules a command to be executed once at a specified time.

```bash
$ at now + 5 minutes
at> echo "reminder" >> /tmp/reminder.txt
at> <Ctrl+D>

$ at 14:30
$ at midnight
$ atq                                     # List pending jobs
$ atrm 3                                  # Remove job #3
```

---

### 104. `crontab` — Schedule Recurring Tasks
**Syntax:** `crontab [OPTION] [FILE]`  
**Description:** Manages cron jobs — commands scheduled to run at regular intervals.

**Cron format:** `MIN HOUR DAY MONTH WEEKDAY command`

```bash
$ crontab -e                              # Edit crontab
$ crontab -l                              # List current crontab
$ crontab -r                              # Remove crontab

# Examples (inside crontab -e):
# Run every day at midnight:
0 0 * * * /home/john/backup.sh

# Run every Monday at 9 AM:
0 9 * * 1 /usr/local/bin/weekly_report.sh

# Run every 5 minutes:
*/5 * * * * /home/john/monitor.sh

# Run on 1st of every month at 6 AM:
0 6 1 * * /home/john/monthly_cleanup.sh
```

| Field   | Allowed Values |
|---------|----------------|
| Minute  | 0–59 |
| Hour    | 0–23 |
| Day     | 1–31 |
| Month   | 1–12 |
| Weekday | 0–7 (0 and 7 = Sunday) |

---