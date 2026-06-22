---
name: analyzing-defects
description: Use when defects have been discovered during testing and need to be categorized, prioritized, and analyzed for root causes and improvement opportunities
---

# Defect Analysis

## Overview

Analyze defects to identify patterns, root causes, and improvement opportunities for the development process.

**Core principle:** Defects are symptoms; understanding root causes prevents recurrence.

**Announce at start:** "I'm using the analyzing-defects skill to perform root cause analysis on the discovered defects."

## When to Use

**Use when:**
- Test execution has completed and defects have been logged
- User requests deeper understanding of quality issues
- Need to prioritize defect resolution
- Identifying process improvement opportunities

**Do NOT use when:**
- Defects are still being discovered (complete execution first)
- No defects were found (nothing to analyze)
- User only needs a quick defect list (use test report instead)

## Analysis Checklist

You MUST complete these steps in order:

1. **Collect all defect records** — gather from `docs/qa-testing/defects/`
2. **Categorize by type** — classify each defect
3. **Analyze patterns** — identify common characteristics
4. **Determine root causes** — go beyond symptoms
5. **Assess impact** — evaluate business and technical impact
6. **Recommend improvements** — suggest process or code changes
7. **Write analysis report** — document findings
8. **Present to user** — share insights and recommendations

## Core Process

### Step 1: Collect Defect Records

Read all defect records from `docs/qa-testing/defects/`.

For each defect, extract:
- Defect ID and description
- Severity and priority
- Related test case
- Steps to reproduce
- Actual vs expected behavior
- Evidence (error messages, logs)
- Component/module affected

### Step 2: Categorize Defects

Classify each defect by type:

| Type | Description | Examples |
|------|-------------|----------|
| **Functional** | Feature doesn't work as specified | Button doesn't submit, calculation wrong |
| **UI/UX** | Interface issues, usability problems | Misaligned elements, confusing labels |
| **Data** | Data handling errors | Wrong data displayed, data loss |
| **Integration** | Component interaction failures | API returns wrong format, timing issues |
| **Performance** | Speed or resource issues | Slow response, memory leak |
| **Security** | Vulnerabilities or access control issues | Injection flaws, unauthorized access |
| **Compatibility** | Environment-specific failures | Works in Chrome but not Firefox |
| **Configuration** | Setup or environment issues | Wrong default settings, missing config |

### Step 3: Analyze Patterns

Look for patterns across defects:

**By Component/Module:**
- Are defects concentrated in one area?
- Which modules have the most Critical/Major defects?

**By Type:**
- Are most defects functional? UI? Integration?
- Does one type dominate?

**By Root Cause:**
- Are multiple defects caused by the same underlying issue?
- Are there common themes (e.g., "all input validation failures")?

**By Test Phase:**
- Are defects mostly in new features or existing features?
- Are they in happy paths or edge cases?

### Step 4: Root Cause Analysis

For each defect (especially Critical/Major), determine the root cause:

**Common Root Cause Categories:**

| Category | Description | Prevention |
|----------|-------------|------------|
| **Requirements Gap** | Requirement was missing or unclear | Improve requirements review process |
| **Design Flaw** | Architecture or design doesn't support requirement | Add design reviews, prototype complex features |
| **Implementation Error** | Code doesn't match design/requirements | Better code review, more unit tests |
| **Edge Case Missed** | Boundary conditions not considered | Mandatory boundary analysis in design |
| **Integration Issue** | Components don't work together correctly | Integration testing earlier in cycle |
| **Environment Mismatch** | Code works in dev but not in test/prod | Environment standardization |
| **Third-Party Dependency** | External library/service issue | Better vendor evaluation, fallback mechanisms |
| **Configuration Error** | Wrong settings or missing config | Configuration validation, environment checks |
| **Race Condition** | Timing-dependent failures | Concurrency analysis, thread-safe design |
| **Data Issue** | Invalid or unexpected data | Data validation, sanitization |

**Root Cause Analysis Technique:**

For each significant defect, ask "Why?" five times:

```
Defect: Login fails with valid credentials
Why? → Password validation returns false
Why? → Hash comparison fails
Why? → Stored hash is outdated format
Why? → Migration script didn't run
Why? → No verification step in deployment checklist
Root Cause: Missing deployment verification for data migrations
```

### Step 5: Assess Impact

Evaluate the impact of defects:

**Business Impact:**
- Does it block core user workflows?
- How many users are affected?
- Is there a workaround?
- Does it affect revenue, reputation, or compliance?

**Technical Impact:**
- Does it affect system stability?
- Does it create security vulnerabilities?
- Does it affect other components?
- How difficult is it to fix?

**Impact Scoring:**

| Level | Business Impact | Technical Impact |
|-------|----------------|------------------|
| High | Blocks core workflow, no workaround | System crash, data loss, security breach |
| Medium | Degrades experience, workaround exists | Feature broken but system stable |
| Low | Minor inconvenience | Cosmetic issue, no functional impact |

### Step 6: Recommend Improvements

Based on root cause analysis, suggest improvements:

**Code-Level Improvements:**
- Specific code fixes needed
- Additional validation or error handling
- Refactoring suggestions
- Additional unit tests needed

**Process Improvements:**
- Requirements review gaps
- Design review needs
- Code review focus areas
- Testing strategy adjustments

**Prevention Measures:**
- What could prevent similar defects in the future?
- What checks or validations should be added?
- What documentation needs updating?

**Prioritize Recommendations:**
- Immediate (must fix before release)
- Short-term (fix in next sprint)
- Long-term (process improvement)

### Step 7: Write Analysis Report

Use the template from `qa-testing:analyzing-defects/defect-analysis-template.md`.

Save to: `docs/qa-testing/test-reports/YYYY-MM-DD-<feature>-defect-analysis.md`

### Step 8: Present to User

Present the analysis findings:

- Key patterns discovered
- Most significant root causes
- Critical recommendations
- Process improvement opportunities

Discuss with user and get feedback.

## Red Flags - STOP and Reassess

- Analyzing defects before all execution is complete
- Skipping root cause analysis for Critical/Major defects
- Blaming individuals instead of processes
- Recommending fixes without understanding root causes
- Ignoring patterns that suggest systemic issues
- Making recommendations without prioritization
- Not linking analysis back to specific defects

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Defects are self-explanatory, no need for analysis" | Analysis prevents recurrence; without it, same defects return |
| "Root cause is obviously bad coding" | Surface causes are obvious; root causes reveal process failures |
| "We don't have time for analysis, just fix the bugs" | Fixing without understanding leads to incomplete fixes and new bugs |
| "Minor defects don't need analysis" | Minor defects often reveal patterns that prevent major defects |
| "Analysis is for managers, not developers" | Developers who understand root causes write better code |
| "We already know what went wrong" | If you know, document it; if you skip analysis, you probably don't know |

## Common Mistakes

| Mistake | Consequence | Fix |
|---------|-------------|-----|
| Stopping at "human error" | Misses process improvements | Ask "why" until you reach process gaps |
| Analyzing only Critical defects | Misses patterns in Minor defects | Analyze all defects, depth varies by severity |
| No categorization | Cannot identify patterns | Always categorize by type and component |
| Recommendations too vague | Cannot act on them | Make recommendations specific and actionable |
| Not linking to requirements | Cannot assess coverage gaps | Always reference related requirements/test cases |

## Quick Reference

| Analysis Type | When to Use | Depth |
|---------------|-------------|-------|
| Quick Summary | User needs fast overview | Categorization only, no root cause |
| Standard Analysis | Normal testing cycle | Categorization + root cause for Critical/Major |
| Deep Analysis | Major quality issues, post-mortem | Full root cause for all defects, pattern analysis |

| Recommendation Priority | Action Timeline | Example |
|------------------------|----------------|---------|
| Immediate | Before release | Critical security fix, data loss prevention |
| Short-term | Next sprint | Improve error handling, add validation |
| Long-term | Process improvement | Add code review checklist, update design review process |

## Cross-References

- **Upstream:** `qa-testing:executing-test-cases` (provides defect records)
- **Upstream:** `qa-testing:generating-test-reports` (provides execution context)
- **Downstream:** `qa-testing:analyzing-test-requirements` (if requirements gaps identified)
- **Downstream:** `qa-testing:designing-test-cases` (if additional test coverage needed)
- **Related:** `qa-testing:executing-test-cases/defect-template.md` (defect record format)
- **Template:** `qa-testing:analyzing-defects/defect-analysis-template.md` (defect analysis report template)
