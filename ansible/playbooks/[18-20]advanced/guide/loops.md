## Loops in Ansible

In **Ansible**, loops are used to run a task multiple times with different items.  
The `loop` keyword is the recommended method for iteration.

---

### 1. Basic Loop

```yaml
- name: Install multiple packages
  apt:
    name: "{{ item }}"
    state: present
  loop:
    - git
    - htop
    - curl
```

---

### 2. Loop with Dictionary Items

```yaml
- name: Create multiple users
  user:
    name: "{{ item.name }}"
    state: present
    shell: "{{ item.shell }}"
  loop:
    - { name: "alice", shell: "/bin/bash" }
    - { name: "bob", shell: "/bin/zsh" }
```

---

### 3. Loop with Conditional (`when`)

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

### 4. Loop with `with_items` (Older Syntax)

```yaml
- name: Install multiple packages (legacy)
  apt:
    name: "{{ item }}"
    state: present
  with_items:
    - git
    - htop
    - curl
```

> ⚠️ `loop` is preferred over `with_items`.

---

### 5. Loop with Index

```yaml
- name: Print list items with index
  debug:
    msg: "Item {{ item.0 }} is {{ item.1 }}"
  loop: "{{ mylist | enumerate }}"
```

`enumerate` gives index and value.

---

### 6. Loop with `register`

```yaml
- name: Ping multiple hosts
  ping:
  loop:
    - host1
    - host2
  register: ping_results

- name: Show ping results
  debug:
    var: ping_results.results
```

---

### 7. Loop with `until` (Retry)

```yaml
- name: Retry command until success
  command: /usr/bin/some_command
  register: result
  retries: 5
  delay: 10
  until: result.rc == 0
```

---

### 8. Loop with `subelements`

Used when iterating over nested lists.

```yaml
- name: Add users to groups
  user:
    name: "{{ item.0.name }}"
    groups: "{{ item.1 }}"
  loop: "{{ users | subelements('groups') }}"
```

Example data:

```yaml
users:
  - name: alice
    groups: [sudo, dev]
  - name: bob
    groups: [dev]
```

---

### 9. Loop with `with_dict` (Legacy)

```yaml
- name: Print dictionary items
  debug:
    msg: "{{ item.key }} = {{ item.value }}"
  with_dict:
    key1: value1
    key2: value2
```

> ⚠️ Prefer `loop` + `dict2items` instead.

```yaml
- name: Modern way to loop dictionary
  debug:
    msg: "{{ item.key }} = {{ item.value }}"
  loop: "{{ mydict | dict2items }}"
```

---

### 10. Common Loop Tips

- Use `loop` for most cases.
- Combine with `when` for conditional execution.
- Use `register` to capture results of each iteration.
- Avoid legacy `with_*` loops unless needed for backward compatibility.

---

### 11. Example Playbook

```yaml
- hosts: servers
  tasks:
    - name: Install packages on all servers
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - git
        - htop
        - curl
```