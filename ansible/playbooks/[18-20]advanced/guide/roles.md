## Ansible Roles

In **Ansible**, **roles** are a way to organize tasks, handlers, variables, and files in a standardized structure.  
Roles make playbooks reusable, modular, and easier to maintain.

---

### 1. Role Directory Structure

A typical role has the following structure:

```
my_role/
├── defaults/
│   └── main.yml        # Default variables
├── files/
│   └── ...             # Static files to copy
├── handlers/
│   └── main.yml        # Handlers (e.g., service restart)
├── meta/
│   └── main.yml        # Role metadata, dependencies
├── tasks/
│   └── main.yml        # Main tasks
├── templates/
│   └── ...             # Jinja2 templates
├── vars/
│   └── main.yml        # Variables with higher precedence
└── README.md
```

---

### 2. Creating a Role

Use the `ansible-galaxy` command:

```bash
ansible-galaxy init my_role
```

This generates the folder structure automatically.

---

### 3. Using a Role in a Playbook

```yaml
- hosts: webservers
  roles:
    - my_role
```

> This will execute all tasks in `my_role/tasks/main.yml`.

---

### 4. Role with Variables

**defaults/main.yml**:

```yaml
package_name: nginx
service_name: nginx
```

**tasks/main.yml**:

```yaml
- name: Install package
  apt:
    name: "{{ package_name }}"
    state: present

- name: Ensure service is running
  service:
    name: "{{ service_name }}"
    state: started
```

**Playbook**:

```yaml
- hosts: webservers
  roles:
    - role: my_role
      vars:
        package_name: apache2
        service_name: apache2
```

> Role variables can be overridden in the playbook.

---

### 5. Role Dependencies

Roles can depend on other roles.  
**meta/main.yml** example:

```yaml
dependencies:
  - role: common
  - role: firewall
```

When `my_role` runs, `common` and `firewall` roles will execute first.

---

### 6. Role with Handlers

**handlers/main.yml**:

```yaml
- name: restart nginx
  service:
    name: nginx
    state: restarted
```

**tasks/main.yml**:

```yaml
- name: Copy nginx config
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: restart nginx
```

> The handler runs only if the task notifies it.

---

### 7. Using Multiple Roles

```yaml
- hosts: all
  roles:
    - common
    - webserver
    - database
```

> Roles are executed in the order listed.

---

### 8. Best Practices for Roles

- Use **defaults** for variables that can be overridden.
- Keep tasks small and modular.
- Use **handlers** for service restarts or notifications.
- Separate files, templates, and vars logically.
- Use **meta/main.yml** for role dependencies.

---

### 9. Example Role Playbook

```yaml
- hosts: webservers
  roles:
    - role: webserver
      vars:
        package_name: nginx
        service_name: nginx
```

> This playbook installs nginx using the `webserver` role with custom variables.

---

### 10. Summary

- Roles provide modularity and reusability.
- Standard folder structure ensures maintainability.
- Combine tasks, handlers, files, templates, and variables.
- Can include dependencies and custom variables.
- Preferred way to organize large Ansible projects.