# 🛠️ GUIA PRÁTICO DE CONSTRUÇÃO DE SITES — LS DIGITAL WEB
> **Manual Operacional do Desenvolvedor: Da Recepção do Briefing ao Deploy em Produção**  
> *LS Tecnologia & Gestão · Versão 1.0 (Guia Definitivo de Execução Rápida e Lucrativa)*

---

## 🎯 1. A FILOSOFIA DE PRODUÇÃO: O SEGREDO DA ALTA MARGEM
O maior erro de quem cria sites é "reinventar a roda" do zero a cada cliente.  
Para faturar alto e entregar com velocidade recorde, você deve operar como uma **Linha de Montagem Modular**:
* **Stack Padrão Homologada:** HTML5 Semântico + Tailwind CSS v4 + Vanilla JS + Vite.
* **Por que essa Stack?**
  1. **Velocidade Bruta:** Carregamento instantâneo (< 1.5s), garantindo nota verde no Google sem esforço.
  2. **Custo de Hospedagem Zero na Fonte:** Hospedado via Cloudflare Pages ou Vercel (Edge CDN global gratuita), transformando a taxa mensal que o cliente paga em **lucro recorrente líquido (MRR)**.
  3. **Manutenção Nula:** Sem banco de dados para cair, sem plugins desatualizados do WordPress para quebrar ou sofrer ataques de invasão.

---

## 🧭 2. A ESTEIRA OPERACIONAL EM 4 ETAPAS (DO BRIEFING AO GO-LIVE)

```
[ ETAPA 1: TRIAGEM ] ➔ [ ETAPA 2: MONTAGEM ] ➔ [ ETAPA 3: QUALITY GATE ] ➔ [ ETAPA 4: ENTREGA & 7 DIAS ]
   (30 minutos)              (2 a 6 horas)             (20 minutos)                (Protocolo de Homologação)
```

### 📋 Etapa 1: Triagem do Briefing (30 min)
1. Abra o arquivo `FORMULARIO_BRIEFING_CLIENTE_LS_DIGITAL.md` recebido do vendedor.
2. Crie uma pasta para o cliente: `/projetos/nome-do-cliente`.
3. Trate os arquivos visuais:
   * **Logo:** Converta para PNG transparente (`logo.png`) ou WebP.
   * **Fotos:** Converta todas para formato `.webp` redimensionadas (máx. 1600px para banners e 800px para cards de catálogo).
   * **Paleta:** Anote as 2 cores principais da marca (ex: Primária `#0f172a`, Destaque `#f59e0b`).
4. Extraia os dados cruciais: WhatsApp oficial com DDD, endereço completo para o Google Maps e os top 3 a 5 serviços/produtos.

---

## ⚡ 3. PLANO 1: LANDING PAGE EXPRESS (A PARTIR DE R$ 600)
> **Tempo Alvo de Construção:** 2 a 3 horas.  
> **Objetivo:** Uma página única de tiro curto, focada em levar o visitante para o WhatsApp em menos de 30 segundos de navegação.

### 📐 Anatomia das 5 Seções Obrigatórias:

```
┌────────────────────────────────────────────────────────┐
│ [1] HEADER COMPACTO (Logo + Botão WhatsApp Direto)     │
├────────────────────────────────────────────────────────┤
│ [2] HERO DE ALTA CONVERSÃO (Título de Dor/Desejo,      │
│     Subtítulo, Botão Destaque e Foto de Impacto)       │
├────────────────────────────────────────────────────────┤
│ [3] VITRINE EXPRESS (Top 3 Serviços em Cards com Preço)│
├────────────────────────────────────────────────────────┤
│ [4] LOCALIZAÇÃO & CONTATO (Google Maps Embed + Dados)  │
├────────────────────────────────────────────────────────┤
│ [5] RODAPÉ ENXUTO (CNPJ/Nome, Selo SSL e WhatsApp)     │
└────────────────────────────────────────────────────────┘
```

### 🔨 Passo a Passo de Execução:
1. **Header Compacto:**
   * Logo à esquerda com altura de 40px (`h-10`).
   * Botão direto no canto direito: *"Fale Conosco"* com link do WhatsApp e ícone oficial.
2. **Hero de Alta Conversão:**
   * **Título H1:** Direto na dor ou benefício (ex: *"A Melhor Barbearia do Centro: Seu Visual Alinhado em 30 Minutos"*).
   * **Subtítulo:** Reforço do diferencial (ex: *"Profissionais experientes, ambiente climatizado e agendamento sem fila no WhatsApp."*).
   * **Botão CTA Principal:** Grande, com contraste alto (dourado, esmeralda ou azul vibrante), área de toque mínima de 48px e micro-garantia abaixo (`Atendimento rápido no WhatsApp`).
   * **Imagem de Destaque:** Foto de alta qualidade do espaço ou produto em WebP.
3. **Vitrine dos Top 3 Serviços (Cards Rápidos):**
   * Grid de 3 colunas no desktop (`grid-cols-1 md:grid-cols-3 gap-6`).
   * Cada card com: Ícone temático, Nome do Serviço, Descrição de 2 linhas e Botão: *"Pedir no WhatsApp"* (já com o nome daquele serviço no link!).
4. **Seção Localização & Google Maps:**
   * Gere o código de incorporação (Embed) direto do Google Maps com o endereço do cliente:
     ```html
     <iframe src="https://www.google.com/maps/embed?..." width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
     ```
   * Ao lado ou abaixo: Endereço completo, Horário de Funcionamento e Telefone.
5. **Configurações Básicas Obrigatórias:**
   * Botão flutuante do WhatsApp no canto inferior direito.
   * Tag `<meta name="viewport" content="width=device-width, initial-scale=1.0">`.
   * Metatag `<title>` e `<meta name="description">` com o nome da cidade (ex: *"Barbearia Silva em Belém | Cortes Modernos e Barba"*).

---

## 🏢 4. PLANO 2: LANDING PAGE COMERCIAL (SOB MEDIDA)
> **Tempo Alvo de Construção:** 4 a 6 horas.  
> **Objetivo:** Autoridade corporativa inquestionável, apresentação detalhada de catálogo e prova social pesada.

### 📐 Anatomia das 8 Seções Obrigatórias:

```
┌────────────────────────────────────────────────────────┐
│ [1] HEADER COMPLETO (Logo, Menu Âncoras, Botão CTA)    │
├────────────────────────────────────────────────────────┤
│ [2] HERO MONUMENTAL (Proposta Única de Valor + Badges) │
├────────────────────────────────────────────────────────┤
│ [3] INSTITUCIONAL / SOBRE (História, Equipe e Fotos)   │
├────────────────────────────────────────────────────────┤
│ [4] CATÁLOGO DE SERVIÇOS (Grid com Filtro ou Abas)     │
├────────────────────────────────────────────────────────┤
│ [5] DIFERENCIAIS DA EMPRESA (4 a 6 Pilares de Confiança│
├────────────────────────────────────────────────────────┤
│ [6] PROVA SOCIAL (Depoimentos Reais + Nota 4.9/5)      │
├────────────────────────────────────────────────────────┤
│ [7] FAQ INTERATIVO (Perguntas Frequentes em Acordeão)  │
├────────────────────────────────────────────────────────┤
│ [8] CTA FINAL + FOOTER CORPORATIVO COM INSTAGRAM       │
└────────────────────────────────────────────────────────┘
```

### 🔨 Passo a Passo de Execução:
1. **Header Completo com Menu Drawer:**
   * Navegação com âncoras suaves: `#inicio`, `#sobre`, `#servicos`, `#depoimentos`, `#faq`.
   * Menu Mobile Hambúrguer com área de toque mínima de 48x48px (padrão WCAG).
2. **Hero Monumental:**
   * H1 com hierarquia nobre (ex: texto principal em branco e benefício-chave com gradiente dourado ou da marca).
   * Badges de autoridade abaixo do botão (ex: `★ 4.9/5 Estrelas no Google · Mais de 500 Clientes Atendidos`).
3. **Seção Institucional / Sobre Nós:**
   * Grid em 2 colunas: Foto real da empresa/fundador na esquerda e texto institucional na direita.
   * Métricas de autoridade em destaque (ex: `10+ Anos de Tradição`, `99% de Satisfação`).
4. **Catálogo Completo de Serviços (Cards Detalhados):**
   * Apresente de 4 a 10 serviços com badges de destaque (ex: `Mais Procurado`, `Exclusivo`).
   * Cada card deve ter botão individual que já envia mensagem dizendo: *"Olá! Vi o serviço [Nome do Serviço] no site e quero um orçamento."*
5. **Prova Social com Depoimentos Reais:**
   * Cards com fotos dos clientes, estrelas amarelas (★★★★★) e texto do depoimento real colhido no briefing.
   * No mobile, utilize rolagem horizontal suave (`overflow-x-auto snap-x`) para economizar rolagem vertical.
6. **Acordeão de FAQ Nativo (Zero Dependências):**
   * Utilize `<details>` e `<summary>` do HTML moderno com classes Tailwind:
     ```html
     <details class="group bg-slate-900 border border-slate-800 rounded-2xl p-5 mb-3 cursor-pointer">
       <summary class="flex justify-between items-center font-bold text-white list-none">
         <span>Qual é o horário de atendimento?</span>
         <span class="transition group-open:rotate-180">↓</span>
       </summary>
       <p class="text-slate-400 mt-3 text-sm leading-relaxed">Atendemos de segunda a sexta das 08h às 18h...</p>
     </details>
     ```
7. **Integração com Instagram & Rodapé:**
   * Link oficial `@instagram` com abertura em nova aba (`target="_blank" rel="noopener noreferrer"`).
   * Schema JSON-LD no `<head>` com tipo `LocalBusiness` ou `Organization`.

---

## 👑 5. PLANO 3: LANDING PAGE VIP (SOB CONSULTA)
> **Tempo Alvo de Construção:** 1 a 2 dias.  
> **Objetivo:** Domínio absoluto da busca orgânica no Google, nota 100 em performance e acabamento de alto luxo.

### 📐 O que torna a VIP o produto mais lucrativo da sua agência:
A Landing Page VIP contém **tudo da Comercial**, somada à infraestrutura técnica de elite:

### 🔨 Os 6 Pilares de Implementação da VIP:
1. **Design System & Microinterações Refinadas:**
   * Microinterações táteis nos botões com resposta física háptica:
     ```css
     button:active, a:active { transform: scale(0.97); transition: transform 0.1s ease; }
     ```
   * Efeitos de levitação suave nas vitrines de produto com animação CSS acelerada por GPU (`@keyframes float`).
2. **Engenharia de Core Web Vitals (Velocidade 100/100):**
   * Imagem do Hero otimizada com atributo de prioridade:
     ```html
     <img src="/assets/hero.webp" fetchpriority="high" loading="eager" width="600" height="400" alt="...">
     ```
   * Todas as demais imagens da página com `loading="lazy"` e `decoding="async"`.
   * Zero fontes externas pesadas: pré-conecte com o Google Fonts (`dns-prefetch` e `preconnect`) ou use fontes de sistema.
3. **SEO Técnico Local Avançado & Estrelas Douradas no Google:**
   * Injeção no `<head>` do Schema.org completo contendo `LocalBusiness` e `aggregateRating` (gera as estrelinhas amarelas nas buscas):
     ```html
     <script type="application/ld+json">
     {
       "@context": "https://schema.org",
       "@type": "LocalBusiness",
       "name": "Nome da Empresa",
       "image": "https://dominio.com.br/assets/logo.png",
       "telephone": "+5591982102720",
       "address": {
         "@type": "PostalAddress",
         "streetAddress": "Rua Exemplo, 123",
         "addressLocality": "Belém",
         "addressRegion": "PA",
         "addressCountry": "BR"
       },
       "aggregateRating": {
         "@type": "AggregateRating",
         "ratingValue": "4.9",
         "reviewCount": "87"
       }
     }
     </script>
     ```
4. **Os 6 Arquivos Mestres de Infraestrutura na pasta `public/`:**
   * `robots.txt`: Liberando indexação do Googlebot e IAs.
   * `sitemap.xml`: Protocolo sitemaps.org com a URL oficial.
   * `site.webmanifest`: Permite que o cliente instale o site no celular como um app.
   * `llms.txt`: Informações estruturadas para robôs de busca com IA (ChatGPT, Claude, Perplexity).
   * `humans.txt`: Créditos da LS Tecnologia como construtora da página.
   * `.well-known/security.txt`: Contato técnico de segurança.
5. **Indexação Técnica no Google Search Console:**
   * Acesse `search.google.com/search-console`.
   * Adicione a propriedade do domínio do cliente.
   * Envie o link do `sitemap.xml` para indexação imediata das páginas e imagens pelo Googlebot.
6. **Otimização do Perfil no Google Meu Negócio:**
   * Vincule a URL da nova Landing Page VIP no campo "Website" da ficha do cliente no Google Meu Negócio, aumentando a relevância nas buscas por proximidade.

---

## 📱 6. SNIPPET MESTRE DE RASTREAMENTO DO WHATSAPP (COPIAR E COLAR)
Todo botão do site deve enviar o cliente para o WhatsApp já identificando a origem e a intenção de compra.  
Use este gerador de links padrão:

```html
<!-- Exemplo para o Botão Principal do Hero -->
<a 
  href="https://wa.me/5591982102720?text=Ol%C3%A1!%20Vim%20pelo%20site%20e%20gostaria%20de%20solicitar%20uma%20demonstra%C3%A7%C3%A3o."
  target="_blank" 
  rel="noopener noreferrer"
  class="inline-flex items-center justify-center min-h-[48px] px-6 py-3.5 bg-amber-400 hover:bg-amber-300 text-slate-950 font-bold rounded-xl shadow-lg transition active:scale-95"
>
  Solicitar Demonstração no WhatsApp
</a>
```

### 🧠 Regra de Ouro dos Links de WhatsApp:
* `55` (Código do Brasil) + `DDD` + `Número sem traço nem espaço`.
* Mensagem sempre codificada via `encodeURIComponent` (espaço vira `%20`, acento é preservado).

---

## ✈️ 7. CHECKLIST DO QUALITY GATE PRÉ-ENTREGA (5 MINUTOS ANTES DE ENVIAR)
Nunca envie o site para o cliente sem fazer esta checagem rápida:

* [ ] **1. Teste do WhatsApp:** Você clicou em **todos** os botões e eles abriram o WhatsApp oficial do cliente com a mensagem certa?
* [ ] **2. Telefone e Endereço:** O telefone e o endereço no rodapé e no mapa batem 100% com o Bloco 1 do Briefing?
* [ ] **3. Sem Textos Falsos:** Não sobrou nenhum "Lorem Ipsum", "Texto de exemplo" ou dados de outros clientes?
* [ ] **4. Responsividade Mobile:** Você abriu no celular (ou no DevTools com 375px) e confirmou que não há nenhuma barra de rolagem horizontal desregulada?
* [ ] **5. Ergonomia de Toque:** Todos os botões e links possuem altura mínima de 48px, fáceis de tocar com o polegar?
* [ ] **6. Imagens Otimizadas:** Todas as imagens abrem instantaneamente e estão no formato WebP?
* [ ] **7. Certificado SSL:** O site abre com `https://` e o cadeado de segurança verde está ativo?
* [ ] **8. Build Limpo:** O comando `npm run build` terminou com `exit code 0` sem nenhum erro no console?

---

## 🚀 8. PROTOCOLO DE ENTREGA & CONDUÇÃO DOS 7 DIAS DE AVALIAÇÃO

### 💬 Mensagem Pronta de Entrega para Enviar ao Cliente (WhatsApp):
Copie, preencha os dados e mande para o cliente:

> *"Olá, [Nome do Cliente]! Tudo bem?*  
> *Tenho uma excelente notícia: a sua nova Landing Page da **[Nome da Empresa]** está pronta e já está no ar! 🚀*  
> 
> *👉 Acesse o link oficial aqui: **https://[dominio-do-cliente].com.br***  
> 
> *Construímos a página seguindo todas as orientações do seu formulário de briefing, focando em passar autoridade e levar os clientes direto para o seu WhatsApp.*  
> 
> *A partir de hoje, você tem o nosso **prazo de garantia de 7 dias corridos** para navegar, testar os botões e conferir todos os textos e fotos com calma.*  
> *Qualquer ajuste inicial dentro do que combinamos no briefing será feito com prioridade máxima pela nossa equipe!*  
> 
> *Dê uma olhada e me diga o que achou!"*

---

### 🛡️ Como Lidar com Pedidos de Alteração Pós-7 Dias:
Se o cliente pedir novas alterações após os 7 dias ou fora do briefing original:

> *"Olá, [Nome do Cliente]! Que ótimo que sua empresa está evoluindo e precisando de novidades no site!*  
> *Como o prazo de avaliação inicial de 7 dias já foi homologado e a página foi entregue, qualquer nova adição de serviços, fotos ou mudanças de estrutura é avaliada como uma nova solicitação à parte.*  
> *Vou pedir para a nossa equipe comercial te chamar agora mesmo para pegar os detalhes dessa nova demanda e te passar um orçamento super rápido e com desconto especial de cliente ativo!"*

---

## 🏁 RESUMO RÁPIDO: SUA ROTINA DE SUCESSO
1. **Recebeu o Briefing?** Valide se tem logo, fotos e serviços no checklist.
2. **Abriu o Projeto?** Escolha o template (Express, Comercial ou VIP).
3. **Substituiu os Dados?** Troque textos, WhatsApp, cores e mapa.
4. **Rodou o Quality Gate?** Testou no mobile e rodou o build?
5. **Publicou na Cloudflare/Vercel?** Mande a mensagem padrão com o prazo de 7 dias e celebre mais um cliente satisfeito!