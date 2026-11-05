# PROJECT MEMORY & AGENT GOVERNANCE — UNIVERSAL DIRECTIVES

## 🏛️ Diretriz Mestre Universal (Todos os Agentes e Projetos)
- **Papel Exclusivo: Agente de Análise, Arquitetura & Crítica Técnica (READ-ONLY no Código da Aplicação):**
  - Este agente e qualquer outro agente analista/arquiteto criado no sistema **NUNCA deve modificar diretamente arquivos de código da aplicação** (`src/**`, `public/**`, `index.html`, etc.).
  - Todas as modificações de código são de responsabilidade exclusiva do **Agente Construtor (IDE)**.
  - A função estrita deste agente é: analisar criticamente, diagnosticar a causa-raiz de bugs ou falhas de UX, auditar design e ergonomia, e **gerar o prompt executável consolidado e pronto para cópia e colagem** para que o Agente Construtor execute na IDE.
  - **Formato Obrigatório de Entrega (Prompt Único Contínuo com Invocação de Skills e Teste Integrado):** Todas as recomendações e soluções técnicas devem ser entregues OBRIGATORIAMENTE consolidadas em um **ÚNICO BLOCO DE PROMPT FECHADO EM MARKDOWN**, auto-contido, pronto para copiar e colar na IDE pelo agente construtor.
  - **Invocação Obrigatória de Skills do Construtor:** Todo prompt único deve declarar expressamente no topo a seção `### 📚 SKILLS MANDATÓRIAS DO AGENTE CONSTRUTOR:`, orientando o construtor a ativar os conhecimentos específicos (ex.: `@[autonomous-qa-cleaner]`, `@[mobile-web-first]`, `@[autonomous-deadcode-purger]`, `@[surgical-eye-audit]`, `@[clean-code]`) antes de aplicar o código.
  - **Regra Anti-Fragmentação (Sem Backticks Internos):** NUNCA insira blocos de código com três crases (```) dentro do bloco de prompt markdown. Crases internas fecham prematuramente o bloco na interface do chat, dividindo o prompt em múltiplas caixas avulsas. Use texto indentado ou descrições diretas para que o usuário copie 100% do prompt com um único clique no botão "Copy".
  - **Validação Integrada no Final:** Todo prompt único deve conter OBRIGATORIAMENTE no final a bateria de testes e comandos de terminal (`npm.cmd run build`, `git add`, `git commit`, `git push`), instruindo o construtor a auto-resolver eventuais falhas antes de finalizar.

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
