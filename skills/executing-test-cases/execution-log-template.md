# Test Case Execution

## Execution Log

### Started: YYYY-MM-DD HH:MM

**Tester:** <Agent/User Name>
**Feature:** <Feature Name>
**Test Case Document:** `docs/qa-testing/test-cases/YYYY-MM-DD-<feature>-test-cases.md`
**Environment:** <OS, Browser, Version>

---

## Execution Summary

| Metric | Count | Percentage |
|--------|-------|------------|
| Total Cases | X | 100% |
| Passed | X | X% |
| Failed | X | X% |
| Blocked | X | X% |
| Skipped | X | X% |

---

## Detailed Execution Log

| Time | TC ID | Description | Status | Defect ID | Notes |
|------|-------|-------------|--------|-----------|-------|
| HH:MM | TC-XXX-001 | <Description> | Pass | - | - |
| HH:MM | TC-XXX-002 | <Description> | Fail | DEFECT-001 | <Brief note> |
| HH:MM | TC-XXX-003 | <Description> | Blocked | - | <Blocker reason> |
| HH:MM | TC-XXX-004 | <Description> | Skip | - | <Skip reason> |

---

## Execution Details

### TC-XXX-001: <Description>
- **Status:** Pass / Fail / Blocked / Skip
- **Start Time:** HH:MM
- **End Time:** HH:MM
- **Actual Results:**
  - Step 1: <What actually happened>
  - Step 2: <What actually happened>
- **Screenshots:**
  - Step 1: `docs/qa-testing/screenshots/TC-XXX-001/step-01-<desc>.png`
  - Step 2: `docs/qa-testing/screenshots/TC-XXX-001/step-02-<desc>.png`
- **Defects Found:** DEFECT-NNN (if any)
- **Notes:** <Any observations>

### TC-XXX-002: <Description>
- **Status:** Pass / Fail / Blocked / Skip
- **Start Time:** HH:MM
- **End Time:** HH:MM
- **Actual Results:**
  - Step 1: <What actually happened>
- **Screenshots:**
  - Step 1: `docs/qa-testing/screenshots/TC-XXX-002/step-01-<desc>.png`
- **Defects Found:** DEFECT-NNN (if any)
- **Notes:** <Any observations>

---

## Blocked Cases

| TC ID | Blocker | Resolution Needed |
|-------|---------|-------------------|
| TC-XXX-003 | <Blocker description> | <What needs to happen to unblock> |

---

## Skipped Cases

| TC ID | Reason | Impact |
|-------|--------|--------|
| TC-XXX-004 | <Skip reason> | <Impact on coverage> |

---

## Defects Summary

| Defect ID | Severity | Status | Related TC |
|-----------|----------|--------|------------|
| DEFECT-001 | Major | Open | TC-XXX-002 |

---

## Observations and Patterns

<Note any patterns observed during execution, such as:>
- "All login tests failing due to auth service down"
- "UI alignment issues across multiple pages"
- "Performance degradation after 100 records"

---

## Completion Status

**Execution Completed:** YYYY-MM-DD HH:MM

**Remaining Work:**
- <List any cases not executed>
- <List any blockers pending resolution>

**Ready for Report:** Yes / No

---

## Sign-off

| Role | Name | Date |
|------|------|------|
| Tester | <Name> | <Date> |
| QA Lead | <Name> | <Date> |
