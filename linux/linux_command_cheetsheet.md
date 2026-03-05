> A complete reference with explanations and real-world examples for every command.

---

## Table of Contents
1. [First Time on Terminal](#1-first-time-on-terminal)
2. [Useful Utility Commands](#2-useful-utility-commands)
3. [Installing Applications](#3-installing-applications)
4. [Environment Variables](#4-environment-variables)
5. [String / Text Operations](#5-string--text-operations)
6. [Working with Permissions](#6-working-with-permissions)
7. [Scripting & Automation](#7-scripting--automation)
8. [System Control](#8-system-control)
9. [Firewall Settings](#9-firewall-settings)

---

## 1. First Time on Terminal

### `pwd` — Print Working Directory
Shows the full path of the directory you are currently in. Useful when you are lost navigating folders.
```bash
$ pwd
/home/mprashant/projects
```

---

### `whoami` — Who Am I?
Prints the username of the currently logged-in user. Helpful when switching between multiple accounts.
```bash
$ whoami
mprashant
```

---

### `date` — Show Date and Time
Displays the current system date and time. Can also be used to format output.
```bash
$ date
Thu Mar  5 10:22:45 IST 2026

# Custom format
$ date "+%d-%m-%Y %H:%M"
05-03-2026 10:22
```

---

### `ls` — List Directory Contents
Lists files and folders in the current directory. One of the most commonly used commands.
```bash
$ ls
documents/  notes.txt  script.sh

# Show all files including hidden ones, with details
$ ls -la
drwxr-xr-x  5 mprashant users 4096 Mar  5 10:00 .
-rw-r--r--  1 mprashant users  220 Mar  5 09:00 .bashrc
-rwxr-xr-x  1 mprashant users  512 Mar  5 09:30 script.sh

# Sort by file size
$ ls -lS
```

---

### `clear` — Clear the Terminal
Clears all previous output from the terminal screen. The shortcut `Ctrl + L` does the same thing.
```bash
$ clear
# Screen is now blank and ready for fresh input
```

---

### `cd` — Change Directory
Navigates between directories. It's how you move around the filesystem.
```bash
# Go to a specific path
$ cd /var/log

# Go up one level (parent directory)
$ cd ..

# Go up two levels
$ cd ../..

# Go to home directory
$ cd ~

# Go to previous directory
$ cd -
```

---

### `history` — Command History
Shows a numbered list of all previously run commands. You can re-run any command by its number.
```bash
$ history
  498  ls -la
  499  cd /var/log
  500  cat syslog

# Re-run command number 499
$ !499

# Search history for a keyword
$ history | grep apt
```

---

### `man` — Manual Pages
Opens the full documentation (manual) for any command. Press `q` to quit, arrow keys to scroll.
```bash
$ man ls
$ man chmod
$ man grep

# If man is not available, try --help
$ ls --help
```

---

### `exit` — Exit the Terminal
Closes the current terminal session or logs out of an SSH session.
```bash
$ exit
logout
Connection to 192.168.1.10 closed.
```

---

## 2. Useful Utility Commands

### `echo` — Print Text
Outputs text to the terminal. Commonly used in scripts and to write text into files.
```bash
$ echo "Hello, World!"
Hello, World!

# Write text into a file
$ echo "server=production" > config.txt

# Append text to a file
$ echo "port=8080" >> config.txt

# Print a variable
$ echo "User is: $USER"
User is: mprashant
```

---

### `cat` — View File Contents
Displays the full content of a file in the terminal. Also used to combine multiple files.
```bash
$ cat notes.txt
This is line 1
This is line 2

# View with line numbers
$ cat -n notes.txt
     1  This is line 1
     2  This is line 2

# Combine two files into one
$ cat file1.txt file2.txt > combined.txt
```

---

### `cp` — Copy Files or Directories
Copies a file or directory from one location to another.
```bash
# Copy a file
$ cp report.txt backup_report.txt

# Copy a file to another directory
$ cp report.txt /home/mprashant/backups/

# Copy an entire directory (recursively)
$ cp -r projects/ projects_backup/
```

---

### `mv` — Move or Rename
Moves a file to another location OR renames it (both use the same command).
```bash
# Rename a file
$ mv oldname.txt newname.txt

# Move file to another directory
$ mv report.txt /var/backups/

# Move and rename at the same time
$ mv temp.log /var/log/app_2026.log
```

---

### `rm` — Remove Files or Directories
Permanently deletes files or directories. **There is no Recycle Bin — deleted files cannot be recovered easily.**
```bash
# Delete a single file
$ rm unwanted.txt

# Delete multiple files
$ rm file1.txt file2.txt file3.txt

# Delete a directory and everything inside it
$ rm -rf old_project/

# Ask for confirmation before deleting
$ rm -i important.txt
rm: remove regular file 'important.txt'? y
```

---

### `mkdir` — Make Directory
Creates one or more new directories.
```bash
# Create a single directory
$ mkdir reports

# Create nested directories at once
$ mkdir -p projects/2026/march

# Create multiple directories at once
$ mkdir logs backups temp
```

---

### `touch` — Create Empty File
Creates a new empty file, or updates the timestamp of an existing one.
```bash
$ touch index.html
$ touch style.css script.js

# Create multiple files at once
$ touch file{1..5}.txt
# Creates: file1.txt file2.txt file3.txt file4.txt file5.txt
```

---

### `find` — Search for Files
Searches the filesystem for files matching given criteria. Very powerful.
```bash
# Find by name
$ find /home -name "*.log"

# Find files modified in last 7 days
$ find /var/log -mtime -7

# Find files larger than 100MB
$ find / -size +100M

# Find and delete all .tmp files
$ find /tmp -name "*.tmp" -delete
```

---

### `grep` — Search Inside Files
Searches for a text pattern inside files and prints matching lines.
```bash
# Search in a single file
$ grep "error" /var/log/syslog

# Case-insensitive search
$ grep -i "warning" app.log

# Show line numbers of matches
$ grep -n "TODO" main.py

# Search in all files in a directory
$ grep -r "database" /etc/

# Show lines that do NOT match
$ grep -v "DEBUG" app.log
```

---

### `df` — Disk Free Space
Shows how much disk space is used and available on each partition.
```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        80G   55G   25G  69% /
tmpfs           3.9G  1.2M  3.9G   1% /dev/shm
```

---

### `du` — Disk Usage of Directory
Shows how much space a directory or file is taking up.
```bash
# Size of a single directory
$ du -sh /var/log
240M    /var/log

# Show sizes of all subdirectories
$ du -h --max-depth=1 /home/mprashant

# Find the top 5 largest directories
$ du -h /var | sort -rh | head -5
```

---

### `top` / `htop` — Process Monitor
`top` shows a live view of CPU, memory, and running processes. `htop` is a more user-friendly version.
```bash
$ top
# Press 'q' to quit, 'k' to kill a process by PID

$ htop
# Navigate with arrow keys, F9 to kill, F10 to quit
```

---

### `ps` — Process Status
Lists running processes. Unlike `top`, it gives a one-time snapshot.
```bash
# List all processes
$ ps aux

# Find a specific process
$ ps aux | grep nginx

# Show process tree
$ ps auxf
```

---

### `kill` — Stop a Process
Sends a signal to a process to stop it. You need the process ID (PID) from `ps` or `top`.
```bash
# Gracefully stop a process
$ kill 1234

# Force kill (immediate, no cleanup)
$ kill -9 1234

# Kill by process name
$ killall nginx
```

---

## 3. Installing Applications

### Debian / Ubuntu — `apt`
The standard package manager for Ubuntu, Debian, Mint, and similar distributions.
```bash
# Update package list (always do this first)
$ sudo apt update

# Upgrade all installed packages
$ sudo apt upgrade -y

# Install a package
$ sudo apt install nginx

# Install multiple packages at once
$ sudo apt install git curl wget unzip

# Remove a package
$ sudo apt remove apache2

# Remove package AND its config files
$ sudo apt purge apache2

# Search for a package
$ apt search python3-pip

# Show info about a package
$ apt show nginx
```

---

### Install from .deb file — `dpkg`
Used when you download a `.deb` package directly from a website (like VS Code, Chrome).
```bash
# Install a .deb file
$ sudo dpkg -i vscode_1.87.deb

# Fix any missing dependencies afterward
$ sudo apt install -f

# List all installed packages
$ dpkg -l
```

---

### RHEL / CentOS 7 — `yum`
```bash
$ sudo yum update
$ sudo yum install httpd
$ sudo yum remove httpd
$ sudo yum search php
```

---

### Fedora / RHEL 8+ — `dnf`
```bash
$ sudo dnf update
$ sudo dnf install git
$ sudo dnf remove git
$ sudo dnf search nodejs
```

---

### Install .rpm file — `rpm`
```bash
$ sudo rpm -ivh package.rpm      # Install
$ sudo rpm -Uvh package.rpm      # Upgrade
$ rpm -qa | grep nginx           # Check if installed
```

---

### Snap & Flatpak
Universal package formats that work across distros.
```bash
# Snap
$ sudo snap install vlc
$ sudo snap remove vlc
$ snap list                      # Show installed snaps

# Flatpak
$ flatpak install flathub org.gimp.GIMP
$ flatpak run org.gimp.GIMP
$ flatpak list
```

---

## 4. Environment Variables

Environment variables are named values stored in the shell that programs and scripts can read.

### `printenv` — View All Variables
```bash
# Show all environment variables
$ printenv

# Filter to find a specific one
$ printenv | grep JAVA
```

---

### `echo $VAR` — Read a Variable
```bash
$ echo $HOME
/home/mprashant

$ echo $USER
mprashant

$ echo $SHELL
/bin/bash

$ echo $PWD
/home/mprashant/projects
```

---

### `export` — Set a Variable
Creates or updates a variable that is available to the current session and child processes.
```bash
# Set a variable
$ export APP_ENV=production

# Verify it was set
$ echo $APP_ENV
production

# Use it in a command
$ export DB_HOST=localhost
$ python3 app.py   # app.py can now read DB_HOST
```

---

### `unset` — Remove a Variable
```bash
$ export TEST_VAR=hello
$ echo $TEST_VAR
hello

$ unset TEST_VAR
$ echo $TEST_VAR
                   # empty — variable is gone
```

---

### Modifying `PATH`
`PATH` is a special variable that tells the shell where to look for commands.
```bash
# View current PATH
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

# Add a new directory to PATH (current session only)
$ export PATH=$PATH:/opt/myapp/bin

# Now commands in /opt/myapp/bin work directly
$ myapp --version
```

---

### Making Variables Permanent
Variables set with `export` are lost when you close the terminal. To make them permanent, add them to `~/.bashrc` (for bash) or `~/.zshrc` (for zsh).
```bash
# Open the config file
$ nano ~/.bashrc

# Add these lines at the bottom:
export JAVA_HOME=/usr/lib/jvm/java-17
export PATH=$PATH:$JAVA_HOME/bin
export DB_PASSWORD=mysecretpass

# Save and reload without restarting
$ source ~/.bashrc
```

---

## 5. String / Text Operations

### `grep` — Pattern Search
Already covered in utilities, but here are more text-focused uses:
```bash
# Count number of matching lines
$ grep -c "error" app.log
42

# Show context — 3 lines before and after each match
$ grep -C 3 "fatal" error.log

# Search using regular expression
$ grep -E "ERROR|WARN" app.log

# Match whole word only
$ grep -w "cat" animals.txt   # matches "cat" but not "concatenate"
```

---

### `sed` — Stream Editor
Used to find and replace text, or delete/insert lines in files.
```bash
# Replace first occurrence per line (print to screen)
$ sed 's/foo/bar/' file.txt

# Replace ALL occurrences per line
$ sed 's/foo/bar/g' file.txt

# Edit the file in place (modify actual file)
$ sed -i 's/localhost/192.168.1.5/g' app.config

# Delete lines containing a word
$ sed '/DEBUG/d' app.log

# Print only line 5 to line 10
$ sed -n '5,10p' bigfile.txt

# Insert a line after line 3
$ sed '3a\This is a new line' file.txt
```

---

### `awk` — Text Processing
A powerful tool for processing structured text like CSV or log files, column by column.
```bash
# Print the 1st column of every line
$ awk '{print $1}' /etc/passwd

# Print columns 1 and 3
$ awk '{print $1, $3}' data.txt

# Use comma as delimiter, print 2nd field
$ awk -F',' '{print $2}' users.csv

# Print lines where 3rd column > 100
$ awk '$3 > 100' sales.txt

# Sum up values in column 2
$ awk '{sum += $2} END {print "Total:", sum}' prices.txt
```

---

### `cut` — Extract Columns
Extracts specific fields from each line of a file.
```bash
# Extract 1st field from CSV
$ cut -d',' -f1 data.csv

# Extract fields 1 and 3
$ cut -d',' -f1,3 data.csv

# Extract characters 1 to 10 from each line
$ cut -c1-10 file.txt

# Extract username from /etc/passwd (colon-delimited)
$ cut -d':' -f1 /etc/passwd
```

---

### `sort` — Sort Lines
```bash
# Alphabetical sort
$ sort names.txt

# Reverse sort (Z to A)
$ sort -r names.txt

# Numeric sort
$ sort -n numbers.txt

# Sort by 2nd column
$ sort -k2 data.txt

# Sort and remove duplicates
$ sort -u names.txt
```

---

### `uniq` — Remove Duplicates
Works best when the file is sorted first (duplicates must be adjacent).
```bash
# Remove duplicate lines
$ sort names.txt | uniq

# Count occurrences of each line
$ sort access.log | uniq -c

# Show only lines that appear more than once
$ sort file.txt | uniq -d

# Show only unique (non-repeated) lines
$ sort file.txt | uniq -u
```

---

### `tr` — Translate Characters
Replaces or deletes individual characters.
```bash
# Convert lowercase to uppercase
$ echo "hello world" | tr 'a-z' 'A-Z'
HELLO WORLD

# Replace spaces with underscores
$ echo "my file name" | tr ' ' '_'
my_file_name

# Delete all digits from text
$ echo "phone: 9876543210" | tr -d '0-9'
phone: 

# Remove repeated spaces
$ echo "too   many    spaces" | tr -s ' '
too many spaces
```

---

### `head` and `tail` — View Part of a File
```bash
# First 10 lines
$ head file.txt

# First 20 lines
$ head -n 20 file.txt

# Last 10 lines
$ tail file.txt

# Last 50 lines
$ tail -n 50 app.log

# Watch a log file live (updates in real-time)
$ tail -f /var/log/nginx/access.log

# Watch multiple files at once
$ tail -f /var/log/syslog /var/log/auth.log
```

---

### `wc` — Word / Line / Character Count
```bash
# Count lines
$ wc -l server.log
1024 server.log

# Count words
$ wc -w essay.txt
3452 essay.txt

# Count characters/bytes
$ wc -c file.txt

# Count all three at once
$ wc file.txt
  120  3452  18540 file.txt
```

---

## 6. Working with Permissions

Linux permissions control who can read, write, or execute a file. Every file has three sets of permissions: **owner**, **group**, **others**.

```
-rwxr-xr--
 ^^^       = owner (read + write + execute)
    ^^^    = group (read + execute)
       ^^^ = others (read only)
```

### Permission Numbers
| Number | Permission |
|--------|-----------|
| 7 | rwx (read + write + execute) |
| 6 | rw- (read + write) |
| 5 | r-x (read + execute) |
| 4 | r-- (read only) |
| 0 | --- (no permission) |

---

### `chmod` — Change Permissions
```bash
# Using numbers
$ chmod 755 deploy.sh     # owner: rwx, group: r-x, others: r-x
$ chmod 644 index.html    # owner: rw-, group: r--, others: r--
$ chmod 600 id_rsa        # owner: rw-, nobody else (private key)
$ chmod 777 shared.sh     # everyone can do everything (avoid this)

# Using symbols
$ chmod +x script.sh      # add execute for everyone
$ chmod -w config.txt     # remove write for everyone
$ chmod u+x,g-w file      # add execute for owner, remove write from group

# Apply to all files in a directory
$ chmod -R 755 /var/www/html/
```

---

### `chown` — Change Owner
```bash
# Change owner of a file
$ sudo chown mprashant file.txt

# Change owner and group
$ sudo chown mprashant:developers file.txt

# Change owner recursively for a whole directory
$ sudo chown -R www-data:www-data /var/www/mysite/
```

---

### `chgrp` — Change Group
```bash
$ sudo chgrp developers project/
$ sudo chgrp -R devteam /opt/app/
```

---

### `sudo` — Superuser Do
Runs a command with root (administrator) privileges.
```bash
# Run a single command as root
$ sudo apt install nginx

# Open a file that requires root access
$ sudo nano /etc/hosts

# Switch to a full root shell
$ sudo -i

# Run a command as a different user
$ sudo -u postgres psql
```

---

### ACL — Fine-Grained Permissions
Standard permissions apply to owner/group/others. ACLs let you set permissions for any specific user.
```bash
# View ACL of a file
$ getfacl report.txt

# Grant user 'alice' read+write access to a file
$ setfacl -m u:alice:rw report.txt

# Grant group 'auditors' read-only access
$ setfacl -m g:auditors:r confidential.txt

# Remove ACL for a user
$ setfacl -x u:alice report.txt

# Remove all ACLs
$ setfacl -b report.txt
```

---

## 7. Scripting & Automation

### Running Scripts
```bash
# Run directly with bash
$ bash deploy.sh

# Make it executable, then run directly
$ chmod +x deploy.sh
$ ./deploy.sh

# Run and pass arguments
$ ./backup.sh /home/mprashant /backups
```

---

### Basic Script Structure
```bash
#!/bin/bash
# ↑ This is called a "shebang" — tells the system to use bash

NAME="mprashant"
echo "Hello, $NAME!"

# Conditional
if [ -f "config.txt" ]; then
    echo "Config file found"
else
    echo "Config file missing!"
fi

# Loop
for i in 1 2 3 4 5; do
    echo "Iteration: $i"
done
```

---

### `crontab` — Schedule Recurring Jobs
Cron runs commands automatically at scheduled times.

**Cron time format:** `minute hour day month weekday`
```
*  *  *  *  *   command
│  │  │  │  └── Day of week (0=Sun, 6=Sat)
│  │  │  └───── Month (1-12)
│  │  └──────── Day of month (1-31)
│  └─────────── Hour (0-23)
└────────────── Minute (0-59)
```

```bash
# Open your crontab for editing
$ crontab -e

# ── Example entries ───────────────────────────────
# Run backup every day at 11:30 PM
30 23 * * * /home/mprashant/backup.sh

# Run a cleanup script every Monday at 6 AM
0 6 * * 1 /opt/scripts/cleanup.sh

# Run every 5 minutes
*/5 * * * * /home/mprashant/check_service.sh

# Run on the 1st of every month at midnight
0 0 1 * * /opt/monthly_report.sh
# ──────────────────────────────────────────────────

# List all cron jobs
$ crontab -l

# Remove all cron jobs
$ crontab -r
```

---

### `at` — Schedule a One-Time Job
Runs a command once at a specific future time (unlike cron which repeats).
```bash
# Run a script at 11 PM tonight
$ echo "bash /home/mprashant/backup.sh" | at 23:00

# Run at a specific date and time
$ echo "bash /opt/migrate.sh" | at 02:00 Mar 10

# Run 1 hour from now
$ echo "reboot" | at now + 1 hour

# List pending jobs
$ atq
2   Thu Mar  5 23:00:00 2026 a mprashant

# Cancel job number 2
$ atrm 2
```

---

### Chaining Commands
```bash
# Run cmd2 only if cmd1 succeeds (exit code 0)
$ make && ./run_tests.sh

# Run cmd2 only if cmd1 fails
$ ping -c1 google.com || echo "No internet connection!"

# Run multiple commands sequentially regardless of success
$ apt update ; apt upgrade ; apt autoremove

# Background a long-running command
$ ./long_process.sh &
[1] 4523    # runs in background, you get your prompt back

# Run in background and keep running after logout
$ nohup ./server.sh &
```

---

### Redirection
```bash
# Save output to a file (overwrite)
$ ls -la > filelist.txt

# Append output to a file
$ date >> activity.log

# Redirect errors to a file
$ ./script.sh 2> errors.log

# Redirect both output and errors
$ ./script.sh > all_output.log 2>&1

# Discard output entirely
$ ./noisy_script.sh > /dev/null 2>&1

# Pipe: send output of one command as input to another
$ ps aux | grep python
$ cat access.log | grep "404" | wc -l
$ ls -la | sort -k5 -rn | head -10
```

---

## 8. System Control

### `shutdown` and `reboot`
```bash
# Shutdown immediately
$ sudo shutdown now

# Shutdown after 15 minutes (with warning message)
$ sudo shutdown -h +15 "Server going down for maintenance"

# Cancel a scheduled shutdown
$ sudo shutdown -c

# Reboot immediately
$ sudo reboot
# or
$ sudo shutdown -r now

# Reboot after 5 minutes
$ sudo shutdown -r +5
```

---

### `systemctl` — Manage Services
`systemctl` controls services (background processes) managed by systemd.
```bash
# Start a service
$ sudo systemctl start nginx

# Stop a service
$ sudo systemctl stop nginx

# Restart a service (stop then start)
$ sudo systemctl restart nginx

# Reload config without full restart (if supported)
$ sudo systemctl reload nginx

# Check current status
$ systemctl status nginx
● nginx.service - A high performance web server
     Loaded: loaded (/lib/systemd/system/nginx.service)
     Active: active (running) since Thu 2026-03-05 09:00:01 IST

# Enable service to start automatically on boot
$ sudo systemctl enable nginx

# Disable from auto-start
$ sudo systemctl disable nginx

# Check if service is enabled
$ systemctl is-enabled nginx

# List all running services
$ systemctl list-units --type=service --state=running
```

---

### `journalctl` — View System Logs
```bash
# View all logs for a service
$ journalctl -u nginx

# View logs from today only
$ journalctl -u nginx --since today

# Follow logs in real-time (like tail -f)
$ journalctl -u nginx -f

# View logs from a specific time range
$ journalctl --since "2026-03-05 08:00" --until "2026-03-05 10:00"

# View last 100 lines of system log
$ journalctl -n 100

# View kernel messages only
$ journalctl -k
```

---

### System Information Commands
```bash
# Kernel version and system architecture
$ uname -a
Linux myserver 5.15.0-97-generic #107 SMP x86_64 GNU/Linux

# How long the system has been running + load average
$ uptime
10:30:01 up 5 days, 2:14,  2 users,  load average: 0.45, 0.38, 0.35

# RAM and swap usage
$ free -h
              total   used    free   shared  buff/cache  available
Mem:          7.6G    4.2G    512M   128M    2.9G        3.1G
Swap:         2.0G    256M    1.7G

# CPU information
$ lscpu

# Hardware summary
$ lshw -short
```

---

## 9. Firewall Settings

### `firewall-cmd` — FirewallD (CentOS / RHEL / Fedora)

FirewallD uses "zones" and "rules". By default, changes are temporary (lost on reload) unless you add `--permanent`.

```bash
# Check if firewalld is running
$ sudo firewall-cmd --state
running

# List all active rules, zones, ports, and services
$ sudo firewall-cmd --list-all
public (active)
  target: default
  interfaces: eth0
  services: ssh dhcpv6-client
  ports: 8080/tcp 20201/tcp

# Open a port temporarily (until next reload/reboot)
$ sudo firewall-cmd --add-port=20201/tcp

# Open a port permanently (survives reboots)
$ sudo firewall-cmd --add-port=443/tcp --permanent

# After making permanent changes, always reload
$ sudo firewall-cmd --reload

# Close a port
$ sudo firewall-cmd --remove-port=8080/tcp --permanent
$ sudo firewall-cmd --reload

# Allow a named service (easier than remembering ports)
$ sudo firewall-cmd --add-service=http --permanent
$ sudo firewall-cmd --add-service=https --permanent

# Block a specific IP address
$ sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" reject'

# List open ports only
$ sudo firewall-cmd --list-ports
443/tcp 20201/tcp
```

---

### `ufw` — Uncomplicated Firewall (Ubuntu / Debian)
A simpler firewall tool that wraps iptables.

```bash
# Check status
$ sudo ufw status
Status: active

# Enable the firewall
$ sudo ufw enable

# Disable the firewall
$ sudo ufw disable

# Allow a port
$ sudo ufw allow 22/tcp       # SSH
$ sudo ufw allow 80/tcp       # HTTP
$ sudo ufw allow 443/tcp      # HTTPS
$ sudo ufw allow 20201/tcp    # Custom port

# Allow a named service
$ sudo ufw allow ssh
$ sudo ufw allow http

# Deny a port
$ sudo ufw deny 3306          # Block MySQL from outside

# Allow traffic from a specific IP only
$ sudo ufw allow from 192.168.1.50 to any port 22

# Delete a rule
$ sudo ufw delete allow 80/tcp

# Show rules with line numbers
$ sudo ufw status numbered

# Delete rule by number
$ sudo ufw delete 3

# View detailed status
$ sudo ufw status verbose
```

---

### `iptables` — Low-Level Firewall (Advanced)
The underlying firewall tool on most Linux systems. Powerful but complex.
```bash
# List all rules with details
$ sudo iptables -L -v -n

# Allow incoming HTTP (port 80)
$ sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Allow incoming HTTPS (port 443)
$ sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Block a specific IP
$ sudo iptables -A INPUT -s 10.0.0.5 -j DROP

# Allow established connections (important — add this first)
$ sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Drop all other incoming connections (use carefully!)
$ sudo iptables -A INPUT -j DROP

# Delete a rule (replace -A with -D)
$ sudo iptables -D INPUT -p tcp --dport 80 -j ACCEPT

# Save rules so they survive reboot
$ sudo iptables-save > /etc/iptables/rules.v4

# Restore saved rules
$ sudo iptables-restore < /etc/iptables/rules.v4

# Flush (clear) all rules
$ sudo iptables -F
```

---

## Quick Reference Summary

| Section | Key Commands |
|---------|-------------|
| Navigation | `pwd`, `cd`, `ls`, `clear`, `history` |
| Files | `cp`, `mv`, `rm`, `mkdir`, `touch`, `find` |
| View Files | `cat`, `head`, `tail`, `less`, `grep` |
| Install | `apt`, `yum`, `dnf`, `rpm`, `snap` |
| Env Vars | `export`, `printenv`, `unset`, `source` |
| Text Ops | `grep`, `sed`, `awk`, `cut`, `sort`, `tr` |
| Permissions | `chmod`, `chown`, `chgrp`, `sudo` |
| Automation | `crontab`, `at`, `bash`, `&&`, `\|` |
| Services | `systemctl`, `journalctl` |
| System | `shutdown`, `reboot`, `uptime`, `free` |
| Firewall | `firewall-cmd`, `ufw`, `iptables` |

---

> **Safety Tips:**
> - Always double-check before using `rm -rf` — it permanently deletes everything
> - Test firewall rules before closing your SSH session — you could lock yourself out
> - Use `--permanent` with `firewall-cmd` only when you're sure the rule is correct
> - Make backups before editing system config files with `sed -i`

