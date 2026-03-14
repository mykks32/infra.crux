## Jenkins Environment Variables
> Environment variables in Jenkins allow you to store configuration values, build information, system paths, credentials, and parameters. They make pipelines **flexible, reusable, and maintainable**. This document covers all aspects of environment variables in Jenkins.

---

### 1. Types of Environment Variables

| Type | Description |
|------|-------------|
| Global Variables | Defined in Jenkins system configuration; available to all jobs |
| Pipeline Variables | Defined inside a Jenkinsfile; scoped to the pipeline |
| Build Parameters | Passed when triggering a job manually or via API |
| System Variables | Automatically provided by Jenkins |

---

### 2. Global Environment Variables

Global variables are available to all jobs.

**Steps to define global variables:**

1. Open Jenkins Dashboard
2. Go to **Manage Jenkins → Configure System**
3. Scroll to **Global Properties**
4. Enable **Environment Variables**
5. Add variable names and values, for example:

| Name | Value |
|------|-------|
| APP_ENV | production |
| APP_PORT | 3000 |
| APP_NAME | my-application |

6. Click **Save**

---

### 3. Pipeline Environment Variables

Variables can be defined inside a pipeline using the `environment` block.

```groovy
pipeline {
    agent any
    environment {
        APP_NAME = "demo-app"
        APP_ENV = "production"
        VERSION = "1.0"
    }
    stages {
        stage('Print Variables') {
            steps {
                echo "Application: ${APP_NAME}"
                echo "Environment: ${APP_ENV}"
                echo "Version: ${VERSION}"
            }
        }
    }
}
```

---

### 4. Using Environment Variables in Shell Commands

Pipeline variables can be accessed inside shell commands.

```groovy
pipeline {
    agent any
    environment {
        APP_NAME = "sample-app"
    }
    stages {
        stage('Shell Example') {
            steps {
                sh 'echo Application name is $APP_NAME'
            }
        }
    }
}
```

---

### 5. Overriding Environment Variables in a Stage

Variables can be overridden at the stage level for flexibility.

```groovy
pipeline {
    agent any
    environment {
        ENV_NAME = "production"
    }
    stages {
        stage('Override Variable') {
            environment {
                ENV_NAME = "staging"
            }
            steps {
                echo "Environment: ${ENV_NAME}"
            }
        }
    }
}
```

---

### 6. Using Credentials as Environment Variables

Jenkins credentials can be securely injected as environment variables.

```groovy
pipeline {
    agent any
    environment {
        DB_PASSWORD = credentials('db-password-id')
    }
    stages {
        stage('Use Credential') {
            steps {
                echo "Using secure credential"
            }
        }
    }
}
```

---

### 7. Jenkins Predefined Environment Variables

#### Build Variables

| Variable | Description |
|----------|-------------|
| BUILD_NUMBER | Current build number |
| BUILD_ID | Unique build identifier |
| BUILD_DISPLAY_NAME | Build display name |
| BUILD_TAG | Unique tag for build |
| BUILD_URL | URL of the build |

#### Job Variables

| Variable | Description |
|----------|-------------|
| JOB_NAME | Full job name |
| JOB_BASE_NAME | Short job name |
| JOB_URL | URL of the job |

#### Workspace and Node Variables

| Variable | Description |
|----------|-------------|
| WORKSPACE | Workspace directory path |
| NODE_NAME | Node executing the build |
| NODE_LABELS | Labels assigned to node |
| EXECUTOR_NUMBER | Executor running the build |

#### Jenkins System Variables

| Variable | Description |
|----------|-------------|
| JENKINS_HOME | Jenkins home directory |
| JENKINS_URL | Jenkins server URL |
| JENKINS_SERVER_COOKIE | Jenkins internal identifier |

#### Git Variables (if Git plugin is used)

| Variable | Description |
|----------|-------------|
| GIT_COMMIT | Current commit hash |
| GIT_BRANCH | Git branch name |
| GIT_URL | Git repository URL |
| GIT_PREVIOUS_COMMIT | Previous commit hash |
| GIT_PREVIOUS_SUCCESSFUL_COMMIT | Last successful commit |

#### Pipeline Variables

| Variable | Description |
|----------|-------------|
| STAGE_NAME | Current pipeline stage name |
| env.STAGE_NAME | Current pipeline stage name (alternative syntax) |

---

### 8. Example Pipeline Using Predefined Variables

```groovy
pipeline {
    agent any
    stages {
        stage('Show Jenkins Variables') {
            steps {
                echo "Job Name: ${JOB_NAME}"
                echo "Build Number: ${BUILD_NUMBER}"
                echo "Workspace: ${WORKSPACE}"
                echo "Build URL: ${BUILD_URL}"
                echo "Node Name: ${NODE_NAME}"
            }
        }
    }
}
```

---

### 9. Best Practices

- Use environment variables instead of hardcoding values.
- Store secrets securely using Jenkins credentials plugin.
- Keep global variables minimal.
- Use descriptive and consistent variable names.
- Audit environment variables regularly to avoid conflicts.

---