# Jenkins User Management

User management in Jenkins controls **who can access Jenkins and what actions they can perform**. Proper user management is important to secure CI/CD pipelines and restrict unauthorized access.

This document explains how to:

- Enable Jenkins security
- Create users
- Configure role-based authorization
- Assign permissions
- Use Jenkins pipelines with controlled access

---

## 1. Enable Security

Security must be enabled before managing users.

### Steps

#### 1. Open **Jenkins Dashboard**

#### 2. Navigate to:
```
Manage Jenkins → Configure Security
```

#### 3. Configure the following settings:
***Authentication***

Select:
```
Jenkins’ own user database
```
Optionally enable:
```
Allow users to sign up
```

***Authorization***

Select:
```
Role-Based Strategy
```
Click **Save**.

---

## 2. Create Users

### Steps

#### 1. Navigate to:
```
Manage Jenkins → Manage Users
```

#### 2. Click **Create User**

#### 3. Fill the required information:

| Field | Description |
|------|-------------|
| Username | Login username |
| Password | User password |
| Full Name | Full name |
| Email | Email address |

#### 4. Click **Create User**

---

## 3. Install Role-Based Authorization Plugin

Jenkins default authorization is limited, so installing the role-based plugin is recommended.

### Steps
#### 1. Navigate to:
```
Manage Jenkins → Manage Plugins
```
#### 2. Open **Available Plugins**
#### 3. Search for:
```
Role-based Authorization Strategy
```
#### 4. Install the plugin
#### 5. Restart Jenkins if required

---

## 4. Configure Role-Based Authorization

### After installing the plugin:

#### 1. Go to:
```
Manage Jenkins → Configure Security
```

#### 2. Under **Authorization**, select:
```
Role-Based Strategy
```
#### 3. Save the configuration.

---

## 5. Create Roles

Navigate to:
```
Manage Jenkins → Manage and Assign Roles → Manage Roles
```
There are three role types:

| Role Type | Description |
|-----------|-------------|
| Global Roles | Jenkins-wide permissions |
| Project Roles | Job-level permissions |
| Agent Roles | Node/agent permissions |

---

## 6. Example Roles

### Admin
Permissions:
```
Overall → Administer
```
---

### Developer
Permissions:
```
Overall → Read
Job → Read
Job → Build
Job → Workspace
Job → Discover
```
---
### Viewer
Permissions:
```
Overall → Read
Job → Read
```
---

## 7. Assign Roles to Users

Navigate to:
```
Manage Jenkins → Manage and Assign Roles → Assign Roles
```
Assign roles to users.
Example:

| User | Role |
|-----|------|
| admin | admin |
| dev1 | developer |
| dev2 | developer |
| viewer1 | viewer |

Click **Save**.

---

## 8. Best Practices

- Always enable Jenkins security
- Use role-based authorization
- Avoid giving admin access to all users
- Store secrets using Jenkins credentials
- Integrate Jenkins with LDAP or GitHub for large teams
- Periodically review user permissions

---