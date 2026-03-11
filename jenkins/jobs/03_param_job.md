## Parameterized Job

### Goal
Run a job with user-defined parameters.

### Jenkins Steps
1. Create a **Freestyle project** named `param-job`.
2. Check **This project is parameterized**.
    - Add **String Parameter**: `USERNAME` (default: `user`)
    - Add **Boolean Parameter**: `DEPLOY` (default: true)
3. **Build Steps**:
    - Add **Execute shell** step:
      ```bash
      echo "Username is $USERNAME"
      if [ "$DEPLOY" = "true" ]; then
        echo "Deploying application..."
      else
        echo "Skipping deployment..."
      fi
      ```
4. **Post-build Actions**: Optional notifications.
5. **Build Triggers**: Manual only.