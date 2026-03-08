### 1. Common Syntax for Ansible Ad-Hoc Commands
```bash
ansible <host-pattern> -m <module> -a "<module-arguments>" [options]
```

Explanation:
```table
Part	                    Meaning
<host-pattern>	            Target host or group of hosts (from inventory or IP)
-m <module>	            Ansible module to use (e.g., copy, command, yum)
-a "<module-arguments>"	    Arguments for the module (depends on the module)
[options]	            Optional flags, e.g., -b for sudo, --ask-become-pass for sudo password prompt
```
---

### 2. Examples

***Example 1: Copy a file to remote server***
```bash
ansible 10.211.55.9 -m copy -a "src=/home/paul/hello.txt dest=/tmp/script mode=0644" -b --ask-become-pass
```

What it does:
```html
• Copies hell.txt from local /home/paul/ to remote /tmp/script
• Sets file permission to 644
• Uses sudo on remote host (asks for password)
```
---

***Example 2: Install a package on remote server***
```bash
ansible all -m yum -a "name=nginx state=present" -b --ask-become-pass
```

What it does:
```html
• Installs nginx on all hosts in inventory
• Uses sudo (-b) because installing packages requires root
```
---
### Tips:
```table
• -m command → run any shell command
• -m service → start/stop services
• -m shell → run shell commands with pipes, redirects, etc.
```
---