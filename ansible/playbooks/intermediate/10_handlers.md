## Handlers in Ansible

**Handlers** are special tasks in Ansible that run **only when notified by another task**.  
They are typically used to **restart or reload services when a configuration file changes**.

Handlers run **only once at the end of the play**, even if multiple tasks notify them.

---

### 1. Basic Syntax

Handlers are defined in a separate `handlers` section.

```yaml
---
- name: Example handler playbook
  hosts: all
  become: true

  tasks:
    - name: Install nginx
      yum:
        name: nginx
        state: present
      notify: restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted
```

**Explanation**

- `notify` triggers the handler.
- The handler runs **only if the task reports a change**.

---

### 2. Example: Restart Service After Config Change

```yaml
---
- name: Configure nginx
  hosts: all
  become: true

  tasks:
    - name: Copy nginx configuration
      copy:
        src: nginx.conf
        dest: /etc/nginx/nginx.conf
      notify: restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted
```

### Workflow

1. Ansible copies the configuration file.
2. If the file changes, the task sends a notification.
3. The handler restarts the service.

---

### 4. Common Use Cases

Handlers are commonly used for:
- Restarting services
- Reloading services
- Restarting databases
- Reloading web servers

Example services:
- nginx
- apache
- mysql
- docker

---

## 5. Handler Execution Flow

```
Task runs
   ↓
Task makes a change
   ↓
Task sends notify
   ↓
Handler triggered
   ↓
Handler runs at end of play
```
---
## 6. Key Points

- Handlers run **only when notified**.
- They run **once at the end of a play**.
- They help **avoid unnecessary service restarts**.
- They keep playbooks **clean and efficient**.

---