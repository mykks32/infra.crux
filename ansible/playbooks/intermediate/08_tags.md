## Ansible Tags

**Ansible Tags** allow you to run or skip specific tasks in a playbook.  
They are useful when you want to execute only certain parts of a playbook instead of the entire file.

---

### 1. Basic Syntax

Add a `tags` field to a task.

```yaml
tasks:
  - name: Install nginx
    yum:
      name: nginx
      state: present
    tags: install
```
Here install is the tag name.

---

### 2. Running Playbook With Tags

***Run only tasks with a specific tag***
```bash
ansible-playbook playbook.yml --tags install
```
Only tasks tagged install will run.

---

***Skip a specific tag***
```bash
ansible-playbook playbook.yml --skip-tags install
```
Tasks with tag install will be skipped.

---

### 3. Example Playbook With Tags
```yaml
- name: Nginx setup
  hosts: all
  become: true

  tasks:

    # Install nginx
    - name: Install nginx
      yum:
        name: nginx
        state: present
      tags: install

    # Start nginx service
    - name: Start nginx
      service:
        name: nginx
        state: started
        enabled: true
      tags: start

    # Open firewall port
    - name: Open port 80
      firewalld:
        port: 80/tcp
        permanent: true
        state: enabled
        immediate: yes
      tags: firewall
```
---

### 4. Running Specific Tasks

***Run only installation***
```bash
ansible-playbook nginx.yml --tags install
```

***Run only firewall configuration***
```bash
ansible-playbook nginx.yml --tags firewall
```

***Run multiple tags***
```bash
ansible-playbook nginx.yml --tags "install,start"
```


### 5. Why Use Tags

Tags are useful when:
```table
• Playbooks are large
• You want faster execution
• Running tasks during CI/CD
• Testing only specific steps
```
---


