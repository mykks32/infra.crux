## Jenkins + Ansible Job Setup

### 1. Create Jenkins Job
1. Open Jenkins Dashboard
2. Click New Item
3. Enter name: `ansible-job`
4. Select Freestyle Project
5. Click OK

### 2. Configure Build Step
Go to Build Steps → Execute shell and add:

```bash
ansible-playbook /etc/ansible/playbooks/first_pb.yml -i /etc/ansible/playbooks/inventory.ini -f 5
```

### 3. Create Inventory File

Location: 
```bash
/etc/ansible/playbooks/inventory.ini
```
```ini
[servers]
serverA ansible_host=192.168.1.78 ansible_user=jenkins

[servers:vars]
ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_ed25519
```

### 4. Create Ansible Playbook

Location: 
```bash
/etc/ansible/playbooks/first_pb.yml
```
```yaml
- name: First basic PB
  hosts: servers
  become: true

  tasks:
    - name: Test Connectivity
      ping:

    - name: Print Output
      debug:
        msg: "Alright!!"
```

### 5. Create Jenkins User on Remote Server
```bash
sudo useradd jenkins
sudo passwd jenkins
```

### 6. Switch to Jenkins User on Local Server
```bash
sudo su -s /bin/bash jenkins
```

### 7. Generate SSH Key for Jenkins
```bash
ssh-keygen
```

Keys created at:
```bash
/var/lib/jenkins/.ssh/id_ed25519
/var/lib/jenkins/.ssh/id_ed25519.pub
```

### 8. Copy SSH Key to Remote Server
```bash
ssh-copy-id jenkins@192.168.1.78
```

***Remote file:***
```bash
/home/jenkins/.ssh/authorized_keys
```

***Verify:***
```bash
cat /home/jenkins/.ssh/authorized_keys
```

### 9. Test SSH Login
```bash
ssh jenkins@192.168.1.78
```

### 10. Run Jenkins Job

Click Build Now in Jenkins.

### 11. Example Successful Jenkins Output
```jenkins
PLAY [First basic PB]

TASK [Gathering Facts]
ok: [serverA]

TASK [Test Connectivity]
ok: [serverA]

TASK [Print Output]
ok: [serverA] => {
    "msg": "Alright!!"
}

PLAY RECAP
serverA : ok=3 changed=0 unreachable=0 failed=0 skipped=0
```

### 12. Project Structure
```txt
/etc/ansible/playbooks
├── inventory.ini
└── first_pb.yml
```

### 13. Execution Flow
```txt
Jenkins
   │
   │ runs
   ▼
Ansible Playbook
   │
   │ SSH
   ▼
Remote Server (192.168.1.78)
```

Result
- Jenkins successfully runs the Ansible Playbook 
- authentication works using Jenkins SSH key 
- Remote server is managed automatically

