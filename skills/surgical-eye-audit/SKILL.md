---
name: surgical-eye-audit
description: The Human-Eye Surgical Visual & UX Audit Protocol. Synthesizes elite human discernment to catch micro-flaws that linters and automated tests miss: typography descender clippings, horizontal price/card horizon drift, negative-margin badge overflows, visual-copy semantic asymmetry, mobile thumb ergonomics, operational overpromising safeguards, transparent asset scale traps, and focal point distractions.
when_to_use: "When reviewing UI components, landing pages, pricing cards, screenshots, mobile responsiveness, typography baselines, or visual balance. Mandatory before approving any front-end delivery or declaring visual polish complete."
allowed-tools: Read, Grep, Glob, run_command
effort: medium
version: 1.0.0
---

# Surgical Eye Audit — The Human-Eye UX & Visual Protocol (v1.0)

> "Linters e testes automatizados verificam sintaxe; o Olhar Cirúrgico Humano verifica harmonia, ritmo óptico, ergonomia tátil e alinhamento milimétrico."

---

## 🎯 Origem & Filosofia

Esta skill nasceu diretamente da prática real de engenharia de produto, CRO e refinamento de interface. Ferramentas automatizadas conseguem aprovar um build com 0 erros enquanto uma letra tem sua curva cortada em linha reta, um preço está 20 pixels desalinhado em relação ao card vizinho ou um badge flutuante é fatiado por uma esteira de scroll móvel.

O **Olhar Cirúrgico** é a habilidade de inspecionar interfaces sob a ótica de um Diretor de Arte, Engenheiro Sênior de Front-End e Estrategista de Conversão, enxergando detalhes sutis que constroem a percepção inconsciente de autoridade, luxo e confiabilidade.

---

## 👁️ Os 10 Pilares do Olhar Cirúrgico

Todo agente que carregar esta skill deve auditar sistematicamente qualquer tela, código ou captura de tela através destes 10 pilares mandatórios:

---

### Pilar 1: O Recorte Oculto de Descendentes Tipográficos (The Baseline Descender Trap)
*Linters veem CSS válido; o olho cirúrgico vê letras decepadas.*

- **O Problema:** Ao aplicar `-webkit-background-clip: text` com `text-transparent` em títulos monumentais (Display/H1) com entrelinhas hiper-comprimidas (`leading-[1.03]` ou `leading-none`), as curvas descendentes de letras como **"g", "j", "p", "q", "y"** mergulham abaixo da linha de base e ultrapassam a *padding-box*. O navegador corta a curva da letra em linha reta.
- **Onde Procurar:** Títulos em gradiente, H1s com fontes geométricas pesadas (Montserrat, Inter, Syne, Poppins) e textos com sombras de texto projetadas.
- **Solução Mandatória:**
  1. Relaxar a entrelinha (`leading-[1.03]` ➔ `leading-[1.08]`).
  2. Adicionar respiro inferior explícito (`pb-1` a `pb-2.5`) no `<span>` transparente para acomodar 100% do descendente.

---

### Pilar 2: A Linha do Horizonte e o Nivelamento de Preços (The Symmetrical Horizontal Horizon)
*Cartões podem ter a mesma altura total e ainda assim parecerem terrivelmente desalinhados.*

- **O Problema:** Em grades paralelas de 2, 3 ou 4 cartões de planos, se um título quebra em 2 linhas enquanto os vizinhos têm 1 linha, ou se uma descrição tem 3 linhas enquanto as outras têm 2 linhas, ou se um card recebe um rótulo (*"A partir de"*) que os outros não têm, **os preços e as divisórias começam em alturas diferentes**. Ao traçar uma linha horizontal nos valores principais, os preços sobem e descem como uma escada torta.
- **Onde Procurar:** Seções de preços, grades de planos, vitrines comparativas em desktop e tablets.
- **Solução Mandatória:**
  1. Equalizar o tamanho de títulos e descrições para ocuparem rigorosamente a mesma quantidade de linhas em todos os cards.
  2. Encapsular o topo do card (categoria + título + descrição) em um contêiner com altura mínima padronizada (`min-h-[120px] sm:min-h-[128px] flex flex-col justify-start`).
  3. Travar o bloco de preço com altura fixa e alinhamento na base (`min-h-[64px] flex flex-col justify-end`), garantindo que os valores principais repousem rigorosamente no mesmo pixel horizontal.

---

### Pilar 3: O Clipping de Badges Flutuantes em Containers de Scroll (The Badge Overflow Clipping Trap)
*Elementos posicionados com coordenadas negativas são vulneráveis a containers de rolagem.*

- **O Problema:** Badges e destaques suspensos no topo do card (`absolute -top-3.5`) dentro de um contêiner com `overflow-x: auto` sofrem corte no topo se o contêiner tiver padding insuficiente (`pt-2` = 8px < 14px do badge). Sofrem corte na lateral direita se a posição (`right-4`) coincidir com a curva do card ou com a margem do scroll.
- **Onde Procurar:** Selos como *"★ Mais Escolhido"*, *"Destaque"*, *"Mais Vendido"* em cartões responsivos com scroll horizontal no mobile.
- **Solução Mandatória:**
  1. Fornecer respiro superior generoso no contêiner de rolagem (`pt-5 pb-5` = 20px).
  2. Posicionar o badge em `right-6` (24px) para afastá-lo da curva do cartão e mantê-lo sobre o topo reto.
  3. Incluir sempre `z-20` e `whitespace-nowrap` no badge.

---

### Pilar 4: A Jornada do Polegar e a Ordem Natural de Leitura (Thumb Ergonomics & Spatial Order)
*A interface deve guiar o olhar sem gerar poluição visual prévia.*

- **O Problema:** Inserir indicadores de gesto móvel (*"← Deslize para comparar planos →"*) entre o título da seção e os cartões polui a entrada visual. O usuário é instruído a deslizar antes mesmo de conseguir olhar o primeiro cartão.
- **Onde Procurar:** Tabelas de preços e carrosséis horizontais no celular.
- **Solução Mandatória:**
  1. Posicionar o indicador de swipe **sempre abaixo dos cards** (`pt-3 pb-4`).
  2. A ordem natural ergonômica móvel deve ser:
     *Título/Divisória ➔ Cartões em Scroll-Snap (com 15% de espreita do próximo) ➔ Indicador de Deslize ➔ Gaveta de Módulos ou Próxima Seção.*

---

### Pilar 5: A Eliminação de Freios Psicológicos e Ruídos Verbais (Micro-Distraction Purge)
*Tudo que não ajuda a converter atua como freio ou distração.*

- **O Problema:**
  - **Pontos Finais em Títulos Display:** O ponto final no H1 (`o seu negócio.`) atua como uma barreira óptica que freia a leitura visual e impede o olho de escorregar para o subtítulo e o botão CTA.
  - **Palavras Redundantes em Ações:** Adicionar *"Agora"* em botões longos (*"Falar no WhatsApp Agora"*) força quebras de linha em celulares compactos (360px). O conciso *"Falar no WhatsApp"* é mais nobre e tem maior autoridade.
  - **Ferramentas Inúteis sobre Mídias:** Botões de lupa para ampliar imagens que já ocupam 100% da tela geram poluição visual e concorrem com a ação principal.
- **Solução Mandatória:**
  1. Títulos display de abertura NUNCA levam ponto final.
  2. Rótulos de botões devem ser limpos, objetivos e nunca quebrar em duas linhas no mobile.
  3. Eliminar botões parasitários ou controles órfãos sobre ilustrações 3D.

---

### Pilar 6: A Blindagem de Promessas e Segurança Operacional (Operational Safeguard)
*O design nunca deve prometer o que a operação não consegue garantir.*

- **O Problema:**
  - Fixar prazos públicos estritos (*"Entrega em até 72h"*): se o cliente demorar 5 dias para enviar a logo e fotos, a agência parece atrasada.
  - Vender funcionalidades não desenvolvidas (*"Catálogo com pedidos no Zap e painel admin"*): cria passivos e risco de queimar parcerias.
  - Cravar preço fechado sem margem (*"R$ 600"*): impede o fechamento de projetos que necessitam de escopos adicionais.
- **Solução Mandatória:**
  1. Substituir prazos rígidos por benefícios técnicos perenes (*"Certificado SSL & Máxima Segurança"*).
  2. Usar ancoragem psicológica flexível (*"A partir de R$ 600"*).
  3. Focar a oferta 100% no que a equipe já domina com maestria (ex.: Landing Pages em 3 níveis: Express, Comercial, VIP SEO).

---

### Pilar 7: O Espelho Semântico Ativo 3D ➔ Copywriting (Visual-Copy Mirroring)
*Quando o texto e a imagem contam histórias diferentes, o cérebro desconfia.*

- **O Problema:** Uma ilustração 3D mostra selos de *Velocidade 100/100*, *Google*, *WhatsApp* e *Cadeado SSL*, mas a lista de benefícios em texto fala sobre servidores, código limpo ou tópicos desconexos.
- **Onde Procurar:** Seções com renders 3D, mockups de telas e listas de vantagens.
- **Solução Mandatória:**
  - Estabelecer correspondência estrita 1-para-1 entre cada selo visual flutuante e os itens da lista de benefícios:
    - *Selo 1: Velocidade 100/100* ➔ Benefício 1: Design Mobile-First Ultra-Rápido.
    - *Selo 2: Fale no WhatsApp* ➔ Benefício 2: Botão de WhatsApp Rastreado.
    - *Selo 3: Indexado no Google* ➔ Benefício 3: Cadastro no Google & SEO.
    - *Selo 4: Conexão Segura SSL* ➔ Benefício 4: Certificado SSL & Máxima Segurança.

---

### Pilar 8: A Armadilha do Espaço Transparente em Mídias (The Transparent Scale Trap)
*Uma imagem pode estar ocupando 100% da largura e ainda assim parecer minúscula.*

- **O Problema:** Renders 3D exportados com canvas widescreen (ex.: 1376x768) frequentemente contêm centenas de pixels de margem transparente vazia nas bordas. No navegador, o container atinge a largura máxima, mas o objeto renderizado real fica encolhido no centro, parecendo tímido comparado aos outros produtos.
- **Onde Procurar:** Vitrines de produtos, mockups flutuantes e logos 3D.
- **Solução Mandatória:**
  - Aplicar corte inteligente de canal alfa (`sharp.trim()`). Ao remover a margem transparente morta, o objeto expande ópticamente de 40% a 75% na tela sem alterar uma única linha de CSS.

---

### Pilar 9: A Centralização Geométrica e Ancoragem de Rótulos (Geometric Baseline Anchoring)
*Acessórios de botões devem acompanhar o centro de massa da ação.*

- **O Problema:** Micro-legendas de segurança colocadas abaixo de botões (ex.: *"Demonstração 100% gratuita · Sem compromisso"*) frequentemente herdam classes de alinhamento à esquerda em telas desktop (`sm:text-left`), ficando deslocadas em relação ao botão centralizado.
- **Onde Procurar:** CTAs de Hero, modais e rodapés de fechamento.
- **Solução Mandatória:**
  - Encapsular o botão e a legenda em um bloco com largura intrínseca (`inline-flex flex-col items-center w-full sm:w-auto`), forçando o parágrafo a adotar `text-center flex items-center justify-center gap-2 w-full`.

---

### Pilar 10: Purga de Jargões de Infraestrutura e Foco no Valor de Negócio (Jargon-to-Value Pivot)
*O cliente não compra servidores; ele compra autoridade e vendas.*

- **O Problema:** Exibir termos como *"Zero Mensalidade de Servidor"*, *"Taxas de Hospedagem"* ou jargões técnicos de TI. Clientes leigos não entendem o que é um servidor e ficam inseguros com possíveis custos futuros ou manutenções.
- **Solução Mandatória:**
  - Converter termos de máquina para benefícios claros de negócio: *Velocidade Máxima, Segurança com Criptografia SSL, Posicionamento no Google e Vendas no WhatsApp*.

---

## 📋 Checklist Rápido de Pré-Entrega do Olhar Cirúrgico

Antes de entregar qualquer interface ou emitir um prompt de construção, responda:

| Item | Pergunta de Verificação | Se Reprovado |
| :---: | :--- | :--- |
| **1** | As letras descensionais ("g", "j", "p", "q", "y") em gradientes estão 100% visíveis sem corte reto? | Ajustar `leading` e adicionar `pb-1`. |
| **2** | Os preços principais de todos os cartões estão na mesma linha horizontal quando vistos lado a lado? | Aplicar `min-h` no topo e `justify-end` no preço. |
| **3** | Os badges flutuantes têm 20px de respiro no container de scroll móvel para não sofrerem corte? | Ajustar container para `pt-5 pb-5`. |
| **4** | O indicador *"Deslize para comparar"* está abaixo dos cartões e não poluindo o topo? | Mover para a base dos cards. |
| **5** | O H1 principal está livre de ponto final desnecessário? | Remover o ponto final. |
| **6** | O botão principal de conversão tem área de toque de 48px e não quebra texto no mobile? | Limpar rótulo e aplicar `min-h-[48px]`. |
| **7** | A copy da vitrine espelha com exatidão os elementos visuais da ilustração ao lado? | Sincronizar benefícios com badges 3D. |
| **8** | O ativo de imagem foi recortado (trim) para eliminar bordas transparentes vazias? | Rodar `sharp.trim()` no asset. |
| **9** | A legenda de risco zero abaixo do botão está perfeitamente centralizada? | Encapsular com `inline-flex flex-col items-center`. |
| **10** | A página está livre de termos técnicos frios como "taxas de servidor"? | Substituir por segurança SSL e conversão. |

---

## 🚫 Proibições Invioláveis

- ❌ **Proibido "Passar Pano":** Nunca elogiar um layout passivamente quando houver 1 pixel de desalinhamento, texto cortado ou badge esmagado.
- ❌ **Proibido Quebrar o Mobile para Consertar o Desktop:** Toda correção deve ser validada tanto em telas pequenas (360px–390px) quanto em desktops widescreen.
- ❌ **Proibido Promessas Operacionais Imprudentes:** Nunca permitir que o design prometa prazos que gerem atrito para quem vai executar o serviço.
