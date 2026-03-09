## Conditions in Ansible

In **Ansible**, conditions are used to control whether a task runs or not.  
Conditions are written using the `when` keyword.

---

### 1. Basic Condition

Runs the task only if the condition is true.

```yaml
- name: Install nginx on Debian/Ubuntu
  apt:
    name: nginx
    state: present
  when: ansible_os_family == "Debian"
```

---

### 2. Condition with Variables

```yaml
- name: Print message if user is admin
  debug:
    msg: "User is admin"
  when: user_role == "admin"
```

---

### 3. Multiple Conditions (Using `and` / `or`)

```yaml
- name: Run task if Ubuntu version 20
  debug:
    msg: "Ubuntu 20 detected"
  when: ansible_distribution == "Ubuntu" and ansible_distribution_major_version == "20"
```

---

### 4. Multiple Conditions (List Style)

Cleaner and recommended method.

```yaml
- name: Run task if both conditions are true
  debug:
    msg: "Conditions passed"
  when:
    - ansible_os_family == "Debian"
    - ansible_distribution_major_version == "20"
```

All conditions must evaluate to **true**.

---

### 5. Condition with Registered Variables

```yaml
- name: Check nginx installation
  command: nginx -v
  register: nginx_check
  ignore_errors: yes

- name: Install nginx if not installed
  apt:
    name: nginx
    state: present
  when: nginx_check.rc != 0
```

`rc` = return code.

---

### 6. Condition in Loops

```yaml
- name: Install packages only if enabled
  apt:
    name: "{{ item.name }}"
    state: present
  loop:
    - { name: "git", enabled: true }
    - { name: "htop", enabled: false }
  when: item.enabled
```

---

### 7. Check if Variable is Defined

```yaml
- name: Run only if variable exists
  debug:
    msg: "Variable exists"
  when: my_var is defined
```

---

### 8. Using `not` in Condition

```yaml
- name: Run if service is not installed
  debug:
    msg: "Service missing"
  when: not service_installed
```

---

### 9. Common Operators in Ansible Conditions

| Operator | Meaning |
|----------|---------|
| `==` | Equal to |
| `!=` | Not equal |
| `>` | Greater than |
| `<` | Less than |
| `and` | Logical AND |
| `or` | Logical OR |
| `not` | Logical NOT |

---

### 10. Example Playbook

```yaml
- hosts: servers
  tasks:
    - name: Install nginx only on Ubuntu
      apt:
        name: nginx
        state: present
      when: ansible_distribution == "Ubuntu"
```