# PROJECT MEMORY & AGENT GOVERNANCE — UNIVERSAL DIRECTIVES

## 🏛️ Diretriz Mestre Universal: Protocolo Operacional de Engenharia Agêntica (Arquiteto & Construtor)

### 1. Topologia dos Agentes e Controle de Escrita
* **Agente Arquiteto (Antigravity 2.0 — Modo Somente Leitura / Raciocínio High):**
  * **Proibição de Escrita:** Nunca modifica arquivos de código-fonte diretamente (`src/**`, `public/**`, `index.html`, etc.). Sua função exclusiva é auditar o repositório, consultar `PROJECT_STATE.md` e `DESIGN.md`, identificar impactos e gerar planos de execução determinísticos (em prompt estruturado).
  * **Rastreabilidade por ADR:** Toda alteração estrutural, visual ou funcional recebe um identificador sequencial (`ADR-XXX`), dando continuidade ao último registro de `PROJECT_STATE.md`.
* **Agente Construtor (Antigravity IDE — Modo Execução / Raciocínio Medium-Low):**
  * **Execução Cirúrgica:** Aplica estritamente o que foi especificado nos blocos `<<<< TARGET` / `==== REPLACEMENT`. Não refatora, não renomeia classes e não "limpa" trechos fora do escopo aprovado.

### 2. Roteamento Inteligente de Skills (Otimização de Contexto)
* **Perfil A — Modo Cirúrgico (Alterações pontuais ou código já definido no diff):**
  * Carregar exclusivamente: `@[surgical-eye-audit]`
  * *Uso:* Ajustes de texto, troca de ordem de elementos, correções de classes pontuais ou substituição exata via `TARGET/REPLACEMENT`.
* **Perfil B — Modo Construção (Novas seções, refatoração de layout, responsividade ou lógica JS):**
  * Carregar o combo completo: `@[autonomous-qa-cleaner] + @[mobile-web-first] + @[clean-code] + @[surgical-eye-audit]`
  * *Uso:* Criação de componentes, páginas novas, animações, formulários e integrações.

### 3. Paridade Multi-Página & Imutabilidade de Dados Reais
* **Varredura de Componentes Globais:** Sempre que uma alteração envolver `<header>`, `<footer>`, navegação, modais globais, scripts compartilhados ou metadados em `index.html`, o Arquiteto deve varrer automaticamente todas as páginas HTML irmãs do projeto (ex: `servicos.html` e demais rotas) e incluir os blocos `TARGET/REPLACEMENT` de todos os arquivos afetados no mesmo plano.
* **Preservação Estrita de Conteúdo:** É terminantemente proibido substituir textos reais do cliente, endereços, telefones, preços, links ou metadados técnicos (`site.webmanifest`, `llms.txt`, `humans.txt`, `sitemap.xml`, `robots.txt`) por *placeholders* genéricos (`Lorem ipsum`, dados fictícios ou textos resumidos).

### 4. Decomposição Atômica de Tarefas Complexas
* Sempre que uma solicitação envolver múltiplos componentes ou mais de 2 arquivos distintos, o Arquiteto fatia o plano em **Etapas Atômicas Sequenciais**:
  1. **Etapa 1:** Estrutura semântica HTML e acessibilidade.
  2. **Etapa 2:** Estilização Tailwind CSS e responsividade *mobile-first*.
  3. **Etapa 3:** Interatividade JavaScript e micro-interações.
* O Construtor só avança para a etapa seguinte após validar a anterior.

### 5. Gate de Validação (Windows PowerShell), Documentação e Git
Toda execução do Agente Construtor só é concluída após cumprir:
1. **Build de Validação:** Executar `npm.cmd run build` no PowerShell e confirmar **Exit Code 0** (zero erros de empacotamento, assets ou sintaxe).
2. **Atualização de Estado:** Registrar o resumo técnico do `ADR-XXX` concluído no arquivo `PROJECT_STATE.md`.
3. **Padrão de Commit Git:** Sugerir ou preparar o commit seguindo o padrão semântico: `tipo(escopo): descrição curta [ADR-XXX]`.

### 6. Template Obrigatório de Saída do Arquiteto
```markdown
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

<<<< TARGET
[Código atual exato]
==== REPLACEMENT
[Novo código validado]
>>>>

---

### 🧪 VALIDAÇÃO E BUILD (CONSTRUTOR):
Execute no terminal:
`npm.cmd run build`
Confirme Exit Code 0 antes de concluir.
```

### 7. Rastreabilidade e Numeração de Prompts (`PROMPT-XXX`)
* **Numeração Sequencial Contínua:** Todo prompt gerado pelo Agente Arquiteto deve receber um identificador único e crescente no topo (`PROMPT-001`, `PROMPT-002`, etc.).
* **Sub-numeração para Etapas Atômicas:** Tarefas divididas recebem sufixos decimais (`PROMPT-004.1`, `PROMPT-004.2`, `PROMPT-004.3`).
* **Ancoragem de Estado:** Consulta mandatória ao último `PROMPT-XXX` registrado no `PROJECT_STATE.md` para manter a sequência contínua.

---

## 👁️ Sistema de Auditoria Visual & Olhar Cirúrgico Humano (`surgical-eye-audit`)
- **Origem & DNA:** Criada a partir da sabedoria prática e do olhar cirúrgico desenvolvido neste projeto, sintetizando os 10 Pilares Mandatórios:
  1. *Descendentes tipográficos ("g", "j", "p")*: Prevenção de corte por `bg-clip-text` com `leading-[1.08]` e `pb-1`.
  2. *Nivelamento horizontal de preços*: Travamento de containers com `min-h-[128px]` e ancoragem inferior `justify-end` para alinhamento em régua horizontal de todos os valores.
  3. *Prevenção de clipping em badges flutuantes*: Respiro de `pt-5 pb-5` (20px) em containers de scroll móvel e `right-6` com `z-20`.
  4. *Ergonomia de swipe*: Guias móveis de rolagem posicionadas estritamente ABAIXO dos cartões de planos (`pt-3 pb-4`).
  5. *Purga de freios visuais*: Zero ponto final em H1 display, CTAs concisos sem redundâncias ("Agora") e despoluição de mídias 3D.
  6. *Blindagem operacional*: Ancoragem flexível ("A partir de R$ 600"), desindexação de prazos rígidos ("72h") e eliminação de passivos de entrega.
  7. *Espelho semântico visual ➔ copy*: Correspondência 1-para-1 entre badges 3D e benefícios em texto.
  8. *Trim de canal alfa*: Eliminação de margem transparente morta em ativos 3D (`sharp.trim()`), garantindo escala óptica sem inflar o DOM.
  9. *Centralização geométrica*: Micro-garantias ancoradas em `inline-flex flex-col items-center`.
  10. *Foco no valor de negócio*: Pivot imediato de termos frios de TI ("servidor", "hospedagem") para métricas de conversão, velocidade e segurança SSL.
- **Localização:** Global em `C:\Users\NOC 01\.gemini\config\skills\surgical-eye-audit\SKILL.md` e Local em `.agents/skills/surgical-eye-audit/SKILL.md`.

---

## 🚪 Protocolo Mestre de Quality Gate Pré-Deploy (`pre-flight-quality-gate`)
- **Origem & Propósito:** Criado a partir do sucesso de homologação da LS Tecnologia no Google (Faixa Verde 90+ de Performance, Acessibilidade 96, Boas Práticas 96, SEO 100/100, TBT 0ms e CLS 0.00).
- **Diretriz Mandatória Universal:** NENHUM projeto pode ser publicado em produção ou entregue como finalizado sem passar obrigatoriamente pelos 4 Portões de Qualidade:
  1. *Portão 1 (Build & Bundle Budget)*: `npm run build` exit code 0, CSS < 100 kB, JS enxuto, zero dead code/logs.
  2. *Portão 2 (Integridade Semântica & Assets)*: 0 links quebrados, 100% dos assets no disco em WebP/AVIF com width/height e loading="lazy" (exceto Hero LCP com preload), zero textos mock.
  3. *Portão 3 (Core Web Vitals & PageSpeed Green Band)*: Faixa Verde oficial no Google (Performance >= 90, TBT < 100ms, CLS < 0.1, LCP < 2.5s, Acessibilidade >= 95).
  4. *Portão 4 (SEO, GEO & Schema.org Rich Results)*: SEO 100/100, robots.txt, sitemap.xml, site.webmanifest, llms.txt e Schema JSON-LD válido com `aggregateRating` (para estrelas douradas ★★★★★ no Google).
- **Localização:** Global em `C:\Users\NOC 01\.gemini\config\skills\pre-flight-quality-gate\SKILL.md` e Local em `.agents/skills/pre-flight-quality-gate/SKILL.md`.

---

## 💼 LS Tecnologia & Gestão (Página LS Vendas)
- **Stack & Ambiente:** Vite + Tailwind CSS v4, Vanilla JS modular, assets canônicos WebP/PNG, servidor de desenvolvimento na porta 3000.
- **Identidade Visual:** Paleta Obsidian Floor (`#070b14`), Cyber-Gold Metálico (`#f5b700` / `#ffd033`), Neon Cyan (`#00e5ff`) e Emerald (`#25d366`). Fontes Montserrat (Títulos) e Inter (Corpo).
- **Contatos Oficiais & Conversão:** WhatsApp `5591982102720` (com tracking dinâmico `data-whatsapp-intent`), Instagram `@ls_tecnogestao`.
- **Governança:** Arquivos de governança e rastreamento (`PROJECT_STATE.md`, etc.) são mantidos pelo Agente Arquiteto.

---

## ⚖️ Karlla Pinheiro & Keyteler Leite Advogadas
- **Paleta 60-30-10 & Regras de Ouro:** Fundo `#FAF6F0`, Vinho `#3A171C`, Ouro `#9E7B56`, Cards `#FFFFFF`. Preservação integral dos dados de OAB (40.209 e 40.642), endereço em Salinópolis e contatos oficiais.
- **Auditoria Visual Obrigatória com Olhar Cirúrgico Humano:** Ativação mandatória de `@[surgical-design-audit]` diante de prints.
- **Inteligência de Benchmarking de Nicho:** Ativação de `@[niche-benchmark-intel]` para referências do top 1%.

---

## 🏭 Fábrica de Landing Pages da LS Digital (`landing-page-factory`)
- **Gatilho Inteligente Sob Demanda:** Sempre que o usuário solicitar a criação, planejamento, estruturação ou manutenção de uma Landing Page ou site institucional para um cliente (Planos Express, Comercial ou VIP), ative imediatamente a skill `@[landing-page-factory]`.
- **Diretriz de Execução:** Carrega a esteira em 4 etapas (Triagem do Briefing, Montagem Modular, Quality Gate de 5 min e Homologação dos 7 dias). Mantém os agentes ágeis e sem poluição de contexto para projetos de apps, dashboards e automações.
- **Localização:** Global em `C:\Users\NOC 01\.gemini\config\skills\landing-page-factory\SKILL.md` e Local em `.agents/skills/landing-page-factory\SKILL.md`.
