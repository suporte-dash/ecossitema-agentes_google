---
name: pre-flight-quality-gate
description: Mandatory pre-deployment quality gate, production readiness review (PRR), Core Web Vitals audit, and Google suite verification protocol. Enforces passing through the 4 quality gates (Clean Build & Bundle Budget -> Semantic DOM & Asset Integrity -> Core Web Vitals & PageSpeed Green Band -> SEO & Schema.org Rich Results) before any code is deployed or declared production-ready.
when_to_use: "Before any production deployment, git push origin main, release tag, or when conducting final production quality audits for any web application or landing page."
allowed-tools: Read, Write, Edit, Grep, Glob, run_command
effort: high
version: 1.0.0
---

# Pre-Flight Quality Gate — Production Readiness, Core Web Vitals & Google Suite Protocol (v1.0)

> "A senior engineer never deploys to production on assumptions. Code that compiles is not necessarily ready for the real world. Every production release must pass through the 4 Quality Gates — ensuring maximum speed, flawless SEO, zero layout shifts, and real conversion readiness before the first user clicks."

---

## 🎯 Purpose & Scope

The **`pre-flight-quality-gate`** skill governs the mandatory pre-deployment and post-deployment audit battery for any web application, landing page, or SaaS platform. It acts as the final firewall protecting production, enforcing that no project is declared ready or pushed to live users without passing strict metrics across Performance (Core Web Vitals), Accessibility, Best Practices, and SEO.

---

## 🏛️ The 4 Production Quality Gates

Before authorizing `git push origin main`, executing deploy commands, or signing off a release, the agent MUST verify compliance across all 4 gates:

```
┌────────────────────────────────────────────────────────┐
│ GATE 1: CLEAN BUILD & BUNDLE BUDGET INTEGRITY          │
│ (vite build / npm run build / gzip & chunk inspection) │
└──────────────────────────┬─────────────────────────────┘
                           │ (passes)
┌──────────────────────────▼─────────────────────────────┐
│ GATE 2: SEMANTIC DOM, ASSETS & DATA INTEGRITY          │
│ (0 broken links / modern WebP / explicit dims / 0 mock)│
└──────────────────────────┬─────────────────────────────┘
                           │ (passes)
┌──────────────────────────▼─────────────────────────────┐
│ GATE 3: CORE WEB VITALS & GOOGLE PAGESPEED AUDIT       │
│ (TBT < 100ms / CLS < 0.1 / LCP < 2.5s / 90+ Green Band)│
└──────────────────────────┬─────────────────────────────┘
                           │ (passes)
┌──────────────────────────▼─────────────────────────────┐
│ GATE 4: SEO, GEO & SCHEMA.ORG RICH RESULTS             │
│ (SEO 100 / Schema JSON-LD / aggregateRating / Sitemap) │
└────────────────────────────────────────────────────────┘
```

---

### 🚪 Gate 1: Clean Build & Bundle Budget Integrity
1. **Exit Code 0:** `npm run build` or framework compiler MUST exit with code 0 without unhandled warnings.
2. **Bundle Budget Discipline:**
   - Critical CSS: `< 100 kB` uncompressed (`< 15 kB` gzipped).
   - Core JavaScript: Minimal footprint without heavy unneeded dependencies (zero jQuery, zero bloated legacy libs).
3. **Zero Dead Code & Zero Logs:**
   - No orphan functions or leftover debugging statements (`console.log`, `debugger`).
   - Clean source tree without lingering scratch scripts or temporary test files in production paths.

---

### 🚪 Gate 2: Semantic DOM, Assets & Data Integrity
1. **Zero Broken Anchors:** 100% of internal navigation links (`href="#id"`) MUST correspond to real, existing IDs in the DOM.
2. **Asset Validation on Disk:** Every file referenced in `src` or `href` (`/assets/...`, `/public/...`) MUST physically exist in the filesystem.
3. **Modern Media & Load Attributes:**
   - 100% of images converted to modern formats (`.webp`, `.avif`, `.svg`).
   - LCP hero image: explicit `fetchpriority="high"`, `loading="eager"`, and corresponding `<link rel="preload">` in `<head>`.
   - Below-the-fold images: mandatory `loading="lazy"` and `decoding="async"`.
   - Explicit dimensions: `width` and `height` defined on all images to eliminate Cumulative Layout Shift (CLS).
4. **Zero Production Placeholders:**
   - No `lorem ipsum`, no placeholder links (`#`, `javascript:void(0)`), no mock phone numbers, and no template tags (`[DOMINIO]`, `[EMAIL]`).
   - Official WhatsApp numbers, Instagram handles, and domains MUST be validated.

---

### 🚪 Gate 3: Core Web Vitals & PageSpeed Green Band
1. **The Core Web Vitals Standard (Mobile 4G Emulation):**
   - **TBT (Total Blocking Time):** `< 100 ms` (Target: `0 ms` — zero main-thread CPU blocking).
   - **CLS (Cumulative Layout Shift):** `< 0.10` (Target: `0.00` — zero layout jumps).
   - **LCP (Largest Contentful Paint):** `< 2.5 s` (Target: `< 2.0 s` on desktop, `< 3.3 s` on throttled mobile).
   - **FCP (First Contentful Paint):** `< 2.0 s`.
2. **PageSpeed Score Threshold:**
   - **Performance:** `>= 90 / 100` (Official Google Green Band).
   - **Accessibility:** `>= 95 / 100` (WCAG AAA/AA touch targets 48x48px, sequential headings H1➔H2➔H3➔H4).
   - **Best Practices:** `>= 95 / 100` (HTTPS, modern doctype, clean console).

---

### 🚪 Gate 4: SEO, GEO (AI Search) & Rich Results
1. **SEO Score 100 / 100:**
   - Unique display `<title>` and `<meta name="description">`.
   - Canonical URL (`<link rel="canonical">`) declared.
   - Open Graph (`og:title`, `og:description`, `og:image` 1200x630, `og:url`) for WhatsApp and social preview.
   - Twitter Card meta tags.
2. **Infrastructure Files in `public/`:**
   - `robots.txt`: Proper allow/disallow rules and Sitemap declaration.
   - `sitemap.xml`: Protocol-compliant XML mapping core URLs and canonical media.
   - `site.webmanifest`: PWA standalone installation manifest.
   - `llms.txt`: Structured Generative Engine Optimization (GEO) guide for AI crawlers (Gemini, ChatGPT, Perplexity).
3. **Schema.org JSON-LD Rich Results:**
   - Valid JSON-LD in `<head>` tested via Google Rich Results.
   - `Organization`: Name, official logo, contact point, social URLs (`sameAs`).
   - `SoftwareApplication` / `Product` / `Service`: Name, category, pricing, and **`aggregateRating`** (ratingValue & reviewCount) to enable golden stars (★★★★★) in Google Search.
   - `FAQPage`: Conversational QA schema for voice search and generative AI answers.

---

## 🚀 Post-Deploy Live Verification

Immediately after triggering deployment to Cloudflare Pages, Vercel, or cloud hosting:
1. Probe the live production URL via HTTPS to ensure HTTP status `200 OK`.
2. Verify SSL/TLS certificate validity.
3. Validate that critical files (`/robots.txt`, `/sitemap.xml`, `/llms.txt`) are publicly accessible.
4. Run the live URL in Google PageSpeed Insights and Rich Results Test to confirm real-world green scores.
