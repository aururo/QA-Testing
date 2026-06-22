# Test Report: <Feature Name>

## Report Information

| Field | Value |
|-------|-------|
| **Report ID** | RPT-YYYY-MM-DD-NNN |
| **Feature** | <Feature Name> |
| **Date** | YYYY-MM-DD |
| **Tester** | <Agent/User Name> |
| **Version/Build** | <Version or Build Number> |
| **Environment** | <OS, Browser, Configuration> |
| **Test Case Document** | <Link to test case file> |
| **Requirements Document** | <Link to requirements file> |

---

## Executive Summary

<2-3 sentence summary: what was tested, key finding, release recommendation>

**Release Recommendation:** Recommend / Conditional / Do Not Recommend

---

## Execution Summary

| Metric | Count | Percentage |
|--------|-------|------------|
| Total Test Cases | X | 100% |
| Passed | X | X.X% |
| Failed | X | X.X% |
| Blocked | X | X.X% |
| Skipped | X | X.X% |
| **Executed** | **X** | **X.X%** |

### Execution Timeline

| Date | Cases Executed | Passed | Failed | Blocked |
|------|---------------|--------|--------|---------|
| YYYY-MM-DD | X | X | X | X |

---

## Quality Metrics

| Metric | Value | Target | Status |
|--------|-------|--------|--------|
| Pass Rate | X.X% | ≥ 95% | PASS / FAIL |
| Requirement Coverage | X.X% | ≥ 95% | PASS / FAIL |
| Defect Density | X.X | < 0.5 | PASS / FAIL |
| Critical Defects | X | 0 | PASS / FAIL |
| Major Defects | X | ≤ 2 | PASS / FAIL |
| Block Rate | X.X% | < 5% | PASS / FAIL |

---

## Defect Summary

### By Severity

| Severity | Count | Open | Fixed | Verified | Closed |
|----------|-------|------|-------|----------|--------|
| Critical | X | X | X | X | X |
| Major | X | X | X | X | X |
| Minor | X | X | X | X | X |
| Trivial | X | X | X | X | X |
| **Total** | **X** | **X** | **X** | **X** | **X** |

### Critical & Major Defects

| Defect ID | Description | Severity | Status | Related TC |
|-----------|-------------|----------|--------|------------|
| DEFECT-NNN-xxx | <Brief description> | Critical | Open | TC-XXX-NNN |

<Include all Critical and Major defects. Minor and Trivial summarized above.>

### Defect Distribution by Module

| Module | Critical | Major | Minor | Trivial | Total |
|--------|----------|-------|-------|---------|-------|
| <Module A> | X | X | X | X | X |

---

## Key Findings

1. <Most important finding>
2. <Second most important finding>
3. <Third most important finding>
<Add up to 5 key findings>

---

## Risk Assessment

**Overall Risk Level:** HIGH / MEDIUM / LOW

### Risk Factors

| Risk | Level | Justification |
|------|-------|---------------|
| Functional Quality | High/Med/Low | <Based on pass rate and defect data> |
| Release Readiness | High/Med/Low | <Based on open defects and coverage> |
| Regression Risk | High/Med/Low | <Based on scope of changes and stability> |

---

## Conclusion & Recommendation

### Recommendation: <Recommend / Conditional / Do Not Recommend>

**Justification:**

<Based on the metrics and findings above, explain why this recommendation is made. Reference specific data points.>

**Conditions (if Conditional):**

- <Condition 1 that must be met before release>
- <Condition 2>

**If Released As-Is:**

- <Risk 1 of releasing without addressing issues>
- <Risk 2>

---

## Recommendations

### Before Release
- <Action item 1>
- <Action item 2>

### After Release
- <Follow-up action 1>
- <Monitoring recommendation>

---

## Appendix

### A. Test Case Execution Details

| TC ID | Description | Priority | Status | Defect ID | Notes |
|-------|-------------|----------|--------|-----------|-------|
| TC-XXX-001 | <Description> | P0 | Pass | - | - |
| TC-XXX-002 | <Description> | P0 | Fail | DEFECT-001 | <Brief note> |

### B. Defect Records

| Defect ID | File Path |
|-----------|-----------|
| DEFECT-NNN-xxx | `docs/qa-testing/defects/DEFECT-NNN-xxx.md` |

### C. Requirements Coverage Matrix

| Requirement ID | Description | Test Cases | Status |
|---------------|-------------|------------|--------|
| REQ-001 | <Description> | TC-XXX-001, TC-XXX-002 | Covered |
