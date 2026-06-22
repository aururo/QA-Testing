---
name: designing-test-cases
description: Use when you have test requirements and need to design structured test cases with steps and expected results
---

# Test Case Design

## Overview

Transform test requirements into structured, executable test cases with clear steps, test data, and expected results.

**Core principle:** A test case is only useful if someone else can execute it without asking questions.

**Announce at start:** "I'm using the designing-test-cases skill to create structured test cases from the requirements."

## When to Use

**Use when:**
- Test requirements analysis is complete and approved
- Need to create detailed test cases for execution
- Expanding test coverage for existing features
- Adding regression test cases

**Do NOT use when:**
- Requirements are still unclear or unapproved
- Have not performed requirements analysis
- Need to execute tests (use `qa-testing:executing-test-cases` instead)

## Test Case Design Checklist

You MUST complete these steps in order:

1. **Load approved requirements** — read from `docs/qa-testing/requirements/`
2. **Identify test scenarios** — for each requirement, define scenarios
3. **Design test cases** — write detailed steps for each scenario
4. **Define test data** — specify exact input values
5. **Specify expected results** — make them verifiable and unambiguous
6. **Review coverage** — ensure all requirements and dimensions are covered
7. **Self-review** — check clarity, completeness, executability
8. **Present to user** — get approval before execution
9. **Save to file** — write to `docs/qa-testing/test-cases/`
10. **Transition** — invoke `qa-testing:executing-test-cases`

## Core Process

### Step 1: Load Requirements

Read the approved test requirements document from `docs/qa-testing/requirements/`.

Verify that:
- Requirements are clear and testable
- User has approved the requirements document
- All test dimensions (positive, negative, boundary, exception) are identified

### Step 2: Identify Test Scenarios

For each functional requirement, identify test scenarios:

**Positive Scenarios (Happy Path):**
- Normal operation with valid input
- Expected user workflows
- Standard business processes

**Negative Scenarios:**
- Invalid input values
- Unauthorized access attempts
- Missing required fields
- Invalid formats

**Boundary Scenarios:**
- Minimum and maximum values
- Empty vs. full
- Just inside vs. just outside limits
- Character limits (min, max, max+1)

**Exception Scenarios:**
- Network failures
- Timeouts
- Concurrent operations
- System errors

### Step 3: Design Test Cases

For each scenario, create a test case using the template from `qa-testing:designing-test-cases/test-case-template.md`.

**Test Case Structure:**

```markdown
### TC-<FEATURE>-NNN: <Brief Description>

- **Priority:** P0 / P1 / P2 / P3
- **Related Requirement:** REQ-NNN
- **Preconditions:**
  - <Condition 1>
  - <Condition 2>
- **Test Steps:**
  1. <Action 1>
  2. <Action 2>
  3. <Action 3>
- **Expected Result:**
  - <Observable outcome 1>
  - <Observable outcome 2>
- **Test Data:**
  - <Input field>: <Value>
  - <Input field>: <Value>
```

### Step 4: Define Test Data

For each test case, specify exact test data values:

**Good test data:**
- `username: "testuser@example.com"`
- `password: "ValidPass123!"`
- `age: 25`
- `file: "document.pdf" (2MB)`

**Bad test data:**
- `username: "some user"` (too vague)
- `password: "password"` (unclear if valid)
- `age: "young"` (not a value)
- `file: "a file"` (no specifics)

**Test Data Guidelines:**
- Use realistic but clearly fake data
- Include specific values, not descriptions
- Document where test data comes from (existing records vs. created for test)
- For boundary tests, specify exact boundary values

### Step 5: Specify Expected Results

Expected results must be:

**Observable:**
- ✅ "User is redirected to dashboard page"
- ❌ "System processes the login" (not observable)

**Verifiable:**
- ✅ "Database record status changes to 'Active'"
- ❌ "System updates the record" (how to verify?)

**Specific:**
- ✅ "Error message displays: 'Email address is required' in red text below the email field"
- ❌ "Error message is shown" (which message? where?)

**Complete:**
- ✅ "Order confirmation page displays order number, total amount $99.99, and estimated delivery date"
- ❌ "Order is confirmed" (what confirms it?)

### Step 6: Review Coverage

Create a coverage matrix to verify:

**Requirement Coverage:**
- Every requirement has at least one test case
- High-priority requirements have multiple test cases
- All test dimensions (positive, negative, boundary, exception) are covered

**Test Case ID Convention:**
- Format: `TC-<FEATURE>-NNN`
- Example: `TC-LOGIN-001`, `TC-LOGIN-002`, `TC-PAYMENT-001`
- Sequential numbering within feature

### Step 7: Self-Review

Before presenting to user, verify:

1. **Clarity:** Could someone else execute this test case without asking questions?
2. **Completeness:** Are all steps present? Are expected results specific?
3. **Independence:** Can each test case be executed independently?
4. **Repeatability:** Will the test produce the same result every time?
5. **No assumptions:** Are preconditions explicit? Is test data specified?
6. **No ambiguity:** Are steps clear and unambiguous?

### Step 8: Present to User

Present the test case document to the user:

- Summary statistics (total cases, by priority, by requirement)
- Coverage matrix (requirements → test cases)
- Key test cases (especially Critical and boundary cases)
- Any assumptions or open questions

**REQUIRED:** Get explicit user approval before proceeding to execution.

### Step 9: Save to File

Save the approved test case document to:
`docs/qa-testing/test-cases/YYYY-MM-DD-<feature>-test-cases.md`

### Step 10: Transition

**REQUIRED:** Invoke `qa-testing:executing-test-cases` to begin test execution.

## Test Case Prioritization

| Priority | Definition | When to Use |
|----------|------------|-------------|
| **P0 (Critical)** | Core functionality, must test before release | Login, payment, data integrity, security |
| **P1 (High)** | Important features, high user impact | Main workflows, common operations |
| **P2 (Medium)** | Secondary features, moderate impact | Edge cases, less common scenarios |
| **P3 (Low)** | Minor features, low impact | Cosmetic, nice-to-have, rare scenarios |

## Common Test Design Techniques

### Equivalence Partitioning
Divide input data into partitions, test one value from each partition.

**Example:** Age field accepts 18-65
- Partition 1: < 18 (test with 17)
- Partition 2: 18-65 (test with 30)
- Partition 3: > 65 (test with 66)

### Boundary Value Analysis
Test at the boundaries of equivalence partitions.

**Example:** Age field accepts 18-65
- Test: 17, 18, 19, 64, 65, 66

### Error Guessing
Based on experience, guess where errors might occur.

**Common error-prone areas:**
- Special characters in input
- Very long input strings
- Null or empty values
- Concurrent operations
- Rapid repeated actions

### State Transition Testing
Test transitions between different states.

**Example:** Order status
- New → Paid → Shipped → Delivered
- Test valid transitions and invalid transitions (e.g., New → Delivered)

## Red Flags - STOP and Reassess

- Test steps are vague ("enter appropriate data") → Must specify exact values
- Expected results are not observable ("system processes correctly") → Must be verifiable
- Missing preconditions → Cannot set up test environment
- Test case depends on another test case → Must be independent
- No test data specified → Cannot execute without guessing
- Expected result says "similar to TC-001" → Must repeat full details
- Test case covers multiple scenarios → Split into separate cases
- Cannot determine pass/fail criteria → Expected result is unclear

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Test steps are obvious, no need to write them out" | Obvious to you ≠ obvious to executor; write every step |
| "Expected result is 'it works'" | Must specify what "works" means in observable terms |
| "Can reuse test data from another test" | Each test must specify its own data for independence |
| "This test is similar to the last one" | Similar ≠ identical; write full details |
| "We'll figure out test data during execution" | Ad-hoc data = unreproducible results |
| "Negative tests are too tedious" | Negative tests catch real bugs; must include them |
| "Boundary tests are overkill" | Boundaries are where bugs hide; must test them |
| "User can review during execution" | Review before execution; changes during execution waste time |

## Common Mistakes

| Mistake | Consequence | Fix |
|---------|-------------|-----|
| Vague test steps | Executor guesses what to do | Write specific, actionable steps |
| Unverifiable expected results | Cannot determine pass/fail | Make results observable and specific |
| Missing preconditions | Test environment not ready | List all setup requirements |
| Test case dependencies | Cannot execute in isolation | Make each test independent |
| No test data | Inconsistent execution | Specify exact input values |
| Combining multiple scenarios | Unclear what failed | One scenario per test case |
| Skipping negative tests | Miss error handling bugs | Include invalid input, error conditions |
| Ignoring boundary values | Miss edge case bugs | Test min, max, just outside limits |

## Checklist

Before presenting to user:

- [ ] All requirements have corresponding test cases
- [ ] Positive, negative, boundary, and exception scenarios covered
- [ ] Test case IDs follow convention (TC-<FEATURE>-NNN)
- [ ] Each test case has clear preconditions
- [ ] Test steps are specific and actionable
- [ ] Expected results are observable and verifiable
- [ ] Test data is specified with exact values
- [ ] Test cases are independent (no dependencies)
- [ ] Priorities assigned (P0/P1/P2/P3)
- [ ] Coverage matrix shows requirement coverage
- [ ] Self-review completed (clarity, completeness, executability)
- [ ] Saved to `docs/qa-testing/test-cases/`

## Quick Reference

| Element | Required? | Example |
|---------|-----------|---------|
| Test Case ID | Yes | TC-LOGIN-001 |
| Description | Yes | Valid login with correct credentials |
| Priority | Yes | P0 |
| Related Requirement | Yes | REQ-001 |
| Preconditions | Yes | User account exists, not locked |
| Test Steps | Yes | 1. Navigate to login, 2. Enter username... |
| Expected Result | Yes | Redirected to dashboard, welcome message shown |
| Test Data | Yes | username=testuser, password=Test@123 |
| Postconditions | Optional | User session created in database |
| Notes | Optional | Test on Chrome and Firefox |

## Cross-References

- **Upstream:** `qa-testing:analyzing-test-requirements` (provides requirements to design from)
- **Downstream:** `qa-testing:executing-test-cases` (executes the designed test cases)
- **Template:** `qa-testing:designing-test-cases/test-case-template.md` (test case document template)
- **Related:** `qa-testing:analyzing-test-requirements` (if coverage gaps found, may need to revisit requirements)
