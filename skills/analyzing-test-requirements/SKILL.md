---
name: analyzing-test-requirements
description: Use when user provides requirements, user stories, or specs that need to be analyzed for test coverage and testability
---

# Test Requirements Analysis

## Overview

Extract and structure testable requirements from user stories, product specs, or feature descriptions.

**Core principle:** If a requirement cannot be verified, it is not a test requirement — rewrite it until it can be.

**Announce at start:** "I'm using the analyzing-test-requirements skill to extract testable requirements."

## When to Use

**Use when:**
- User provides new feature requirements or user stories
- User asks "what should we test?"
- User mentions test planning or test strategy
- New sprint/iteration starts with testable features
- Existing requirements need test coverage analysis

**Do NOT use when:**
- Requirements are already analyzed and approved (proceed to `qa-testing:designing-test-cases`)
- User only wants to discuss product design, not testing
- Feature is purely technical with no user-visible behavior

## Requirements Analysis Checklist

You MUST complete these steps in order:

1. **Gather requirements source** — identify where requirements come from
2. **Extract functional requirements** — list each verifiable behavior
3. **Rewrite for testability** — ensure every requirement is observable and verifiable
4. **Identify test dimensions** — positive, negative, boundary, exception for each requirement
5. **Assign priority** — classify by business and quality impact
6. **Define scope** — explicitly state in-scope and out-of-scope items
7. **Identify open questions** — flag ambiguities that block test design
8. **Assess risks and constraints** — note environment or data dependencies
9. **Write requirements document** — use template and save to file
10. **Present to user** — get approval before proceeding

## Core Process

### Step 1: Gather Requirements Source

Identify and read the source material:
- Product Requirements Document (PRD)
- User stories (As a... I want... So that...)
- Feature specifications
- Design documents
- Verbal descriptions from user

Verify that:
- Source material is available and readable
- The feature scope is clear
- Stakeholder expectations are understood

### Step 2: Extract Functional Requirements

For each user-visible behavior, create a requirement:

**Format:** `FR-NNN: <Short Title>`

**Good requirement:**
- "Users can log in with valid username and password"
- "System locks account after 5 consecutive failed attempts for 15 minutes"

**Bad requirement:**
- "Login should work properly" (not specific)
- "System should be fast" (not measurable)
- "Good user experience" (not verifiable)

### Step 3: Rewrite for Testability

Every requirement must pass the **Testability Check:**

| Criterion | Question |
|-----------|----------|
| **Observable** | Can I see or measure the outcome? |
| **Verifiable** | Can I determine pass/fail unambiguously? |
| **Specific** | Are the conditions and data clearly defined? |
| **Independent** | Can I test this without testing something else first? |

**Rewrite examples:**

| Untestable | Testable |
|------------|----------|
| "Login should be fast" | "Login response time < 3 seconds under normal load" |
| "Password should be secure" | "Password must be at least 8 characters with one uppercase and one number" |
| "System handles errors well" | "System displays specific error message for each invalid input type" |

### Step 4: Identify Test Dimensions

For each requirement, identify four test dimensions:

| Dimension | What to Test | Example (Login) |
|-----------|-------------|-----------------|
| **Positive** | Valid input, expected workflow | Valid username + password → login success |
| **Negative** | Invalid input, unauthorized access | Wrong password → error message |
| **Boundary** | Edge values, limits | Exactly 8-char password, max username length |
| **Exception** | System failures, timeouts | Database down during login |

Create a **Test Dimensions Matrix** in the requirements document.

### Step 5: Assign Priority

| Priority | Criteria | Examples |
|----------|----------|---------|
| **P0 (Critical)** | Core functionality, security, data integrity | Login, payment, data save |
| **P1 (High)** | Important features, high user impact | Password reset, main workflows |
| **P2 (Medium)** | Secondary features, moderate impact | Remember me, preferences |
| **P3 (Low)** | Cosmetic, nice-to-have | UI polish, rare scenarios |

Create a **Priority Matrix** mapping requirements to priorities with rationale.

### Step 6: Define Scope

Explicitly state:

**In Scope:**
- Features and behaviors to be tested
- Platforms, browsers, devices covered
- User roles and account types

**Out of Scope:**
- Features not tested in this cycle
- Testing types handled separately (performance, security pentest)
- Platforms or configurations excluded

### Step 7: Identify Open Questions

For each ambiguity found:
- State the question clearly
- Assess its impact on test design
- Mark status (Pending / Resolved)

**Common sources of ambiguity:**
- Undefined error messages or behaviors
- Unclear boundary values
- Missing business rules
- Unspecified platform support

### Step 8: Assess Risks and Constraints

| Risk | Mitigation |
|------|-----------|
| Test environment limitations | Mock services, test data setup |
| Time constraints | Priority-based execution |
| Data dependencies | Seed data scripts |
| Third-party service reliability | Fallback test strategies |

### Step 9: Write Requirements Document

Use the template from `qa-testing:analyzing-test-requirements/requirements-template.md`.

Save to: `docs/qa-testing/requirements/YYYY-MM-DD-<feature>-requirements.md`

### Step 10: Present to User

Present the requirements document:
- Summary of extracted requirements (count by priority)
- Test dimensions matrix
- Scope boundaries
- Open questions needing user input
- Risks and constraints

**REQUIRED:** Get explicit user approval before proceeding.

**REQUIRED:** Invoke `qa-testing:designing-test-cases` after approval.

## Red Flags - STOP and Reassess

- Requirements contain vague terms ("properly", "appropriately", "good") → Must rewrite to be specific
- Cannot identify test dimensions for a requirement → Requirement is not testable, rewrite it
- No acceptance criteria defined → Cannot determine pass/fail
- User refuses to clarify open questions → Document impact, do not guess
- Scope is undefined → Cannot determine what to test
- Requirements are still changing → Wait for stabilization before analysis
- Skipping negative/exception dimensions → Incomplete coverage

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Requirements are obvious, no need to document" | Undocumented requirements lead to missed test coverage |
| "We can figure out test details later" | Without testable requirements, test cases lack foundation |
| "User stories are already detailed enough" | User stories describe intent, not testable behavior |
| "Negative cases are not important" | Negative cases catch real bugs in error handling |
| "We don't have time for requirements analysis" | Skipping analysis leads to incomplete testing |
| "The feature is simple, just test it" | Simple features have edge cases too |
| "I'll just test what the user asked for" | Professional testing covers more than explicit requests |

## Common Mistakes

| Mistake | Consequence | Fix |
|---------|-------------|-----|
| Copying user stories verbatim | Not testable as-is | Rewrite as observable, verifiable statements |
| Missing boundary values | Edge case bugs slip through | Always identify min, max, just-outside limits |
| No exception scenarios | System failures untested | Consider network, timeout, concurrent scenarios |
| Vague scope definition | Scope creep or gaps | Explicitly list in-scope and out-of-scope items |
| Ignoring open questions | Assumptions lead to wrong tests | Flag and resolve before test design |
| Skipping priority assignment | Cannot prioritize execution | Assign P0-P3 to every requirement |
| Not linking to source | Cannot trace back | Reference PRD, user story, or spec section |

## Checklist

Before presenting to user:

- [ ] All functional requirements extracted and numbered (FR-NNN)
- [ ] Every requirement is observable and verifiable
- [ ] Test dimensions identified (positive, negative, boundary, exception)
- [ ] Priority assigned to each requirement (P0/P1/P2/P3)
- [ ] Scope explicitly defined (in-scope and out-of-scope)
- [ ] Open questions documented with impact assessment
- [ ] Risks and constraints identified with mitigation
- [ ] Requirements document saved to `docs/qa-testing/requirements/`
- [ ] User approval obtained

## Quick Reference

| Element | Required? | Example |
|---------|-----------|---------|
| Requirement ID | Yes | FR-001 |
| Title | Yes | Username/Password Login |
| Description | Yes | Users can log in with valid credentials |
| Test Dimensions | Yes | Positive, Negative, Boundary, Exception |
| Priority | Yes | P0 |
| Source Reference | Yes | PRD-2026-001, US-001 |
| Acceptance Criteria | Yes | Redirected to dashboard on success |
| Scope | Yes | In-scope / Out-of-scope |
| Open Questions | If any | Username case-sensitivity? |
| Risks | If any | Email service unreliable in test env |

## Cross-References

- **Downstream:** `qa-testing:designing-test-cases` (creates test cases from approved requirements)
- **Template:** `qa-testing:analyzing-test-requirements/requirements-template.md` (requirements document template)
- **Related:** `qa-testing:using-qa-testing` (workflow overview and conventions)
