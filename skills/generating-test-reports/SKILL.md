---
name: generating-test-reports
description: Use when test execution is complete and you need to summarize results into a structured test report
---

# Test Report Generation

## Overview

Synthesize test execution results into a structured, data-driven report that tells the story of product quality.

**Core principle:** A report without data is an opinion. Every claim must be backed by numbers.

**Announce at start:** "I'm using the generating-test-reports skill to create the test report."

## When to Use

**Use when:**
- All planned test cases have been executed or blocked
- User asks for test summary or status
- A testing phase (sprint, milestone) is ending
- Need to communicate testing progress to stakeholders

**Do NOT use when:**
- Test execution is still in progress (wait until complete)
- Test cases are not yet designed
- Have not performed requirements analysis

## Report Generation Checklist

You MUST complete these steps in order:

1. **Collect execution data** — gather all test results from execution records
2. **Verify data completeness** — ensure every test case has a status
3. **Calculate metrics** — compute pass rates, coverage, defect density
4. **Summarize defects** — list all defects with severity and status
5. **Assess risk** — evaluate quality based on data
6. **Write conclusion** — clear release recommendation
7. **Write report to file** — save to `docs/qa-testing/test-reports/`
8. **Self-review** — check for missing data or unsupported conclusions
9. **Present to user** — get approval

## Core Process

### Step 1: Collect Execution Data

Read all test execution records and defect logs:

- Test case document from `docs/qa-testing/test-cases/`
- Individual defect records from `docs/qa-testing/defects/`
- Execution log entries with timestamps

Verify that every test case in the document has a recorded status.

### Step 2: Calculate Metrics

Compute the following metrics:

| Metric | Formula | Purpose |
|--------|---------|---------|
| Total Cases | Count of all TCs | Scope measurement |
| Executed | Passed + Failed | Execution progress |
| Pass Rate | Passed / Executed × 100% | Quality indicator |
| Fail Rate | Failed / Executed × 100% | Problem indicator |
| Block Rate | Blocked / Total × 100% | Environment readiness |
| Skip Rate | Skipped / Total × 100% | Coverage gap |
| Defect Density | Total Defects / Executed Cases | Code quality indicator |
| Requirement Coverage | Covered Requirements / Total Requirements | Test adequacy |
| Critical Defect Count | Count of Critical severity | Release blocker indicator |
| Major Defect Count | Count of Major severity | Quality risk indicator |

### Step 3: Summarize Defects

Create a defect summary section:

- Total defects by severity (Critical / Major / Minor / Trivial)
- Total defects by status (Open / Fixed / Verified / Closed)
- Top defects (Critical and Major) with brief descriptions
- Defect distribution by module/area (if identifiable)

### Step 4: Assess Risk

Based on the data, evaluate quality risk:

**High Risk (Red):**
- Any Critical defects remain open
- Pass rate below 70%
- Requirement coverage below 80%
- More than 20% cases blocked

**Medium Risk (Yellow):**
- Major defects remain open
- Pass rate 70-90%
- Some blocked cases but workaround exists

**Low Risk (Green):**
- No Critical or Major open defects
- Pass rate above 90%
- Requirement coverage above 95%
- Minimal blocked/skipped cases

### Step 5: Write Conclusion

The conclusion must include:

1. **Release Recommendation:** Recommend / Conditional / Do Not Recommend
2. **Key Findings:** 3-5 most important observations
3. **Open Risks:** What could go wrong if released
4. **Recommendations:** What should be done before release (if anything)

**Release Recommendation Criteria:**

| Recommendation | Criteria |
|---------------|----------|
| **Recommend** | No Critical/Major open defects, pass rate ≥ 95%, coverage ≥ 95% |
| **Conditional** | Minor defects open, pass rate ≥ 80%, coverage ≥ 85% |
| **Do Not Recommend** | Any Critical open, pass rate < 80%, or coverage < 85% |

### Step 6: Write Report

Use the template from `qa-testing:generating-test-reports/test-report-template.md`.

Save to: `docs/qa-testing/test-reports/YYYY-MM-DD-<feature>-test-report.md`

### Step 7: Self-Review

After writing the report, check:

1. **Data accuracy:** Do all numbers add up? Does Total = Passed + Failed + Blocked + Skipped?
2. **Completeness:** Is every test case accounted for? Every defect listed?
3. **Consistency:** Does the conclusion match the data? (e.g., don't recommend release with open Critical defects)
4. **Clarity:** Would a stakeholder understand the quality status from this report?

Fix any issues found.

### Step 8: Present to User

Present the report summary to the user:

- Key metrics
- Release recommendation
- Critical findings
- Open risks

Wait for user approval. If user requests changes, revise and re-present.

### Step 9: Transition

If defects exist and need deeper analysis:

**REQUIRED:** Invoke `qa-testing:analyzing-defects` for detailed defect analysis.

If no defects or user declines defect analysis:

Report is complete. Summarize next steps.

## Report Format Quick Reference

```markdown
# Test Report: <Feature Name>

## Summary
- Date: YYYY-MM-DD
- Tester: <Agent/User>
- Version/Build: <version>
- Total Cases: X | Passed: X | Failed: X | Blocked: X | Skipped: X
- Pass Rate: X%
- Defects Found: X (Critical: X, Major: X, Minor: X, Trivial: X)

## Metrics
<Full metrics table>

## Defect Summary
<Defects by severity and status>

## Key Findings
<3-5 bullet points>

## Risk Assessment
<Risk level with justification>

## Conclusion & Recommendation
<Release recommendation with criteria>

## Appendix
- Test case document: link
- Defect records: links
```

## Red Flags - STOP and Reassess

- Numbers don't add up (Total ≠ Passed + Failed + Blocked + Skipped)
- Conclusion contradicts the data (recommending release with Critical defects)
- Missing test case results (some TCs have no status)
- Defects referenced but not documented
- "Pass rate is good enough" without defining threshold
- Report has no release recommendation
- Presenting report to user before self-review

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Report is too detailed, users just want the number" | Stakeholders need context to make decisions |
| "Can estimate, don't need exact counts" | Estimates without data are guesses; count exactly |
| "Skip risk assessment, just list the numbers" | Numbers without interpretation are not actionable |
| "No need for recommendation, user can decide" | The report's purpose is to support the decision; provide recommendation |
| "Defect analysis is someone else's job" | Report must summarize defects; detailed analysis is separate |
| "Self-review is redundant" | Errors in reports damage credibility; always review |

## Common Mistakes

| Mistake | Consequence | Fix |
|---------|-------------|-----|
| Rounding percentages inconsistently | Confusing data | Use consistent precision (1 decimal) |
| Mixing execution dates | Unclear timeline | State date range explicitly |
| Omitting blocked cases from metrics | Inflated pass rate | Include blocked in denominator |
| Not linking defect IDs | Cannot trace issues | Always reference DEFECT-NNN |
| Subjective conclusions | Untrustworthy | Base every claim on data |

## Cross-References

- **Upstream:** `qa-testing:executing-test-cases` (provides execution data)
- **Downstream:** `qa-testing:analyzing-defects` (deep defect analysis if needed)
- **Template:** `qa-testing:generating-test-reports/test-report-template.md`
- **Related:** `qa-testing:analyzing-test-requirements` (for requirement coverage calculation)
