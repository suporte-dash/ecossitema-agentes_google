---
name: autonomous-deadcode-purger
description: Autonomous continuous dead code, zombie selector, orphaned asset, and empty directory purger. Automatically scans touched files and related dependencies after code changes; detects unreferenced CSS selectors, dead JS functions/listeners, and unused images; purges dead code immediately while strictly respecting configuration and canonical asset safeguards.
when_to_use: "After any code modification, refactoring, feature addition, or asset replacement; during code cleanup sessions; before declaring any task complete."
allowed-tools: Read, Write, Edit, Grep, Glob, run_command
effort: medium
version: 1.0.0
---

# Autonomous Dead-Code & Asset Purger — Zero-Bloat Protocol (v1.0)

> "Um código de excelência não é medido pelo que foi adicionado, mas pela ausência de qualquer linha inútil. Cada classe CSS, função JavaScript e asset no repositório deve ter um consumidor ativo e comprovado no DOM de produção."

---

## 🎯 Purpose & Scope

A skill **`autonomous-deadcode-purger`** estabelece a rotina de purga e higienização contínua do repositório. Enquanto o agente edita, refatora e melhora a aplicação, esta skill atua como um sentinela autônomo anti-bloat: ela rastreia classes abandonadas, funções sem chamadores, seletores zumbis no CSS e imagens descontinuadas, **eliminando-os imediatamente** sem interrupções triviais e sem acumular débito técnico.

---

## 🔍 Os 4 Vetores de Purga Autônoma (The 4 Purge Vectors)

Sempre que um arquivo for alterado ou uma funcionalidade for atualizada, o agente deve auditar e purgar os seguintes 4 vetores:

### 1. Vetor Estilos & CSS Zumbis
- **Classes Órfãs:** Seletores de classe ou ID definidos em arquivos `.css` ou blocos `<style>` que não existem em nenhum arquivo `.html`, `.js`, `.jsx`, `.tsx`, `.vue` ou `.svelte`.
- **Keyframes Fantasmas:** Regras `@keyframes` que não são mais referenciadas por nenhuma propriedade `animation:` ativa.
- **Classes de Estados Dinâmicos:** Verificar antes se a classe é adicionada via JavaScript (ex: `is-active`, `is-open`, `is-revealed`, `hidden`). Se não for gerada dinamicamente nem existir no HTML, é código morto e deve ser removida.

### 2. Vetor JavaScript & Rotinas Mortas
- **DOM Queries Inexistentes:** Funções ou listeners que executam `getElementById` ou `querySelector` buscando IDs ou classes que foram deletados ou renomeados no HTML (ex: buscar um container já removido que sempre retorna `null`).
- **Listeners Órfãos:** Eventos de `click`, `scroll`, `mousemove` ou `IntersectionObserver` atrelados a nós ausentes.
- **Fallbacks Duplicados:** Rotinas legadas que foram substituídas por uma implementação inline mais moderna ou motor dedicado.
- **Imports & Variáveis Mortas:** Declarações de `import` de símbolos não utilizados e variáveis declaradas mas nunca lidas.

### 3. Vetor Mídias & Assets Órfãos
- **Imagens Não Renderizadas:** Arquivos de imagem na pasta `public/` ou `assets/` que não constam em nenhuma tag `<img>`, `<picture>`, CSS `url(...)`, metatag social (`og:image`, `twitter:image`), favicon ou manifesto PWA.
- **Duplicidades de Formato:** Eliminar formatos redundantes (ex: duplicidade `.png` pesada quando a versão `.webp` moderna já é a única consumida).
- **Assets de Mockup de Rascunho:** Excluir banners e testes visuais intermediários que não fazem parte do design system aprovado.

### 4. Vetor Arquivos Temporários & Pastas Vazias
- **Diretórios Vazios:** Pastas deixadas sem arquivos após refatorações estruturais (excluir imediatamente).
- **Arquivos de Rascunho:** Scripts temporários de teste (`scratch/*`, `test-*.js`, `.tmp`), dumps de depuração ou backups acidentais (`*.bak`, `*.old`).

---

## 🛡️ Salvaguardas Críticas (Safety Rails — O Que NUNCA Purgar)

A autonomia de purga é total sobre código de negócio e estilização, mas **RIGOROSAMENTE PROIBIDA** sobre arquivos vitais de infraestrutura e governança do projeto:

| Arquivo / Padrão Protegido | Motivo | Ação Obrigatória |
|---|---|---|
| `package.json`, `package-lock.json` | Gerenciamento de dependências | NUNCA remover sem comando explícito de desinstalação |
| `vite.config.js`, `tailwind.config.*`, `tsconfig.json` | Configurações de compilação do ecossistema | PRESERVAR intacto |
| `server.js`, `Dockerfile`, scripts de CI/CD | Infraestrutura e runtime de deploy | PRESERVAR |
| `.gitignore`, dotfiles de ambiente (`.env*`) | Segurança e versionamento | PRESERVAR |
| `PROJECT_STATE.md`, `BASE_CONHECIMENTO*.md`, `DESIGN.md` | Memória viva, especificação e regras de negócio | PRESERVAR e sincronizar |

---

## ⚙️ Protocolo de Execução Pós-Purga (The Build-Verification Loop)

A cada purga de código ou exclusão de arquivo:

1. **Execução de Build Imediata:** Rodar o comando oficial de compilação no terminal (`npm run build`, `vite build` ou equivalente).
2. **Checagem de Saída:** O build DEVE retornar código de saída `0` (Zero erros).
3. **Medição de Ganhos:** Verificar a diminuição do tamanho dos bundles (`.css` e `.js` gerados).
4. **Auto-Correção:** Se o build acusar erro de símbolo faltante, restaurar imediatamente o símbolo ou ajustar o import dependente sem expor stack traces brutos ao usuário.
5. **Atualização do `PROJECT_STATE.md`:** Registrar a quantidade de linhas, classes ou arquivos purgados e o ganho em kilobytes.
