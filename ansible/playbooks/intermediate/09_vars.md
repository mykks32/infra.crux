## Variables in Ansible

Variables in Ansible are used to store values that can be reused in playbooks.  
They help make playbooks **flexible, reusable, and easier to maintain**.
---
### 1. Variable Syntax

Variables are referenced using **Jinja2 syntax**:

```yaml
{{ variable_name }}
```
Example:
```yaml
name: "{{ package_name }}"
```
---

### 2. Defining Variables in a Playbook
Variables can be defined inside the playbook using vars.
```yaml
- name: Install package using variable
  hosts: all
  become: true

  vars:
    package_name: nginx

  tasks:
    - name: Install nginx
      yum:
        name: "{{ package_name }}"
        state: present
```
---

### 3. Variables in Inventory
Variables can also be defined in the inventory file.

***Inventory File***
```yaml
[webservers]
192.168.1.10 ansible_user=centos http_port=80
```
***Playbook Usage***
```yaml
port: "{{ http_port }}"
```
---

### 4. Variables in External Files
Variables can be stored in a separate YAML file.

***vars.yml***
```yaml
package_name: nginx
service_name: nginx
```

***Playbook***
```yaml
- hosts: all
  become: true

  vars_files:
    - vars.yml

  tasks:
    - name: Install package
      yum:
        name: "{{ package_name }}"
        state: present
```
---

### 5. Register Variables
You can store the output of a command in a variable.
```yaml
- name: Check disk space
  command: df -h
  register: disk_output

- name: Display output
  debug:
    var: disk_output.stdout
```

### 6. Variable Types

***String***
```yaml
package: nginx
```
***Number***
```yaml
port: 80
```
***List***
```yaml
packages:
  - nginx
  - git
  - docker
```

***Dictionary***
```yaml
webserver:
  name: nginx
  port: 80
```
---

### 7. Why Use Variables

Variables help to:
```table
• Avoid repeating values
• Make playbooks reusable
• Easily change configurations
• Support multiple environments
```

Example:
```yaml
Development → port 8080
Production → port 80
```
---

