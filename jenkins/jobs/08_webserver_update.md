## 1. Goal
* Run an Ansible playbook from Jenkins to deploy or update a web server on a remote CentOS server.
* Ensure the `jenkins` user is in the `wheel` group for sudo access.
---

## 2. Prerequisites

### a. **Add Jenkins to wheel group**
```bash
usermod -aG wheel jenkins
```

### b. Allow wheel group to run sudo without password
```vim
sudo visudo

# add to wheel group
%wheel ALL=(ALL) NOPASSWD: ALL

# add jenkins user to don't ask pass
jenkins ALL=(ALL) NOPASSWD: ALL
```

### c.	Set up SSH access from Jenkins to remote server
```bash
ssh-copy-id jenkins@serverA
```

### d. Install Ansible on Jenkins server
```bash
sudo yum install -y ansible
```

### e. Project Structure
```text
/etc/ansible/playbooks/remote_server:
├── inventory.ini
├── playbook.yml
└── roles
    └── web
        ├── defaults/main.yml
        ├── files/index.html
        ├── handlers/main.yml
        ├── meta/main.yml
        ├── tasks/main.yml
        └── vars/main.yml
```
---

## 3. Jenkins Job Setup

### a. Create Job
- Name: 08_webserver_update 
- Type: Freestyle Project

### b. Add Build Step
- Type: Invoke Ansible Playbook

### c. Configuration:
```jenkins
Playbook Path: /etc/ansible/playbooks/remote_server/playbook.yml

Inventory: /etc/ansible/playbooks/remote_server/inventory.ini

Forks: 5

Extra Variables: ansible_become_pass=YOUR_SUDO_PASSWORD
```
***Note: ansible_become_pass allows Jenkins user to run tasks with sudo on the remote server.***

### d. Inventory Example
***inventory.ini:***
```ini
[webservers]
serverA ansible_host=192.168.1.78 ansible_user=jenkins
```

### e. Playbook Example
**playbook.yml:**
```yaml
---
- name: Run web role
  hosts: webservers
  become: yes
  roles:
    - web
```

### f. Web Role Example
***roles/web/tasks/main.yml:***
```yaml
---
- name: Install nginx
  yum:
    name: nginx
    state: present

- name: Deploy index page
  copy:
    src: index.html
    dest: /var/www/html/index.html

- name: Restart nginx
  service:
    name: nginx
    state: restarted
```

### g. Manual Test
***Run the playbook manually to verify:***
```bash
ansible-playbook /etc/ansible/playbooks/remote_server/playbook.yml -i /etc/ansible/playbooks/remote_server/inventory.ini --extra-vars "ansible_become_pass=YOUR_SUDO_PASSWORD"
```
---

## 4. Expected Result
- Jenkins connects to the remote server via SSH.
- Ansible executes the web role.
- Nginx is installed if missing.
- index.html is deployed.
- Nginx service is restarted. 
- Jenkins build shows: