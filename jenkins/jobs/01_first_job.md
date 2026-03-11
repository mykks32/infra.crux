## First Job - Basic Freestyle Job

### Goal
Run a simple shell command and print output.

### Jenkins Steps
1. Create a **Freestyle project** named `first-job`.
2. **Source Code Management**: None (unless you want Git).
3. **Build Steps**:
    - Add **Execute shell** step:
      ```bash
      echo "Running First Job!"
      ```
4. **Post-build Actions**:
    - Optional: **Email Notification** or **Archive Artifacts**.
5. **Build Triggers**: Manual.