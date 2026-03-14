
## Jenkins Steps for Maven Project
> This guide explains how to configure Jenkins to build a Maven project.
---

### Prerequisites
- Jenkins installed and running
- Maven installed on the system
- Git repository with a Maven project
- JDK installed
- Email server configured in Jenkins (**Manage Jenkins → Configure System → E-mail Notification**)

---

### Configure Maven in Jenkins
1. Go to **Manage Jenkins → Global Tool Configuration**
2. Under **Maven**, click **Add Maven**
3. Configure:
    - **Name:** Maven3
    - **Install automatically** (optional)
4. Under **JDK**, make sure you have a JDK configured (e.g., JDK11).

---

### Create a Freestyle Job
1. Go to Jenkins Dashboard → **New Item**
2. Enter a **Job Name** → Select **Freestyle Project**
3. Click **OK**
4. **Source Code Management**
    - Select **Git**
    - Add **Repository URL** and credentials if needed
5. **Build**
    - Add **Invoke top-level Maven targets**
    - Enter **Goals** (e.g., `clean install`)
6. **Post-build Actions**
    - **Archive the artifacts** (e.g., `target/*.jar`)
    - **Publish JUnit test result report** (e.g., `target/surefire-reports/*.xml`)
    - **Email Notification**
        - Add recipients (e.g., `team@example.com`)
        - Select **Send e-mail for every unstable build** and **Send separate e-mails to individuals who broke the build** as needed
7. Save and click **Build Now**
8. Check **Console Output** to verify the build

---

### Create a Pipeline Job
1. Go to Jenkins Dashboard → **New Item**
2. Enter a **Job Name** → Select **Pipeline**
3. Click **OK**
4. **Pipeline Section**
    - Definition: **Pipeline script** (or **from SCM** if using a Jenkinsfile)
5. Example pipeline script:

```jenkins
pipeline {
    agent any
    
    tools {
        maven 'jenkins-maven'
        jdk 'jenkins-jdk'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/jenkins-docs/simple-java-maven-app.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('deploy') {
            steps {
                sh '''
                    echo 'Deploy jar'
                    java -jar /var/lib/jenkins/workspace/maven-demo-pipeline/target/my-app-1.0-SNAPSHOT.jar
                '''
            }
        }
    }
    post {
        success {
            echo 'Build Successful!'
            mail to: '076bct082@ioepc.edu.np',
                 subject: "Jenkins Build Success: ${currentBuild.fullDisplayName}",
                 body: "Build successful! Check console output at ${env.BUILD_URL}console"
        }
        failure {
            echo 'Build Failed!'
            mail to: '076bct082@ioepc.edu.np',
                 subject: "Jenkins Build Failed: ${currentBuild.fullDisplayName}",
                 body: "Build failed! Check console output at ${env.BUILD_URL}console"
        }
        always {
            archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
            junit 'target/surefire-reports/*.xml'
        }
    }
}
```

---

### Common Jenkins Environment Variables

```dotenv
Variable        Description
WORKSPACE       Current job workspace
BUILD_NUMBER    Jenkins build number
JOB_NAME        Name of the Jenkins job
MAVEN_HOME      Maven installation path
JAVA_HOME       JDK installation path
BUILD_URL       URL of the current build
```