# QA Testing Workflow Plugin

A complete QA testing methodology plugin for AI coding agents, providing structured workflows for functional (black-box) testing.

## Overview

This plugin guides AI agents through a professional QA testing process, from requirements analysis to defect analysis. It enforces best practices through structured workflows, mandatory checkpoints, and user approval gates.

## Installation

### Claude Code

```bash
/plugin install qa-testing-workflow@<marketplace-or-local>
```

### Manual Installation

1. Copy the `qa-testing/` directory to your project
2. Configure your agent to load the plugin from the directory
3. The session-start hook will automatically inject the workflow guide

## Workflow

```
Requirements Analysis → Test Case Design → Test Execution → Test Report → Defect Analysis
```

Each phase produces structured artifacts and requires user approval before proceeding.

## Skills

| Skill | Purpose |
|-------|---------|
| **using-qa-testing** | Bootstrap skill that introduces the workflow and conventions |
| **analyzing-test-requirements** | Extract testable requirements from user stories and specs |
| **designing-test-cases** | Create structured test cases with steps and expected results |
| **executing-test-cases** | Run test cases methodically and log defects |
| **generating-test-reports** | Synthesize execution results into data-driven reports |
| **analyzing-defects** | Perform root cause analysis on discovered defects |

## File Storage Convention

All testing artifacts are stored in `docs/qa-testing/` within your project:

```
docs/qa-testing/
├── requirements/
│   └── YYYY-MM-DD-<feature>-requirements.md
├── test-cases/
│   └── YYYY-MM-DD-<feature>-test-cases.md
├── test-reports/
│   └── YYYY-MM-DD-<feature>-test-report.md
└── defects/
    └── DEFECT-NNN-<short-desc>.md
```

## Usage

### Starting a Testing Session

When you mention testing, test cases, or quality assurance, the agent automatically loads the QA testing workflow.

**Example prompts:**
- "I need to test the user login feature"
- "Let's create test cases for the payment workflow"
- "We found some defects during testing, can you analyze them?"
- "Generate a test report for the sprint"

### Typical Workflow

1. **Requirements Analysis**
   - You: "I need to test the user login feature. Here are the requirements: ..."
   - Agent: Analyzes requirements, creates requirements document, asks for approval

2. **Test Case Design**
   - Agent: Designs test cases based on approved requirements
   - You: Review test cases, provide feedback
   - Agent: Updates and saves test case document

3. **Test Execution**
   - Agent: Executes test cases step by step
   - Agent: Logs defects immediately when found
   - Agent: Updates execution tracking

4. **Test Report**
   - Agent: Generates comprehensive test report with metrics
   - You: Review report, approve or request changes

5. **Defect Analysis** (if defects found)
   - Agent: Analyzes defects for patterns and root causes
   - Agent: Provides improvement recommendations

## Key Features

### Structured Workflows

Every skill follows a mandatory checklist process. No steps can be skipped.

### User Approval Gates

Each phase requires explicit user approval before proceeding to the next phase.

### Artifact-Based

All outputs are saved as structured Markdown documents with consistent naming conventions.

### Red Flags and Rationalization Tables

Each skill includes warnings about common mistakes and agent rationalizations, preventing shortcuts that compromise quality.

### Cross-References

Skills are interconnected. Each skill knows its upstream dependencies and downstream transitions.

## Example Artifacts

See `qa-testing/docs/qa-testing/` for complete examples:

- **Requirements:** `requirements/2026-06-11-login-requirements.md`
- **Test Cases:** `test-cases/2026-06-11-login-test-cases.md`
- **Defect Record:** `defects/DEFECT-001-short-password.md`
- **Test Report:** `test-reports/2026-06-11-login-test-report.md`

## Design Principles

1. **Description = When to Use, NOT What it Does** — Skill descriptions only describe triggering conditions, not workflow summaries
2. **Every skill has a checklist** — Mandatory step-by-step process
3. **Red Flags in every skill** — Stop signals when agent is about to make mistakes
4. **Rationalization tables** — Preemptive counters to common agent shortcuts
5. **User approval gates** — No automatic transitions between phases
6. **Pure Markdown** — No external dependencies or tools required
7. **File conventions** — Consistent naming and storage across all artifacts

## Philosophy

This plugin treats testing as a **discipline**, not a task. It enforces professional QA practices through:

- **Completeness:** All requirements must be covered by test cases
- **Traceability:** Every test case links to requirements, every defect links to test cases
- **Reproducibility:** Test cases are detailed enough for anyone to execute
- **Evidence-based:** Every defect includes complete evidence and reproduction steps
- **Data-driven:** Reports include metrics and quantitative analysis

## Contributing

This is an independent plugin inspired by the Superpowers skill format. Contributions should follow the same principles:

- Test skills with real scenarios before submitting
- Include Red Flags and Rationalization tables
- Keep descriptions focused on triggering conditions
- Provide complete examples

## License

MIT License - see LICENSE file for details

## Credits

Inspired by the [Superpowers](https://github.com/obra/superpowers) plugin architecture and skill format.
