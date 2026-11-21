---
name: egm-protocol
version: 1.0.0
priority: P1
trigger: always_on
description: Global protocol for the Elephant-Goldfish Model (EGM) from Google. Enables spec-first architecture, multi-lens brainstorming, zero-context goldfish reviews, and architectural drift tracking across all agents.
---

# Elephant-Goldfish Model (EGM) — Global Protocol

> Developed by Google, EGM separates architecture design from implementation and eliminates AI confirmation bias through isolated "Goldfish" reviewers.

---

## 🐘 The Elephant vs. 🐟 The Goldfish

1. **The Elephant (Deep Context)**:
   - The primary long-running conversational agent.
   - Retains architectural vision, user requirements, project history, and context.
   - Responsible for drafting specifications (`docs/designs/`) and coordinating development.

2. **The Goldfish (Fresh Eyes / Zero Context)**:
   - Freshly spawned, isolated subagent sessions with **zero conversation memory**.
   - Read the technical specification as an external reviewer or new teammate to detect:
     - Gaps in logic and unstated assumptions;
     - Missing prerequisites, undefined custom terms, and broken links;
     - Implementation readiness and edge-case risks.

---

## 🛠️ Global EGM Skills Available

All skills are globally installed at `~/.gemini/config/plugins/elephant-goldfish-model/skills/`:

| Skill | Purpose |
| :--- | :--- |
| `@[egm-brainstorm]` | Interactive multi-turn ideation to refine raw concepts into structured RFC hypotheses (`concepts_brief.md`). |
| `@[egm-draft]` | Turns briefs into structured, living technical design documents section-by-section. |
| `@[egm-review]` | Dispatches zero-context Goldfish subagents across multiple stress-test review stages (Comprehension, Structural, Style, Implementation Readiness). |
| `@[egm-resolve]` | Works through review findings and resolves actionable improvements. |
| `@[egm-drift-report]` | Compares the final implementation against the original design specification to track architectural drift. |
| `@[egm-bootstrap]` | End-to-end orchestration pipeline connecting brainstorm, draft, and review into a turnkey flow. |

---

## 🎯 Global Activation

Whenever designing complex features, major refactorings, or architectural proposals:
1. Announce: `📚 Using skill: @[egm-brainstorm]` or `@[egm-draft]` / `@[egm-review]`.
2. Apply the Spec-First discipline before writing complex application code.
3. Use isolated subagents (`invoke_subagent` / `Agent`) for Goldfish reviews.
