## Remote Job

### Goal
Run commands on a remote server.

### Jenkins Steps
1. Create a **Freestyle project** named `remote-job`.
2. **Build Steps**:
    - Add **Send files or execute commands over SSH** (needs SSH plugin)
        - Select configured SSH server
        - Command:
          ```bash
          ls -la /var/www
          ```
3. **Post-build Actions**: Optional notifications.
4. **Build Triggers**: Manual or Poll SCM.