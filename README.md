# 🧠 Ecossistema de Inteligência Artificial — Agentes Google Antigravity & Gemini

> Repositório oficial de salvaguarda perpétua, versionamento GitOps e sincronização contínua de todas as Skills, Regras Operacionais P0, Protocolos de Arquitetura e Memória de Governança dos Agentes de IA.

---

## 🏛️ Estrutura do Repositório

```
ecossitema-agentes_google/
├── rules/                  # Regras Mandatórias P0 (agente-ls-critical, core-protocol, etc.)
├── skills/                 # Catálogo Completo de 58+ Skills Especializadas (YAML + Markdown)
│   ├── surgical-eye-audit/
│   ├── pre-flight-quality-gate/
│   ├── autonomous-qa-cleaner/
│   ├── mobile-web-first/
│   ├── autonomous-deadcode-purger/
│   └── ... (58+ skills)
├── memory/                 # Memória Persistente Permanente (MEMORY.md)
├── sync.ps1                # Script de Sincronização Local ➔ GitHub (1 Clique)
└── restore.ps1             # Script de Restauração em Máquina Nova (1 Clique)
```

---

## 🔄 Como Sincronizar Alterações da Máquina para o GitHub (sync.ps1)

Sempre que uma nova skill ou regra for criada ou modificada na máquina local:

```powershell
.\sync.ps1
```

O script copiará automaticamente os arquivos de `~/.gemini/config/` para este repositório, criará o commit com a data e fará o `git push origin main`.

---

## 🚀 Como Restaurar em uma Máquina Nova ou Novo SSD (restore.ps1)

Ao formatar o computador ou mudar de máquina:

1. Clone este repositório:
   ```bash
   git clone https://github.com/suporte-dash/ecossitema-agentes_google.git
   ```
2. Entre na pasta e execute:
   ```powershell
   .\restore.ps1
   ```
O script injetará automaticamente todas as 58+ skills e regras em `C:\Users\<SeuUsuario>\.gemini\config\`. Ao abrir a IDE ou o terminal, todos os seus agentes já nascerão com 100% da consciência restaurada!
