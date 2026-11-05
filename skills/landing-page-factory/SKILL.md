---
name: landing-page-factory
description: Industrial modular landing page and corporate web factory protocol. Governs the end-to-end assembly line for client web pages across 3 tiered offerings (Express, Comercial, and VIP). Enforces briefing intake, modular component assembly, 5-minute pre-delivery quality checks, and 7-day post-delivery evaluation governance.
when_to_use: "When creating, building, scaffolding, or maintaining landing pages, corporate websites, or web storefronts for clients based on briefings, or whenever the user asks to build an Express, Comercial, or VIP landing page."
allowed-tools: Read, Write, Edit, Grep, Glob, run_command
effort: high
version: 1.0.0
---

# Landing Page Factory — Industrial Assembly Line Protocol (v1.0)
> *LS Digital Web · Autonomous Modular Web Architecture & Delivery Engine*

---

## 🎯 1. Purpose & Core Philosophy
The **`landing-page-factory`** skill establishes an industrial, repeatable, high-margin assembly line for building modern high-conversion landing pages and corporate websites. It prevents developers from "reinventing the wheel" from scratch on every project by enforcing:
* **Production Stack:** HTML5 Semântico + Tailwind CSS v4 + Vanilla JS + Vite.
* **Zero Hosting Cost on Infrastructure:** Deploy to Cloudflare Pages or Vercel (Edge CDN, auto SSL, 0 maintenance), ensuring that 100% of the client's monthly hosting fee converts to net recurring revenue (MRR).
* **Speed to Market:** Express built in 2-3h, Comercial in 4-6h, VIP in 1-2 days.

---

## 🧭 2. The 4-Stage Operational Pipeline

```
[ ETAPA 1: TRIAGEM ] ➔ [ ETAPA 2: MONTAGEM ] ➔ [ ETAPA 3: QUALITY GATE ] ➔ [ ETAPA 4: ENTREGA & 7 DIAS ]
   (30 minutos)              (2 a 6 horas)             (20 minutos)                (Protocolo de Homologação)
```

### 📋 Etapa 1: Triagem do Briefing (30 min)
1. Read the intake form: `FORMULARIO_BRIEFING_CLIENTE_LS_DIGITAL.md`.
2. Extract the core tokens:
   - Primary and Accent brand colors (ex: `#0f172a`, `#f59e0b`).
   - Official WhatsApp number with country and area code (`5591982102720`).
   - Full physical address for Google Maps embed and schema.
   - Top 3 to 5 products or services with pricing/value proposition.
3. Asset Pipeline: Convert all images to `.webp` (max 1600px width for banners, max 800px for service cards). Convert logo to transparent PNG/WebP.

---

## ⚡ 3. Tiered Plan Architecture & Mandatory Sections

### ⚡ Plano 1: Landing Page Express (A partir de R$ 600)
* **Goal:** Direct 30-second conversion to WhatsApp for small businesses and independent pros.
* **Mandatory 5 Sections:**
  1. *Header Compacto*: Logo (h-10) + Direct WhatsApp button.
  2. *Hero de Alta Conversão*: Problem/solution H1, UVP subtitle, high-contrast CTA button with intent tracking, single clean WebP hero image.
  3. *Vitrine Express*: 3 service cards (`grid-cols-1 md:grid-cols-3 gap-6`), each with icon, title, description, and individual WhatsApp button.
  4. *Localização & Google Maps*: Responsive iframe embed + full address, working hours, and phone.
  5. *Rodapé Enxuto*: Copyright, business name, SSL badge, and floating WhatsApp dock.

### 🏢 Plano 2: Landing Page Comercial (Sob Medida)
* **Goal:** Corporate authority, structured catalog, and heavy social proof.
* **Mandatory 8 Sections:**
  1. *Header Completo*: Brand logo, anchor navigation (`#inicio`, `#sobre`, `#servicos`, `#depoimentos`, `#faq`), and mobile drawer menu with 48x48px touch targets.
  2. *Hero Monumental*: Display H1 with brand gradient, authority badge (e.g., `★ 4.9/5 no Google`), and primary CTA.
  3. *Institucional / Sobre Nós*: 2-column layout with real business/founder photo, history, and trust metrics.
  4. *Catálogo de Serviços Detalhado*: 4 to 10 service cards with badges (`Mais Procurado`, `Exclusivo`), descriptions, and dynamic WhatsApp links.
  5. *Diferenciais Competitivos*: 4 to 6 pillars of trust with icons.
  6. *Prova Social (Depoimentos)*: Verified customer reviews with stars and mobile scroll-snap (`overflow-x-auto snap-x`).
  7. *FAQ Interativo Nativo*: 5 to 6 questions using zero-dependency HTML `<details>` and `<summary>`.
  8. *CTA Final & Rodapé Corporativo*: Strong closing section with direct links to official Instagram (`@handle`) and complete contact data.

### 👑 Plano 3: Landing Page VIP (Sob Consulta)
* **Goal:** Absolute organic Google dominance, perfect 100/100 Core Web Vitals, luxury aesthetics.
* **Everything in Comercial PLUS the 6 VIP Pillars:**
  1. *Design System & Haptic Feedback*: Micro-interactions with `:active { transform: scale(0.97); }` and GPU-accelerated CSS float animations (`@keyframes float`).
  2. *Core Web Vitals Engineering*: LCP < 1.5s, `fetchpriority="high"` on hero, `loading="lazy"` on below-the-fold assets, zero layout shift (CLS 0.00).
  3. *SEO Técnico Local & Schema.org Rich Results*: Structured JSON-LD with `LocalBusiness`, `PostalAddress`, and `aggregateRating` (producing golden review stars on Google Search).
  4. *The 6 Infrastructure Master Files*: `robots.txt`, `sitemap.xml`, `site.webmanifest`, `llms.txt`, `humans.txt`, and `.well-known/security.txt`.
  5. *Google Search Console Indexing*: Formal sitemap submission and instant URL inspection.
  6. *Google Business Profile Integration*: Canonical website sync on Google Maps.

---

## 📱 4. WhatsApp Intent Tracking Engine
Every button MUST direct the lead to WhatsApp with pre-filled context encoding:
```html
<a 
  href="https://wa.me/5591982102720?text=Ol%C3%A1!%20Vim%20pelo%20site%20e%20gostaria%20de%20solicitar%20uma%20demonstra%C3%A7%C3%A3o."
  target="_blank" 
  rel="noopener noreferrer"
  class="min-h-[48px] px-6 py-3.5 bg-amber-400 hover:bg-amber-300 text-slate-950 font-bold rounded-xl transition active:scale-95"
>
  Solicitar Demonstração no WhatsApp
</a>
```
* **Format:** `55` + Area Code + Number (digits only).
* **Text Encoding:** Strict `encodeURIComponent` syntax.

---

## ✈️ 5. Pre-Delivery Quality Gate (5-Minute Checklist)
Before dispatching the evaluation link to the client:
* [ ] All WhatsApp buttons tested and directing to the verified client number.
* [ ] Address and phone match 100% of the briefing intake data.
* [ ] Zero mock text ("Lorem Ipsum") remaining in any section.
* [ ] Mobile responsiveness verified at 360px-390px with zero horizontal scroll bleed.
* [ ] All touch targets meet WCAG 48x48px minimum area.
* [ ] Images properly compressed in WebP.
* [ ] SSL active via HTTPS.
* [ ] Clean build (`vite build` or `npm run build` exits with code 0).

---

## 🛡️ 6. Post-Delivery Governance (7-Day Evaluation Protocol)
* **Delivery Message:** Send live production link to client stating the **7-day evaluation window** for initial alignment adjustments.
* **Scope Shielding:** Any modifications requested after the 7 days or beyond the original briefing scope are formally redirected to the sales team for a custom quote.
