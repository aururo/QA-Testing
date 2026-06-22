# Test Cases: User Login Feature

## Test Case Document Information

| Field | Value |
|-------|-------|
| **Feature** | User Login |
| **Version** | 1.0 |
| **Date** | 2026-06-11 |
| **Requirements Document** | `docs/qa-testing/requirements/2026-06-11-login-requirements.md` |
| **Designer** | QA Agent |
| **Status** | Draft / Under Review / Approved |

---

## Test Case Summary

| Category | Count |
|----------|-------|
| Total Test Cases | 12 |
| P0 (Critical) | 4 |
| P1 (High) | 4 |
| P2 (Medium) | 3 |
| P3 (Low) | 1 |

---

## FR-001: Username/Password Login

### TC-LOGIN-001: Valid login with correct credentials
- **Priority:** P0
- **Related Requirement:** FR-001
- **Preconditions:** User account exists with username "testuser" and password "Test@123"
- **Test Steps:**
  1. Navigate to login page
  2. Enter username "testuser"
  3. Enter password "Test@123"
  4. Click "Login" button
- **Expected Result:** User is redirected to dashboard, welcome message displays "Welcome, testuser"
- **Test Data:** username=testuser, password=Test@123

### TC-LOGIN-002: Login with invalid username
- **Priority:** P0
- **Related Requirement:** FR-001
- **Preconditions:** User account "nonexistent" does not exist
- **Test Steps:**
  1. Navigate to login page
  2. Enter username "nonexistent"
  3. Enter password "Test@123"
  4. Click "Login" button
- **Expected Result:** Error message "Invalid username or password" is displayed, user remains on login page
- **Test Data:** username=nonexistent, password=Test@123

### TC-LOGIN-003: Login with invalid password
- **Priority:** P0
- **Related Requirement:** FR-001
- **Preconditions:** User account exists with username "testuser"
- **Test Steps:**
  1. Navigate to login page
  2. Enter username "testuser"
  3. Enter password "WrongPass"
  4. Click "Login" button
- **Expected Result:** Error message "Invalid username or password" is displayed, user remains on login page
- **Test Data:** username=testuser, password=WrongPass

### TC-LOGIN-004: Login with empty fields
- **Priority:** P1
- **Related Requirement:** FR-001
- **Preconditions:** Login page is displayed
- **Test Steps:**
  1. Navigate to login page
  2. Leave username field empty
  3. Leave password field empty
  4. Click "Login" button
- **Expected Result:** Validation error "Username is required" and "Password is required" are displayed
- **Test Data:** username=, password=

---

## FR-002: Password Requirements

### TC-PASS-001: Password with all requirements met
- **Priority:** P1
- **Related Requirement:** FR-002
- **Preconditions:** Registration page is displayed
- **Test Steps:**
  1. Navigate to registration page
  2. Enter valid username "newuser"
  3. Enter password "NewUser1" (8 chars, uppercase, number)
  4. Confirm password
  5. Click "Register"
- **Expected Result:** Registration successful, user can login with new credentials
- **Test Data:** username=newuser, password=NewUser1

### TC-PASS-002: Password too short
- **Priority:** P1
- **Related Requirement:** FR-002
- **Preconditions:** Registration page is displayed
- **Test Steps:**
  1. Navigate to registration page
  2. Enter valid username "newuser"
  3. Enter password "Ab1" (3 chars)
  4. Click "Register"
- **Expected Result:** Error message "Password must be at least 8 characters"
- **Test Data:** username=newuser, password=Ab1

### TC-PASS-003: Password without uppercase
- **Priority:** P2
- **Related Requirement:** FR-002
- **Preconditions:** Registration page is displayed
- **Test Steps:**
  1. Navigate to registration page
  2. Enter valid username "newuser"
  3. Enter password "newuser1" (no uppercase)
  4. Click "Register"
- **Expected Result:** Error message "Password must contain at least one uppercase letter"
- **Test Data:** username=newuser, password=newuser1

---

## FR-003: Account Lockout

### TC-LOCK-001: Account locks after 5 failed attempts
- **Priority:** P0
- **Related Requirement:** FR-003
- **Preconditions:** User account "testuser" exists, 0 failed attempts
- **Test Steps:**
  1. Attempt login with wrong password (attempt 1)
  2. Attempt login with wrong password (attempt 2)
  3. Attempt login with wrong password (attempt 3)
  4. Attempt login with wrong password (attempt 4)
  5. Attempt login with wrong password (attempt 5)
  6. Attempt login with wrong password (attempt 6)
- **Expected Result:** After 5th attempt, message "Account locked. Try again in 15 minutes" is displayed
- **Test Data:** username=testuser, password=WrongPass (repeated)

### TC-LOCK-002: Successful login resets failed attempt counter
- **Priority:** P0
- **Related Requirement:** FR-003
- **Preconditions:** User account "testuser" exists, 3 failed attempts recorded
- **Test Steps:**
  1. Attempt login with wrong password (attempt 4)
  2. Attempt login with correct password
- **Expected Result:** Login successful, failed attempt counter reset to 0
- **Test Data:** username=testuser, password=Test@123

### TC-LOCK-003: Locked account cannot login even with correct credentials
- **Priority:** P1
- **Related Requirement:** FR-003
- **Preconditions:** User account "testuser" is locked
- **Test Steps:**
  1. Navigate to login page
  2. Enter username "testuser"
  3. Enter correct password "Test@123"
  4. Click "Login"
- **Expected Result:** Message "Account locked. Try again in 15 minutes or contact administrator"
- **Test Data:** username=testuser, password=Test@123

---

## FR-004: Remember Me

### TC-REMEM-001: Remember Me keeps user logged in
- **Priority:** P2
- **Related Requirement:** FR-004
- **Preconditions:** User account exists
- **Test Steps:**
  1. Navigate to login page
  2. Enter valid credentials
  3. Check "Remember Me" checkbox
  4. Click "Login"
  5. Close browser
  6. Reopen browser and navigate to site
- **Expected Result:** User is still logged in, no login page shown
- **Test Data:** username=testuser, password=Test@123

### TC-REMEM-002: Without Remember Me, session expires on browser close
- **Priority:** P2
- **Related Requirement:** FR-004
- **Preconditions:** User account exists
- **Test Steps:**
  1. Navigate to login page
  2. Enter valid credentials
  3. Leave "Remember Me" unchecked
  4. Click "Login"
  5. Close browser
  6. Reopen browser and navigate to site
- **Expected Result:** Login page is shown, user must login again
- **Test Data:** username=testuser, password=Test@123

---

## FR-005: Password Reset

### TC-RESET-001: Password reset email sent successfully
- **Priority:** P1
- **Related Requirement:** FR-005
- **Preconditions:** User account "testuser@example.com" exists
- **Test Steps:**
  1. Navigate to password reset page
  2. Enter email "testuser@example.com"
  3. Click "Send Reset Link"
- **Expected Result:** Message "Reset link sent to your email", email received with reset link
- **Test Data:** email=testuser@example.com

### TC-RESET-002: Reset link expires after 1 hour
- **Priority:** P2
- **Related Requirement:** FR-005
- **Preconditions:** Password reset email was sent 61 minutes ago
- **Test Steps:**
  1. Click reset link from email
  2. Enter new password
  3. Click "Reset Password"
- **Expected Result:** Error message "Reset link has expired. Please request a new one"
- **Test Data:** reset link from 61 minutes ago

---

## Execution Tracking

| TC ID | Status | Defect ID | Notes |
|-------|--------|-----------|-------|
| TC-LOGIN-001 | Pending | - | - |
| TC-LOGIN-002 | Pending | - | - |
| TC-LOGIN-003 | Pending | - | - |
| TC-LOGIN-004 | Pending | - | - |
| TC-PASS-001 | Pending | - | - |
| TC-PASS-002 | Pending | - | - |
| TC-PASS-003 | Pending | - | - |
| TC-LOCK-001 | Pending | - | - |
| TC-LOCK-002 | Pending | - | - |
| TC-LOCK-003 | Pending | - | - |
| TC-REMEM-001 | Pending | - | - |
| TC-REMEM-002 | Pending | - | - |
| TC-RESET-001 | Pending | - | - |
| TC-RESET-002 | Pending | - | - |
