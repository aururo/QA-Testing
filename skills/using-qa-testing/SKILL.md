---
name: using-qa-testing
description: Use when starting any QA testing session or when user mentions testing, test cases, defects, or quality assurance
---

# Using QA Testing Workflow

This plugin provides a complete QA testing methodology for functional (black-box) testing. It guides you through a structured workflow from requirements analysis to defect analysis.

## Core Principle

**Never skip workflow steps. Each phase has mandatory checkpoints and user approvals.**

## Workflow Overview

```
Requirements Analysis → Test Case Design → Test Execution → Test Report → Defect Analysis
```

Each phase produces structured artifacts and requires user approval before proceeding.

## Available Skills

When user requests involve testing, you MUST invoke the appropriate skill:

| Skill | When to Use |
|-------|-------------|
| `qa-testing:analyzing-test-requirements` | User provides requirements, user stories, or specs needing test coverage |
| `qa-testing:designing-test-cases` | You have test requirements and need structured test cases |
| `qa-testing:executing-test-cases` | You need to run test cases and record results |
| `qa-testing:generating-test-reports` | Test execution is complete, need summary report |
| `qa-testing:analyzing-defects` | Defects found during testing need analysis and prioritization |

## File Storage Convention

All testing artifacts are stored in `docs/qa-testing/` within the target project:

```
docs/qa-testing/
├── requirements/
│   └── YYYY-MM-DD-<feature>-requirements.md
├── test-cases/
│   └── YYYY-MM-DD-<feature>-test-cases.md
├── test-reports/
│   └── YYYY-MM-DD-<feature>-test-report.md
├── defects/
│   └── DEFECT-NNN-<short-desc>.md
└── screenshots/
    └── TC-<FEATURE>-NNN/
        ├── step-01-<brief-desc>.png
        ├── step-02-<brief-desc>.png
        └── ...
```

## Common Terminology

| Term | Definition |
|------|------------|
| **Test Case** | A structured set of preconditions, steps, and expected results |
| **Defect** | A deviation from expected behavior discovered during testing |
| **Severity** | Impact level: Critical, Major, Minor, Trivial |
| **Priority** | Fix urgency: P0 (Immediate), P1 (High), P2 (Medium), P3 (Low) |
| **Test Coverage** | Percentage of requirements covered by test cases |

## Red Flags - STOP and Reassess

- User asks to "just run some tests" without requirements → Must do requirements analysis first
- Trying to skip test case design → Cannot execute without structured cases
- "I'll just note defects later" → Must use defect template immediately when found
- Modifying expected results to match actual behavior → This is falsification, not testing
- Skipping user approval between phases → Each phase requires explicit approval

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Requirements are obvious, no need to document" | Undocumented requirements lead to incomplete test coverage |
| "Can skip test cases and just execute" | Unstructured execution misses edge cases and cannot be reproduced |
| "Defects can wait until end of testing" | Delayed defect logging loses context and evidence |
| "Report is too much work" | Without report, testing effort is invisible and unmeasurable |
| "User didn't ask for full workflow" | Professional testing requires full workflow regardless of request |

## When to Start

**Invoke `qa-testing:analyzing-test-requirements` when:**
- User provides new feature requirements or user stories
- User asks "what should we test?"
- User mentions test planning or test strategy
- New sprint/iteration starts with testable features

**DO NOT:**
- Jump directly to test case design without requirements analysis
- Start test execution without approved test cases
- Generate reports without complete execution data
- Analyze defects without proper defect records
