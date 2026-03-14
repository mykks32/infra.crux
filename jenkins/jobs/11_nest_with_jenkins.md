### Step 0: Install & Configure NodeJS Plugin
> Without this, Jenkins has no Node/npm — do this first.

**Install the plugin:**
- Manage Jenkins
- Plugins
- Available Plugins
- Search `NodeJS`
- Install → restart Jenkins

**Configure a Node version:**
Manage Jenkins → Tools → scroll to **NodeJS installations** → **Add NodeJS**
- Name: `NodeJS-16` ← will be referenced this exact name in jobs
- Version: select `NodeJS 16.x.x` from dropdown
- Leave "Global npm packages" empty unless you need global tools (e.g. `pm2`)
- Save

Jenkins auto-downloads this Node version on first build.

---

### Option 1: Freestyle Job
> Config lives in the Jenkins UI. Good for learning/quick runs.

1. **New Item** → name it → **Freestyle project** → OK
2. **Source Code Management** → Git
    - URL: `https://github.com/Jardielson-s/jenkins.git`
    - Branch: `*/main`
3. **Build Environment** → check **Provide Node & npm bin/ folder to PATH**
    - NodeJS Installation: select `NodeJS-16`
    - This injects the correct `node` and `npm` binaries into the shell for this build
4. **Build Steps** → Add build step → **Execute shell**:
```bash
node -v && npm -v    # confirm versions are correct
npm install          # install dependencies from package.json
npm run build        # tsc compiles TypeScript → dist/
npm run test         # Jest runs unit tests
```
5. **Save** → **Build Now** → click build # → **Console Output** to see logs

---

## Option 2: Pipeline Job
> Config lives in `Jenkinsfile` in your repo. Version controlled. Recommended.

**Step 1 — Create `Jenkinsfile` at repo root:**
```groovy
pipeline {
    agent any

    // Tells Jenkins to add NodeJS-16 binaries to PATH for all stages
    // "NodeJS-16" must exactly match the name set in Manage Jenkins → Tools
    tools {
        nodejs 'NodeJS-16'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls latest code from the configured branch
                git branch: 'main', url: 'https://github.com/Jardielson-s/jenkins.git'
            }
        }
        stage('Install') {
            steps {
                sh 'npm install'      // installs node_modules
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'    // compiles TypeScript → dist/
            }
        }
        stage('Test') {
            steps {
                sh 'npm run test'     // runs Jest unit tests
            }
        }
    }

    post {
        success { echo 'Build passed!' }
        failure { echo 'Build failed — check logs.' }
        always  { cleanWs() }         // wipe workspace after every run
    }
}
```

**Step 2 — Create Pipeline job in Jenkins:**
1. **New Item** → name it → **Pipeline** → OK
2. **Pipeline** section:
    - Definition: `Pipeline script from SCM`
    - SCM: `Git`
    - Repository URL: `https://github.com/Jardielson-s/jenkins.git`
    - Branch: `*/main`
    - Script Path: `Jenkinsfile`
3. **Save** → **Build Now** → watch stages in the **Stage View**

---

## Freestyle vs Pipeline

| | Freestyle             | Pipeline                 |
|---|-----------------------|--------------------------|
| Config location | Jenkins UI            | `Jenkinsfile` in repo    |
| Version controlled | No                    | Yes                      |
| Stage visualization | No                    | Yes                      |
| NodeJS config | Build Environment tab | `tools { nodejs '...' }` |
| Best for | Quick testing         | Real CI/CD               |