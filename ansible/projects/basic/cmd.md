## To run your playbook without --ask-pass and --ask-become-pass, 
you need SSH key authentication and passwordless sudo.

### Step 1: Generate SSH Key (on your Mac)

***Check if you already have a key:***
```bash
ls ~/.ssh
```

***If you don’t see id_rsa or id_ed25519, create one:***
```bash
ssh-keygen -t ed25519
```

***Press Enter for all prompts.***

This creates:
```bash
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

---

### Step 2: Copy Key to Servers

Run:
```bash
ssh-copy-id -i ~/.ssh/mykks32.pub mykks32@192.168.64.6
```
***Enter the password one last time.***

This installs the key into:
```bash
~/.ssh/authorized_keys
```

---

### Step 3: Enable Passwordless Sudo on Servers

SSH into each VM:
```bash
ssh -i ~/.ssh/mykks32 mykks32@192.168.64.6
```
If it does not ask for password, SSH keys work.

---

### Step 4: Tell Ansible Which Key to Use

***Update inventory.ini.***
```bash
[webservers]
serverA ansible_host=192.168.101.26 ansible_user=mykks ansible_ssh_private_key_file=~/.ssh/mykks32
```
No --ask-pass.

Check it via:
```bash
ansible serverA -m ping
```

### Step 5: Enable Passwordless Sudo on Servers

Edit sudoers:
```bash
sudo visudo
```

Add this line:
```txt
mykks32 ALL=(ALL) NOPASSWD: ALL
```
No --ask-become-pass disappears

### 5. Run Ansible Playbook
Make sure your inventory.ini looks like:
```bash
[webservers]
192.168.64.6 ansible_user=mykks32 ansible_ssh_private_key_file=~/.ssh/mykks32
```

Now workflow becomes:
```bash
ansible -i inventory.ini webservers -m ping
ansible-playbook -i inventory.ini install_nginx.yml
```