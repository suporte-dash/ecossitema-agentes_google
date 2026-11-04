---
name: mobile-web-first
description: Strict mobile-first architecture, layout ergonomics, responsive scaling, and mobile web resilience. Enforces designing first for 360px-390px screens before expanding with fluid breakpoints, guaranteeing 48x48px min touch targets, zero accidental horizontal overflow, native scroll-snap with peeking cards, and mobile network performance.
when_to_use: "Whenever designing or building UI, layouts, navigation, forms, cards, pricing tables, hero sections, modals, drawers, or tuning CSS/Tailwind responsiveness across devices."
allowed-tools: Read, Write, Edit, Grep, Glob
effort: medium
version: 2.0.0
---

# Mobile-Web-First — Layout Ergonomics & Responsive Engineering (v2.0)

> "Designing for desktop and shrinking to mobile creates broken, cramped experiences. True mobile-first engineering builds from the physical constraints of the human thumb, small viewports (360px-390px), and spotty mobile networks, scaling upward with fluid elegance."

---

## 🎯 Purpose & Scope

The **`mobile-web-first`** skill governs all UI, layout, styling, and navigation development. It establishes strict rules to eliminate horizontal overflows, prevent touch fatigue, enforce thumb-zone ergonomics, and optimize conversion funnels for mobile devices while ensuring flawless, fluid scaling up to large 4K displays.

---

## 📱 The 5 Core Directives of Mobile-Web-First

### 1. The Strict Upward Breakpoint Flow
Never write styles assuming desktop defaults and overriding them with `@media (max-width: ...)`. Always style base classes for mobile (360px to 390px viewport width) and expand upward:

```css
/* ❌ FORBIDDEN: Desktop-first degradation */
.card-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
@media (max-width: 768px) {
  .card-grid {
    grid-template-columns: 1fr;
  }
}

/* ✅ MANDATORY: Mobile-first progressive expansion */
/* In Tailwind CSS: */
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 lg:gap-8">
```

#### Breakpoint Reference Progression:
- **Base (360px - 389px):** Android compact viewports, single-column stacks, compact touch cards.
- **`min-[390px]:` / `sm:` (390px - 640px):** Modern iPhones and larger Androids; fluid headline expansion.
- **`md:` (768px):** Tablets, dual-column layouts, expanded navigation.
- **`lg:` (1024px):** Laptops and desktops; full side-by-side grids and interactive stages.
- **`xl:` / `2xl:` (1280px+):** Max-container constraints (`max-w-7xl mx-auto`), preserving optical margins.

---

### 2. Touch Target Ergonomics & The 48x48px Rule
Every interactive element (buttons, links, icon toggles, form inputs, accordions) MUST satisfy the minimum touch target area of **48x48px** (WCAG 2.5.5 Level AAA & Apple Human Interface Guidelines):

- **Visual vs. Hit Target:** If a visual icon is 20px, pad its interactive wrapper to at least 48px:
  ```html
  <!-- ✅ Generous 48px touch target with clean 20px visual icon -->
  <button class="min-w-[48px] min-h-[48px] flex items-center justify-center p-3 rounded-lg active:scale-95 transition-transform" aria-label="Abrir Menu">
    <svg class="w-5 h-5 text-white" ...></svg>
  </button>
  ```
- **Spacing to Avoid Accidental Clicks:** Keep at least 8px to 12px of spacing between adjacent clickable targets to prevent "fat-finger" mis-taps.
- **Haptic Tactility:** Interactive elements must have instantaneous visual feedback on touch:
  `active:scale-[0.98] active:bg-slate-800 transition-all duration-150`.

---

### 3. Absolute Prevention of Horizontal Overflow
Accidental horizontal scrolling (`overflow-x`) shatters user experience on mobile.

- **Relative Widths Only:** Always use `w-full`, `max-w-[100%]`, `max-w-md`, or `min-w-0` instead of fixed pixel widths (e.g., `w-[500px]`).
- **Defensive Flex & Grid Child Sizing:** In Flexbox and CSS Grid, flex children default to `min-w: auto`, which causes overflow when long text or URLs are present. Always apply `min-w-0` on flex items:
  ```html
  <div class="flex items-center gap-3 min-w-0">
    <span class="truncate">Texto longo seguro que nunca estoura a tela</span>
  </div>
  ```
- **Overflow Containment:** On top-level section containers or the page body, apply `overflow-x-clip` or `overflow-x-hidden`.
- **Text Wrap Resilience:** Prohibit uncalibrated `truncate` on critical multi-word labels. Allow natural wrap with `leading-tight` or break with calibrated `min-[390px]:` breakpoints.

---

### 4. High-Converting Mobile Patterns

#### A. Native CSS Scroll-Snap with 15% Peeking Card
Instead of importing heavy JavaScript carousel libraries (Swiper, Slick), use native CSS scroll-snap. Provide a peek indicator (~15% of the next card visible) to intuitively signal that more content is available to the right:
```html
<div class="flex overflow-x-auto snap-x snap-mandatory gap-4 pb-4 px-4 -mx-4 scrollbar-none [scroll-padding-left:1rem]">
  <!-- Card 1: 82vw to 85vw width ensures card 2 peeks out -->
  <div class="snap-start shrink-0 w-[84vw] max-w-[340px] rounded-2xl p-6 bg-slate-900 border border-slate-800">
    ...
  </div>
  <!-- Card 2 -->
  <div class="snap-start shrink-0 w-[84vw] max-w-[340px] rounded-2xl p-6 bg-slate-900 border border-slate-800">
    ...
  </div>
</div>
```

#### B. Collapsible Mobile Drawers / Accordions for Secondary Data
To prevent endless vertical scrolling ("Scroll Ping-Pong"), encapsulate secondary lists, optional modules, or technical specs in `<details>` disclosure elements that stay collapsed on mobile and expand statically on desktop:
```html
<details class="group lg:open border border-slate-800 rounded-xl p-4 bg-slate-900/60" open-desktop>
  <summary class="flex items-center justify-between cursor-pointer list-none min-h-[48px] font-bold text-white">
    <span>⚙️ Ver Módulos Adicionais</span>
    <span class="transition-transform group-open:rotate-180 lg:hidden text-slate-400">↓</span>
  </summary>
  <div class="pt-4 divide-y divide-slate-800/60">
    <!-- Secondary options -->
  </div>
</details>
```

#### C. Sticky Mobile Action Dock (Bottom Bar)
For conversion-critical pages (SaaS checkouts, lead forms), anchor the primary CTA in the ergonomic thumb zone at the bottom of the viewport:
```html
<div class="fixed bottom-0 inset-x-0 z-50 p-3 bg-slate-950/90 backdrop-blur-md border-t border-slate-800/80 lg:hidden pb-[max(0.75rem,env(safe-area-inset-bottom))]">
  <button class="w-full h-12 bg-amber-400 font-bold text-slate-950 rounded-xl flex items-center justify-center">
    Contratar Agora via WhatsApp
  </button>
</div>
```

---

### 5. Mobile Asset & Network Resilience
Mobile users frequently experience fluctuating 3G/4G/5G latency:
- **Format Modernity:** Serve WebP or AVIF formats for all raster graphics with modern compression.
- **Explicit Aspect Ratios:** Always specify `width` and `height` attributes or CSS `aspect-ratio` on images and media containers to eliminate layout shifts (Cumulative Layout Shift - CLS).
- **Native Lazy Loading:** Use `loading="lazy"` on all images below the fold; use `fetchpriority="high"` and `loading="eager"` strictly on the primary Hero asset.
- **Safe Area Insets:** Account for device notches and navigation bars with `env(safe-area-inset-bottom)` and `env(safe-area-inset-top)`.

---

## 📋 Mobile-First Pre-Flight Audit Checklist

Before declaring any frontend code or component ready:
1. [ ] Tested on 360px viewport (compact Android screen) without horizontal scrollbar.
2. [ ] All clickable buttons, pills, toggles, and links have minimum 48x48px hit area.
3. [ ] No text cuts off awkwardly or relies on uncalibrated `truncate` on essential headlines.
4. [ ] The primary Call to Action (CTA) is visible within the initial mobile viewport (first fold).
5. [ ] Bottom margins respect notch/navigation home bars with `env(safe-area-inset-bottom)`.
6. [ ] Secondary lists or comparison cards use scroll-snap or collapsible drawers to prevent excessive vertical scrolling.
