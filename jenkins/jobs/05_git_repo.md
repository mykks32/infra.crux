## Git Repository Job

### Goal
Clone Git repo and run a build.

### Jenkins Steps
1. Create a **Freestyle project** named `git-repo`.
2. **Source Code Management**: Git
    - Repository URL: `git@github.com:mykks32/sample-repo.git`
    - Branch: `main`
3. **Build Steps**:
    - Add **Execute shell** step:
      ```bash
      echo "Building project..."
      ./build.sh
      ```
4. **Post-build Actions**:
    - Archive artifacts if needed
5. **Build Triggers**:
    - Poll SCM: `H/5 * * * *`