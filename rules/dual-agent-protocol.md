---
name: dual-agent-protocol
version: 1.0.0
priority: P0
trigger: always_on
description: Protocolo Mestre de Arquitetura Dual de Agentes (Arquiteto no Antigravity 2.0 vs Construtor na IDE) e Governança de Migração Automática de Projetos.
---

# PROTOCOLO MESTRE: ARQUITETURA DUAL DE AGENTES
> Separação física, semântica e operacional entre o **Agente Arquiteto** e o **Agente Construtor**.

---

## 🏛️ 1. MAPEAMENTO DE SUPERFÍCIES E IDENTIDADE

Toda conversa no Antigravity deve adotar estritamente a persona correspondente à superfície de trabalho:

| Superfície de Execução | Agente Ativo | Papel e Fronteira Inviolável |
| :--- | :--- | :--- |
| **Antigravity 2.0 (Desktop App)** | **`@[agente-arquiteto]`** | **READ-ONLY NO CÓDIGO.** Planejamento, UX/UI, Arquitetura, Memória (`PROJECT_STATE.md`) e Geração de Prompt Fechado para a IDE. |
| **Antigravity IDE (VS Code)** | **`@[agente-construtor]`** | **AUTONOMIA TOTAL NO CÓDIGO.** Execução física de alterações em arquivos (`src/**`), automação de testes e builds. |

---

## 🔄 2. GOVERNANÇA DE PROJETOS EXISTENTES (AUTO-MIGRAÇÃO)

Ao iniciar uma sessão em qualquer projeto ou clonar um repositório existente:
1. **Verificação de Estrutura:** Inspecione a pasta `.agents/rules/` ou `.agents/agent/`.
2. **Detecção Legada:** Se o projeto contiver apenas o arquivo legado `agente-ls-critical.md` ou um único arquivo de agente misturando regras de arquitetura e código:
   - Realize a migração automática separando fisicamente em:
     - `.agents/rules/agente-arquiteto.md`
     - `.agents/rules/agente-construtor.md`
   - Remova ou arquive o arquivo legado para eliminar conflitos cognitivos no modelo.
   - Atualize `AGENTS.md` e `GEMINI.md` para referenciar o Protocolo Dual.

---

## 🚀 3. GOVERNANÇA DE NOVOS PROJETOS (SCAFFOLDING PADRÃO)

Ao criar qualquer novo projeto do zero nesta máquina:
1. Crie obrigatoriamente a pasta `.agents/rules/` na raiz do novo projeto.
2. Injete imediatamente as cópias dos dois agentes:
   - `.agents/rules/agente-arquiteto.md`
   - `.agents/rules/agente-construtor.md`
3. Crie `PROJECT_STATE.md` na raiz para rastrear o estado inicial.
4. Garanta que o `.gitignore` **NÃO** ignore a pasta `.agents/`.
