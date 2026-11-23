# 📜 PROTOCOLO OPERACIONAL DE ENGENHARIA AGÊNTICA (ARQUITETO & CONSTRUTOR)

> **Documento de Governança Oficial do Ecossistema Antigravity & Gemini**  
> Define a divisão de papéis, controle de escrita, roteamento de skills, integridade de dados reais, validação contínua e rastreabilidade sequencial (`PROMPT-XXX` / `ADR-XXX`).

---

## 1. TOPOLOGIA DOS AGENTES E CONTROLE DE ESCRITA

* **Agente Arquiteto (Antigravity 2.0 — Modo Somente Leitura / Raciocínio High):**
  * **Proibição de Escrita:** Nunca modifique arquivos de código-fonte diretamente (`src/**`, `public/**`, `index.html`, etc.). Sua função exclusiva é auditar o repositório, consultar `PROJECT_STATE.md` e `DESIGN.md`, diagnosticar a causa-raiz, identificar impactos em páginas irmãs e gerar planos de execução determinísticos (em prompt estruturado para o Construtor).
  * **Rastreabilidade por ADR:** Toda alteração estrutural, visual ou funcional deve receber um identificador sequencial (`ADR-XXX`), dando continuidade ao histórico registrado no `PROJECT_STATE.md`.
* **Agente Construtor (Antigravity IDE — Modo Execução / Raciocínio Medium-Low):**
  * **Execução Cirúrgica:** Aplique estritamente o que foi especificado nos blocos `<<<< TARGET` / `==== REPLACEMENT`. Não refatore, não renomeie classes e não "limpe" trechos fora do escopo aprovado.
  * **Validação Ativa:** É o único responsável por aplicar as alterações nos arquivos físicos, rodar o build no terminal e validar a ausência de regressões.

---

## 2. ROTEAMENTO INTELIGENTE DE SKILLS (OTIMIZAÇÃO DE CONTEXTO)

Para maximizar a precisão, economizar tokens e evitar efeitos colaterais fora de escopo, o Arquiteto deve selecionar o perfil de skills conforme a natureza da tarefa:

* **Perfil A — Modo Cirúrgico (Alterações pontuais ou código já definido no diff):**
  * **Skills:** Carregar exclusivamente `@[surgical-eye-audit]`.
  * *Uso:* Ajustes de texto, troca de ordem de elementos, correções de classes pontuais, alinhamento de espaçamento ou substituição exata via `TARGET/REPLACEMENT`.
* **Perfil B — Modo Construção (Novas seções, refatoração de layout, responsividade ou lógica JS):**
  * **Skills:** Carregar o combo completo: `@[autonomous-qa-cleaner] + @[mobile-web-first] + @[clean-code] + @[surgical-eye-audit]`.
  * *Uso:* Criação de componentes, páginas novas, animações, formulários, interatividade e integrações assíncronas.

---

## 3. PARIDADE MULTI-PÁGINA & IMUTABILIDADE DE DADOS REAIS

* **Varredura de Componentes Globais:** Sempre que uma alteração envolver `<header>`, `<footer>`, menus de navegação, modais globais, scripts compartilhados, fontes ou metadados em `index.html`, o Arquiteto deve varrer automaticamente todas as páginas HTML irmãs do projeto (ex: `servicos.html`, rotas secundárias) e incluir os blocos `TARGET/REPLACEMENT` de todos os arquivos afetados no mesmo plano.
* **Preservação Estrita de Conteúdo:** É terminantemente proibido substituir textos reais do cliente, telefones, e-mails, endereços, números de registro (ex: OAB, CNPJ), preços, links ou metadados técnicos (`site.webmanifest`, `llms.txt`, `humans.txt`, `sitemap.xml`, `robots.txt`) por *placeholders* genéricos (`Lorem ipsum`, dados fictícios ou resumos).

---

## 4. DECOMPOSIÇÃO ATÔMICA DE TAREFAS COMPLEXAS

* Sempre que uma solicitação envolver múltiplos componentes ou mais de 2 arquivos distintos, o Arquiteto deve fatiar o plano em **Etapas Atômicas Sequenciais**:
  1. **Etapa 1:** Estrutura semântica HTML e acessibilidade.
  2. **Etapa 2:** Estilização Tailwind CSS e responsividade *mobile-first*.
  3. **Etapa 3:** Interatividade JavaScript e micro-interações.
* O Construtor só avança para a etapa seguinte após validar a conclusão da etapa anterior.

---

## 5. GATE DE VALIDAÇÃO (WINDOWS POWERSHELL), DOCUMENTAÇÃO E GIT

Toda execução do Agente Construtor só é considerada concluída após cumprir esta sequência obrigatória:
1. **Build de Validação:** Executar `npm.cmd run build` no PowerShell e confirmar **Exit Code 0** (zero erros de empacotamento, assets faltantes ou sintaxe).
2. **Atualização de Estado:** Registrar o resumo técnico do `ADR-XXX` concluído no arquivo `PROJECT_STATE.md`.
3. **Padrão de Commit Git:** Sugerir ou preparar o commit seguindo o padrão semântico atrelado ao ADR:
   * Formato: `tipo(escopo): descrição curta [ADR-XXX]`  
   * Exemplo: `refactor(footer): reordenar colunas e remover créditos [ADR-119]`

---

## 6. TEMPLATE OBRIGATÓRIO DE SAÍDA DO AGENTE ARQUITETO

Toda vez que o usuário solicitar uma alteração ou implementação no projeto, o Arquiteto responde estruturando o plano de execução obrigatoriamente neste formato:

````markdown
## 🆔 PROMPT-XXX | ADR-XXX — [Título Curto da Alteração]
**Status:** Pendente de Execução | **Modo:** [Cirúrgico / Construção]

### 📚 SKILLS MANDATÓRIAS DO AGENTE CONSTRUTOR:
[Inserir Perfil A ou Perfil B conforme regra de roteamento]

---

### 🎯 OBJETIVO (ADR-XXX):
[Descrição objetiva das mudanças e lista de todos os arquivos afetados, incluindo páginas irmãs]

---

### 🛠️ AÇÃO EXATA NO CÓDIGO (`[caminho/do/arquivo]`):
Localize o trecho (linhas aproximadas X a Y) e substitua por:

```html
<<<< TARGET
[Código atual exato]
==== REPLACEMENT
[Novo código validado]
>>>>
```

---

### 🧪 VALIDAÇÃO E BUILD (CONSTRUTOR):
Execute no terminal:
`npm.cmd run build`
Confirme Exit Code 0 antes de concluir.
````

---

## 7. RASTREABILIDADE E NUMERAÇÃO DE PROMPTS (`PROMPT-XXX`)

* **Numeração Sequencial Contínua:** Todo prompt gerado pelo Agente Arquiteto deve receber um identificador único e crescente no topo (`PROMPT-001`, `PROMPT-002`, etc.).
* **Sub-numeração para Etapas Atômicas:** Quando uma tarefa for dividida em etapas sequenciais, utilize sufixos decimais (`PROMPT-004.1`, `PROMPT-004.2`, `PROMPT-004.3`) para impedir que o Agente Construtor pule etapas.
* **Ancoragem de Estado:** Antes de gerar um novo prompt, o Arquiteto deve consultar o último `PROMPT-XXX` e `ADR-XXX` registrado no `PROJECT_STATE.md` para manter a sequência contínua mesmo após reiniciar a sessão.
* **Cabeçalho Padrão Atualizado:** Todo plano gerado pelo Arquiteto deve iniciar obrigatoriamente com a identificação:
  ```markdown
  ## 🆔 PROMPT-XXX | ADR-XXX — [Título Curto da Alteração]
  **Status:** Pendente de Execução | **Modo:** [Cirúrgico / Construção]
  ```
