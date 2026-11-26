---
name: project-memory-manager
description: Mandatory persistent session memory manager. Maintains, audits, and synchronizes the project's single source of truth (PROJECT_STATE.md). Enforces the opening 3-part greeting (📌 Onde parámos, ⚙️ Estado atual, 🎯 Próximos passos imediatos) at every interaction and guarantees complete tracking of architectural decisions, code changes, pending tasks, and multi-agent concurrency locks at completion.
when_to_use: "In every session start and close, whenever user returns to a project, after modifying code or architecture, and when tracking milestones or technical debt."
allowed-tools: Read, Write, Edit, Grep, Glob
effort: medium
version: 2.1.0
---

# Project Memory Manager — Persistent Session Memory & State Architect (v2.1)

> "A project without persistent memory is doomed to reinvent past mistakes, lose context across sessions, and frustrate both user and agent. Total state visibility is the foundation of high-velocity senior engineering."

---

## 🎯 Purpose & Scope

The **`project-memory-manager`** skill establishes and enforces a resilient, cross-session memory architecture. It guarantees that regardless of context window truncations, session restarts, or switches between different AI agents (IDE builder vs chat architect), the project's state, technical context, architectural decisions, and current progress remain 100% synchronized and accessible.

The core artifact managed by this skill is `PROJECT_STATE.md` located at the root of the project workspace.

---

## 🏛️ The Golden Triad Greeting Protocol (MANDATORY AT SESSION START)

At the start of **any new conversation, session, or user interaction**, the agent MUST immediately inspect `PROJECT_STATE.md` and begin the response with the **Golden Triad**:

```markdown
📌 **Onde parámos:** [Resumo executivo do que foi entregue ou decidido por último]
⚙️ **Estado atual:** [Status de compilação, integridade do código, testes e ambiente]
🎯 **Próximos passos imediatos:** [Ações técnicas imediatas a serem desenvolvidas agora]
```

### Protocol Execution Rules:
1. **Never skip the Triad:** Even if the user asks a quick question, anchor the context first or succinctly open with the current state.
2. **Read before answering:** Always view the existing `PROJECT_STATE.md` before composing the Triad. Never hallucinate previous progress.
3. **Be specific and architectural:** Mention exact components, sections, and technical details rather than vague phrases like "we worked on the site".

---

## 📝 Lifecycle & Structure of `PROJECT_STATE.md`

### 1. Creation on First Interaction
If `PROJECT_STATE.md` does not exist in the root of the workspace, create it immediately during the first interaction.

### 2. Canonical Section Order
Every `PROJECT_STATE.md` must adhere to this structured layout:

```markdown
# PROJECT_STATE — [Nome do Projeto]

## 📌 Onde parámos
- Histórico cronológico reverso das entregas recentes.
- Detalhes das decisões de UX, mobile, performance e arquitetura.
- Referência aos prompts turnkey e componentes modificados.

## ⚙️ Estado atual
- Status do build / compilação.
- Resumo dos testes e linters (100% passing ou falhas conhecidas).
- Saúde das rotas, componentes e páginas.
- Dependências instaladas e status de ambiente.

## 🎯 Próximos passos imediatos
- [ ] Tarefa prioritária 1
- [ ] Tarefa prioritária 2
- [ ] Backlog imediato de refinamento

## 🏛️ Decisões Arquiteturais & ADRs (Architecture Decision Records)
- Registro de escolhas estruturais importantes (ex: Mobile-First Scroll-Snap vs Carrossel JS, Tailwind v4 vs v3, Decoupled API Service Layer).
- Justificativa técnica, prós, contras e impacto no longo prazo.

## 🔒 Travas Ativas de Concorrência (Tabela Multi-Lock — Opcional para Pipeline Multi-Agente)
| Arquivo sob Edição | Seção / Componente | Agente | Tarefa Vinculada | Emitido em | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `[caminho/arquivo]` | `[seção/escopo]` | `[Construtor/Agente 02]` | `ADR-XXX` | `YYYY-MM-DDTHH:mm` | `🔒 Ocupado` |

## ⚠️ Débito Técnico, Riscos & Pontos de Atenção
- Elementos pendentes de validação, limites de taxa de APIs externas ou pendências de responsividade identificadas.
```

---

## 🔄 Post-Execution Synchronization Protocol (AT TASK COMPLETION)

Whenever code, configuration, or architectural plans are implemented or modified:

1. **Audit Changes:** Review modified, created, or deleted files.
2. **Verify Tests & Build:** Confirm whether automated tests or build checks passed.
3. **Update `PROJECT_STATE.md`:**
   - Prepend the latest milestone under `## 📌 Onde parámos`.
   - Update `## ⚙️ Estado atual` with the new compilation/test status.
   - Check off completed items in `## 🎯 Próximos passos imediatos` and add newly discovered next steps.
   - Record any new architectural decision in the ADR section.
   - **Concurrency Locks (If present):** Register active locks (`🔒 Ocupado` + ISO timestamp) when issuing async prompts/tasks, and remove or mark them free once completed.
4. **Deliver Accountability:** Present an executive summary to the user reflecting the updated state.

---

## 🚫 Anti-Patterns to Prevent

| Anti-Pattern | Why It Fails | Mandatory Correction |
|---|---|---|
| **Amnesiac Start** | Greeting the user without referencing the previous session state. | Always read `PROJECT_STATE.md` and output the Golden Triad. |
| **Silent Drifts** | Making major code changes without updating `PROJECT_STATE.md`. | Rewrite progress and pending tasks before concluding the turn. |
| **Vague State Logs** | Logging "Fixed bugs" or "Updated styles". | Log exact component names, lines, files, and architectural reasons. |
| **Overwriting History** | Erasing past milestone context completely. | Append new deliverables at the top of the history while archiving obsolete items. |
