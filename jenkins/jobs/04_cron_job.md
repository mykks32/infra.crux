## Cron Job

### Goal
Schedule a job to run automatically.

### Jenkins Steps
1. Create a **Freestyle project** named `cron-job`.
2. **Build Steps**:
    - Add **Execute shell** step:
      ```bash
      echo "Running scheduled cron job"
      ```
3. **Build Triggers**:
    - Check **Build periodically**
    - Enter cron: `H 2 * * *` (daily at 2 AM)
4. **Post-build Actions**: Optional email notification.