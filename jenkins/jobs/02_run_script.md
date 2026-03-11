## Run Script Job

### Goal
Run a local script and capture output.

### Jenkins Steps
1. Create a **Freestyle project** named `run-script`.
2. **Source Code Management**: Git (if script is in repo) or None.
3. **Build Steps**:
    - Add **Execute shell** step:
      ```bash
      chmod +x ./run-script.sh
      ./run-script.sh
      ```
4. **Post-build Actions**:
    - **Archive Artifacts**: `output.txt`
5. **Build Triggers**: Manual or Poll SCM.