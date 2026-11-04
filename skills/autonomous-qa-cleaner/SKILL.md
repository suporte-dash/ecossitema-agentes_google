---
name: autonomous-qa-cleaner
description: Autonomous continuous quality assurance, proactive terminal validation, self-healing diagnostic loops, and code cleanup. Automatically runs linters, type checks, unit tests, and builds before concluding tasks; reads stack traces and auto-resolves bugs; purges dead code and debug logs; and strictly forbids destructive database/file commands.
when_to_use: "At the completion of any feature, bug fix, or refactor; whenever running automated tests or linting; before reporting work as complete to the user."
allowed-tools: Read, Write, Edit, Grep, Glob, run_command
effort: medium
version: 2.0.0
---

# Autonomous QA & Cleaner — Continuous Quality, Self-Healing & Code Hygiene (v2.0)

> "A senior engineer never hands unverified code to a client with 'it should work'. They verify it in the terminal, autonomously heal stack traces before reporting back, sweep away temporary debug artifacts, and protect production data with strict safety guardrails."

---

## 🎯 Purpose & Scope

The **`autonomous-qa-cleaner`** skill governs the final verification and closing cycle of every implementation, refactor, or bug fix. It guarantees that code is never declared finished without automated proof (build, lint, type-check, tests), drives autonomous self-healing when commands fail, enforces rigorous code hygiene, and prevents destructive accidents.

---

## 🔄 The 4-Stage Autonomous QA Loop

Before declaring any task complete or returning control to the user, the agent MUST autonomously execute this verification loop:

```
┌────────────────────────────────────────────────────────┐
│ 1. STATIC LINT & TYPE AUDIT                            │
│ (npm run lint / tsc --noEmit / pyright / flake8)       │
└──────────────────────────┬─────────────────────────────┘
                           │ (passes)
┌──────────────────────────▼─────────────────────────────┐
│ 2. BUILD VERIFICATION                                  │
│ (npm run build / vite build / cargo check / next build) │
└──────────────────────────┬─────────────────────────────┘
                           │ (passes)
┌──────────────────────────▼─────────────────────────────┐
│ 3. AUTOMATED TEST SUITE                                │
│ (npm test / vitest run / pytest / cargo test)          │
└──────────────────────────┬─────────────────────────────┘
                           │ (passes)
┌──────────────────────────▼─────────────────────────────┐
│ 4. CODE HYGIENE & RESIDUAL CLEANUP                     │
│ (Purge console.log, dead imports, dangling variables)  │
└────────────────────────────────────────────────────────┘
```

---

## 🩺 The Self-Healing Diagnostic Protocol

When a linter, compiler, build tool, or test runner throws an error:

1. **NEVER pass raw error dumps directly to the user:** Do not stop at the first error and ask "What should I do?".
2. **Read the Full Stack Trace:** Pinpoint the exact file, line number, and root cause (syntax error, missing export, type mismatch, failed assertion).
3. **Formulate a Targeted Patch:** Formulate a direct hypothesis and modify the code to resolve the specific issue.
4. **Re-run the Command:** Verify that the fix actually passed.
5. **Loop Until Green:** Only if after multiple reasoned attempts an external environmental blocker is discovered (missing secret API key, unreachable network host, broken third-party dependency) may the agent pause to consult the user with a concise diagnosis.

---

## 🧹 Code Hygiene & Sanitization Protocol

Before closing the turn or committing changes, inspect all touched files and clean:

### 1. Purge Residual Debug Calls
- Remove all temporary `console.log()`, `console.dir()`, `debugger;`, `print()`, or `dump()` calls introduced during debugging.
- Legitimate structured logger calls (e.g., `logger.info()`, `logger.error()`) may remain if they are part of production observability.

### 2. Eliminate Orphan Imports & Dead Variables
- Remove unused `import` statements and orphaned variables flagged by linters or TypeScript.
- Ensure all exported symbols are either imported elsewhere or part of the public library API.

### 3. Comment Cleanliness
- Remove commented-out dead code blocks (e.g., `/* const oldVersion = ... */`). Git history is the source of version history, not commented code.

---

## ⛔ Absolute Prohibition of Destructive Commands

The agent has total autonomy to create, edit, test, and refactor code. However, **DESTRUCTIVE IRREVERSIBLE OPERATIONS** are strictly prohibited without prior explicit confirmation from the human user:

| Forbidden Destructive Command | Risk | Mandatory Action |
|---|---|---|
| `DROP TABLE`, `DROP DATABASE` | Permanent data loss | Prohibited. Must propose a safe migration or request explicit confirmation. |
| `DELETE FROM ...` (without WHERE) | Wiping all table rows | Prohibited. Always require strict parameterized WHERE clauses. |
| `rm -rf /` or `rmdir /s /q` on root/system | Catastrophic deletion | Prohibited. Only delete explicit project scratch files. |
| Overwriting production databases | Production outage | Prohibited. Operate only on local/test environments. |
| Force push (`git push -f`) to `main`/`master` | History destruction | Prohibited without explicit instruction. |

---

## 📋 Autonomous QA Pre-Flight Checklist

Before presenting the final response to the user:
1. [ ] Terminal build command executed and exited with code 0.
2. [ ] TypeScript / Linter executed with zero errors.
3. [ ] Existing tests run and verified green.
4. [ ] All temporary `console.log` / debug statements removed.
5. [ ] No orphaned imports or dead commented-out code blocks left behind.
6. [ ] State and progress updated in `PROJECT_STATE.md`.
