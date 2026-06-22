---
name: executing-test-cases
description: Use when running through test cases step by step, recording pass/fail results and logging defects
---

# Test Case Execution

## Overview

Execute test cases methodically, recording results and logging defects with complete evidence.

**Core principle:** Execute exactly as written, record exactly what happens.

**Announce at start:** "I'm using the executing-test-cases skill to run through the test cases."

## When to Use

**Use when:**
- Test cases have been approved by user
- Ready to perform actual testing
- Need to verify system behavior against specifications

**Do NOT use when:**
- Test cases are still being designed
- Requirements are unclear or changing
- Test environment is not ready

## Browser Policy

**Stealth browser is the default and preferred method for all test execution.**

- Always launch a stealth (anti-detection) browser for test execution
- Stealth browser bypasses bot detection, fingerprinting, and automation restrictions
- If stealth browser is unavailable or fails to start, fall back to a standard browser and document the reason
- Never use a regular browser when stealth is available — stealth provides a more realistic user simulation

## Mandatory Execution Policy

**Every required test case MUST be executed. No exceptions.**

- All test cases in the approved document must be executed — no test case may be skipped, deferred, or omitted for any reason
- Acceptable statuses are: **Pass**, **Fail**, or **Blocked** — "Skip" is NOT permitted for required test cases
- If a test case cannot be executed, it must be marked as **Blocked** with a documented reason and reported to the user for resolution
- Common excuses for not executing are invalid (see "Common Rationalizations" below)
- The agent must persist through difficulties: retry failed steps, work around transient issues, and escalate only genuine blockers

## Execution Process

### Step 1: Load Test Case Document

1. Read the approved test case document from `docs/qa-testing/test-cases/`
2. Verify all prerequisites are met (environment, data, access)
3. Create execution tracking structure
4. **Create screenshot directories** — for each test case, create a folder under `docs/qa-testing/screenshots/` to store step screenshots:
   ```
   docs/qa-testing/screenshots/TC-<FEATURE>-NNN/
   ```

### Step 2: Execute by Priority

Execute test cases in priority order (P0 -> P1 -> P2 -> P3):

**Before executing any test case, load the system guide:**

0. **Load System Guide (mandatory)**
   - Look for `docs/qa-testing/system-guide.md` in the **current project root**
   - If found -> load it as operational context; use the guide to supplement incomplete test case descriptions and avoid redundant exploration
   - If NOT found -> create an empty template with the standard structure (see "System Guide Template" section below) and proceed
   - The guide is **project-specific** — it only contains operational knowledge for the current system under test
   - This is the "memory layer" that accumulates knowledge across test case executions within the same project

For each test case:

1. **Mark as In Progress**
   - Update status in tracking document

2. **Verify Preconditions**
   - Confirm all preconditions are met
   - If not met -> Mark as Blocked, document reason

3. **Launch Stealth Browser (mandatory)**
   - Start a stealth browser session before executing any steps
   - If stealth browser fails, retry once; if still failing, fall back to standard browser and log the reason

4. **Execute Steps Sequentially**
   - Perform each step exactly as written
   - Do NOT skip steps
   - Do NOT modify steps on the fly
   - Record actual behavior for each step
   - **Capture screenshots** at key steps (see Screenshot Convention below)
   - **Use the system guide** to resolve ambiguities in test case descriptions (e.g., button locations, navigation paths)

5. **Compare with Expected Results**
   - Check each expected result against actual behavior
   - Document any deviations, even if they seem minor

6. **Record Final Status**
   - **Pass:** All expected results match actual behavior
   - **Fail:** One or more expected results do not match
   - **Blocked:** Cannot execute due to unmet preconditions or environment issues

   **Important:** Pass/Fail determination is based **solely** on the **Expected Result** column. Compare actual behavior against expected results — any deviation is a **Fail**. Do NOT modify the Requirement column during execution.

   **Execution Result Override Principle:** After each execution, the execution result field MUST be updated with the latest result, regardless of whether it already contains a previous value (e.g., Pass, Fail). Always use the most recent execution result.

7. **Log Defects Immediately**
   - If any expected result fails -> Create defect record using `defect-template.md`
   - Include complete evidence: steps taken, actual results, screenshots/logs if available
   - Assign defect ID: `DEFECT-NNN-<short-desc>`
   - Save to `docs/qa-testing/defects/`

8. **Refine Test Case and Update System Guide (mandatory after each TC)**
   - Based on actual execution experience, refine **preconditions and test steps only**
   - **Do NOT modify any other columns** (Expected Result, Requirement, Summary, Description, Priority, etc.)
   - Use **red font** to mark all modifications (see "Test Case Refinement" section below)
   - Core purpose: capture execution experience, ensure fast and smooth future executions without unnecessary exploration
   - Refine: preconditions (missing/mismatched), test steps (vague/mismatched with actual UI)
   - Do NOT modify test case content to mask product bugs — product bugs go to defect log
   - **Update System Guide**: If new operational knowledge was discovered during execution that is NOT already in the system guide, append it to `docs/qa-testing/system-guide.md` in the current project
   - New knowledge includes: navigation paths, button locations, account differences, system behavior quirks, UI element positions
   - Do NOT duplicate existing entries — check the guide before adding

### Step 3: Handle Blocked Cases

When a test case is blocked:

1. Document the specific blocker
2. Identify if other test cases can proceed
3. If blocker affects multiple cases -> Group them and note dependency
4. Continue with unblocked cases
5. Report blockers to user for resolution

### Step 4: Update Progress

After each test case:

- Update execution summary table in test case document
- Note any patterns (e.g., "all login tests failing due to auth service down")
- If multiple failures suggest systemic issue -> Flag for user attention

### Step 5: Complete Execution

When all test cases have been executed or blocked:

1. Generate execution summary:
   - Total cases: X
   - Passed: X (X%)
   - Failed: X (X%)
   - Blocked: X (X%)

2. List all defects discovered with IDs

3. Identify unblocked but not-yet-executed cases (if any)

4. Present summary to user

5. **REQUIRED:** Invoke `qa-testing:generating-test-reports` to create formal report

## Defect Logging

When logging a defect:

**Must include:**
- Unique defect ID: `DEFECT-NNN-<short-desc>`
- Related test case ID
- Severity assessment (Critical/Major/Minor/Trivial)
- Priority assessment (P0/P1/P2/P3)
- Exact steps to reproduce (from test case)
- Expected result (from test case)
- Actual result (what you observed)
- Evidence (error messages, logs, screenshots)
- Environment details

**Use the template:** `qa-testing:executing-test-cases/defect-template.md`

**Save to:** `docs/qa-testing/defects/DEFECT-NNN-<short-desc>.md`

## Screenshot Convention

Each test case has a dedicated screenshot folder: `docs/qa-testing/screenshots/TC-<FEATURE>-NNN/`

**Screenshot naming:** `step-NN-<brief-desc>.png`

Examples:
```
docs/qa-testing/screenshots/TC-LOGIN-001/
├── step-01-login-page.png
├── step-02-enter-credentials.png
├── step-03-click-submit.png
└── step-04-dashboard-redirect.png
```

**When to capture screenshots:**
- **Before execution:** Initial state / preconditions (e.g., login page loaded)
- **Key actions:** Each significant user action (e.g., clicking submit, navigating)
- **Results:** Final outcome showing pass or fail evidence
- **Failures:** Mandatory — capture the exact error state, error message, or unexpected behavior
- **Boundary values:** When test data involves specific input values, capture the input

**Screenshot rules:**
- Capture at every test step for P0/P1 cases
- Capture at minimum: preconditions, key actions, and final result for P2/P3 cases
- Always capture screenshots for failed steps — this is mandatory evidence
- Include timestamps or step numbers in filenames for traceability
- Reference screenshots in the execution log using relative paths

**Screenshot = Evidence = Mandatory:**
- **Every test case MUST have screenshots for key steps. No exceptions.**
- If no screenshots are captured, or all screenshot attempts fail -> Mark the test case as **Blocked**
- A test case without screenshot evidence is considered incomplete and invalid
- The only acceptable statuses with missing screenshots are cases that were Blocked before any execution began (e.g., preconditions not met)

**Screenshot retry policy (mandatory):**
When a screenshot capture fails (timeout, page not ready, network error, etc.), **retry up to 3 times** before recording the failure:

| Attempt | Action |
|---------|--------|
| 1st | Take screenshot normally |
| 2nd | Wait 2 seconds, then retry |
| 3rd | Wait 3 seconds, then retry |

- After 3 consecutive failures, mark the test case as **Blocked** due to screenshot capture failure
- For element-specific screenshots: verify the target element exists and is visible before retrying
- For full-page screenshots that timeout: retry with `fullPage: false` first, then retry full page
- **Never skip a screenshot silently** — either capture it successfully or mark the test case as Blocked

## Evidence Collection

When recording failures:

- **Error messages:** Copy exact text, including error codes
- **Logs:** Capture relevant log sections with timestamps
- **Screenshots:** Save to the test case's screenshot folder, reference in execution log
- **Network responses:** Note HTTP status codes, response bodies
- **Timing:** Note if delays or timeouts occurred

## Test Case Refinement

After executing each test case, **immediately** refine the original test case document based on actual execution experience.

### Core Purpose

**Optimize preconditions and test steps to ensure fast, smooth future executions without unnecessary exploration.**

Tacit knowledge discovered during execution must be captured in the test case:
- Missing preconditions -> Complete them to avoid discovering gaps next time
- Vague steps -> Make precise (element location, operation order, wait timing) to avoid repeated trial-and-error
- Actual path differs from test case -> Correct the path to avoid going in the wrong direction next time

### What to Refine

**Only the following columns may be modified during test write-back:**

| Area | Refinement Focus | Example |
|------|-----------------|---------|
| **Preconditions** | Add conditions required before execution but missing from the test case; correct descriptions that don't match reality | "Parent login" -> "**Teacher** login" (actual account is teacher identity) |
| **Test Steps** | Add operation details (element position, click order, wait timing); correct descriptions that don't match actual UI | "Click login button" -> "First check privacy agreement, switch to password login tab, enter account/password/captcha, then click login button" |

**All other columns are read-only during execution write-back**, including but not limited to: Expected Result, Requirement, Summary, Description, Priority, Test Suite.

### What NOT to Refine

**Only "Preconditions" and "Test Steps" may be modified. All other columns are forbidden to change:**
- **Expected Result** — must remain unchanged; if actual does not match expected, mark as Fail and log defect
- **Requirement** — design reference, not an execution field
- **Summary, Description, Priority, Test Suite** — do not modify
- If the system behaves incorrectly -> Log as defect, keep original expected result unchanged
- Red font marks *test case corrections* for preconditions/steps only, not *product workarounds*

**Decision flowchart:**
```
Difference found during execution?
├── Test case description doesn't match reality -> Revise test case in RED (refinement)
├── Product has a bug -> Log defect, don't modify test case
└── Environment issue -> Mark Blocked, don't modify test case
```

### Formatting Rules

**Markdown test cases:**
- Wrap modified text in `<font color="red">...</font>` tags
- For replaced text: show new text in red, remove old text
- Add revision note at end of modified line: `<font color="red">[Revised YYYY-MM-DD: reason]</font>`

Example:
```markdown
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open login page | Login form displayed |
| 2 | <font color="red">First check privacy agreement, switch to password login, enter account/password/captcha, click login</font> <font color="red">[Revised 2026-06-17: Original steps missing privacy agreement check and login mode switch]</font> | Login successful, enter homepage |
```

**Excel test cases:**
- Set modified cell font color to **red** (RGB: #FF0000)
- Replace original content with corrected content in red
- Add revision note: `[Revised YYYY-MM-DD: reason]`

### When to Refine

- **Immediately after each test case execution** — while context is fresh
- Only refine the test case that was just executed
- Do NOT batch refinements for multiple test cases

### Checklist

- [ ] Review execution process, identify missing or incorrect preconditions
- [ ] Review execution process, identify vague steps or mismatches with actual UI
- [ ] Revise preconditions and steps in red font, capturing execution experience
- [ ] Verify no other columns were modified (Expected Result, Requirement, Summary etc. must be untouched)
- [ ] Log product bugs as defects (do NOT modify test case to hide bugs)
- [ ] Save revised test case document

## System Guide Template

When no `docs/qa-testing/system-guide.md` exists in the project, create one with this structure:

```markdown
# System Operation Guide — {project name}

> Project-specific operational knowledge accumulated during test execution. Load before each test case, update after each test case.

## Accounts
<!-- Test account credentials and characteristics -->

## Login Flow
<!-- Login steps, authentication quirks, session behavior -->

## Navigation
<!-- Page navigation paths, URL patterns -->

## Feature Notes
<!-- Module-specific operation details, UI element locations, permission differences -->

## Execution History
<!-- New operational knowledge discovered during each execution, with date -->
```

### Rules for the System Guide

| Rule | Description |
|------|-------------|
| **Project-scoped** | Each project has its own `system-guide.md` — never mix knowledge from different systems |
| **Load before execution** | Read the guide at the start of Step 2 to supplement test case descriptions |
| **Update after execution** | Append new knowledge discovered during execution that is not already in the guide |
| **No duplication** | Check existing entries before adding; update outdated entries instead of appending duplicates |
| **Concrete, not generic** | Record specific facts (button at y=958, not "button at bottom") |
| **Keep it lean** | Only record operational knowledge that helps avoid exploration; don't duplicate test case content |

## Progress Tracking

Maintain a simple execution log:

```
## Execution Log

### Started: YYYY-MM-DD HH:MM

| Time | TC ID | Status | Defect ID | Notes |
|------|-------|--------|-----------|-------|
| 10:15 | TC-LOGIN-001 | Pass | - | - |
| 10:17 | TC-LOGIN-002 | Fail | DEFECT-001 | Password validation not working |
| 10:20 | TC-LOGIN-003 | Blocked | - | Auth service down |
```

## Red Flags - STOP Immediately

- Skipping test steps because "they probably work" -> Execute every step
- Modifying expected results to hide product bugs -> Record actual, flag as defect; only refine test case when the *description itself* was wrong
- "I'll log this defect later" -> Log immediately with full context
- Marking test as Pass when one expected result failed -> Partial failure = Fail
- **Skipping execution result write-back because the field already has a value** -> Always overwrite with the latest execution result; previous values are irrelevant
- Continuing execution when environment is unstable -> Mark test case as Blocked
- Ignoring "minor" deviations -> All deviations are defects until assessed
- Refining test case without red font -> All modifications MUST be in red for traceability
- **Modifying columns other than Preconditions/Test Steps** -> Only preconditions and test steps may be refined; Expected Result, Requirement, Summary etc. are read-only
- **Key step screenshots not captured or screenshot failed** -> Mark test case as **Blocked**; no screenshot = no evidence = incomplete execution
- **Skipping a test case for any reason** -> All required test cases must be executed; use Blocked status for genuine blockers only
- **Using a regular browser when stealth is available** -> Stealth browser is the default; always prefer stealth for test execution

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "This step is obvious, I can skip it" | Every step must be executed as written |
| "The failure is trivial, not worth logging" | Trivial failures may reveal patterns; log all |
| "I'll test this informally first" | Informal testing is not execution; use test cases |
| "The defect is intermittent, might not be real" | Log it with note "intermittent"; investigate later |
| "User wants quick results, I can skip details" | Quick results without evidence are worthless |
| "The environment isn't perfect but close enough" | Environment issues = Blocked; do not execute |
| "Actual matches the updated requirement, so it's a pass" | Pass/Fail is based solely on Expected Result column. If expected result says 3 items but actual has 4, it's a **Fail** — regardless of any other column |
| "This test case is not important, I can skip it" | All required test cases must be executed; no exceptions |
| "Screenshots keep failing, I'll continue without them" | No screenshots = Blocked; screenshot evidence is mandatory |
| "Stealth browser failed, I'll just use a regular one without noting it" | Always prefer stealth; if fallback is needed, document the reason |

## Common Mistakes

| Mistake | Consequence | Fix |
|---------|-------------|-----|
| Executing steps out of order | May miss dependencies | Follow sequence exactly |
| Not recording actual results | Cannot prove what happened | Record every observation |
| Combining multiple test cases | Loses granularity | Execute one TC at a time |
| Modifying test data mid-execution | Invalidates results | Use specified test data |
| Not checking preconditions | Test may be invalid | Verify before each TC |

## Checklist

Before starting execution:

- [ ] Test case document is approved by user
- [ ] Test environment is ready and stable
- [ ] Test data is prepared
- [ ] Defect template is available
- [ ] Execution tracking structure is created
- [ ] Screenshot directories created for each test case
- [ ] System guide loaded from `docs/qa-testing/system-guide.md` (or created if not exists)
- [ ] Stealth browser is available and ready

During execution:

- [ ] Using stealth browser for all test execution
- [ ] Executing ALL required test cases — no skipping
- [ ] Executing test cases in priority order
- [ ] Verifying preconditions for each case
- [ ] Executing steps sequentially without modification
- [ ] Using system guide to resolve ambiguities in test case descriptions
- [ ] Capturing screenshots at key steps (no screenshot = Blocked)
- [ ] Recording actual results for each step
- [ ] Logging defects immediately when found
- [ ] Updating execution result with latest value (overwrite any previous result)
- [ ] Updating execution summary after each case
- [ ] Refining test case in red font after each TC (preconditions/steps ONLY, no other columns)
- [ ] Updating system guide with new operational knowledge discovered during execution

After execution:

- [ ] All test cases have status (Pass/Fail/Blocked) — no Skip allowed for required cases
- [ ] All defects logged with complete information
- [ ] Execution summary is complete
- [ ] Summary presented to user

## Quick Reference

| Status | Meaning | When to Use |
|--------|---------|-------------|
| Pass | All expected results match | Every step succeeded, actual = Expected Result |
| Fail | Expected != Actual | Any deviation from Expected Result column |
| Blocked | Cannot execute | Preconditions not met, or screenshot capture failed |

| Severity | Definition | Example |
|----------|------------|---------|
| Critical | System crash, data loss, security breach | Login bypass, database corruption |
| Major | Major feature broken, no workaround | Cannot complete purchase |
| Minor | Feature broken but workaround exists | Button misaligned but functional |
| Trivial | Cosmetic, minor inconvenience | Typo in error message |

## Cross-References

- **Upstream:** `qa-testing:designing-test-cases` (provides test cases to execute)
- **Downstream:** `qa-testing:generating-test-reports` (creates formal report from execution data)
- **Downstream:** `qa-testing:analyzing-defects` (analyzes logged defects)
- **Related:** `qa-testing:executing-test-cases/defect-template.md` (defect record template)
