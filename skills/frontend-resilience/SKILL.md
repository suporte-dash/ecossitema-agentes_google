---
name: frontend-resilience
description: Production-grade frontend data-fetching resilience, 4-state visual UI handling (Skeleton Loading, Success/Data, Friendly Retry Error, Explanatory Empty State), decoupled UI/API layer, and design-system token adherence. Prevents UI flickers, layout shifts, unhandled errors, and magic numbers.
when_to_use: "Whenever writing UI components that consume async data, handle user input, render lists or tables, interact with APIs or databases, or manage client-side state."
allowed-tools: Read, Write, Edit, Grep, Glob
effort: medium
version: 2.0.0
---

# Frontend Resilience — Robust UI States, Token Scalability & Data Decoupling (v2.0)

> "A fragile UI works only when the network is fast, the API returns perfect data, and the user behaves predictably. A resilient UI gracefully absorbs network drops, empty databases, slow queries, and unexpected payloads without breaking or confusing the human user."

---

## 🎯 Purpose & Scope

The **`frontend-resilience`** skill governs all client-side state management, async data consumption, component architecture, and design token application. It enforces zero unhandled states, eliminates layout shifts (CLS), forbids magic styling numbers, and mandates clean decoupling between visual presentation and business/network logic.

---

## 🛡️ The 4 Mandatory Visual States Protocol

Every single component or screen that consumes asynchronous data (via REST, GraphQL, tRPC, WebSocket, or local database) MUST explicitly handle and visually render the 4 states:

```
[ Async Data Request ]
        │
        ├── 1. CARREGAMENTO (Skeleton Loading)
        ├── 2. DADOS/SUCESSO (Full Data UI)
        ├── 3. ERRO AMIGÁVEL (Actionable Error with Retry)
        └── 4. ESTADO VAZIO (Explanatory Empty State + Action)
```

---

### State 1: Skeleton Loading (Structural Mirroring)
- **Forbidden:** Generic central spinners (`<div class="spinner" />`) that block the screen and give no structural anticipation.
- **Mandatory:** Skeletons that mimic the exact geometry, aspect ratios, and typography blocks of the final content using subtle pulse animations:
  ```html
  <!-- Skeleton Card Example (Tailwind) -->
  <div class="w-full rounded-2xl p-6 bg-slate-900/60 border border-slate-800 animate-pulse space-y-4" aria-busy="true" aria-label="Carregando dados...">
    <!-- Header skeleton -->
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-xl bg-slate-800"></div>
      <div class="space-y-2 flex-1">
        <div class="h-4 bg-slate-800 rounded w-1/3"></div>
        <div class="h-3 bg-slate-800/60 rounded w-1/4"></div>
      </div>
    </div>
    <!-- Body skeleton lines -->
    <div class="space-y-2 pt-2">
      <div class="h-3 bg-slate-800/70 rounded w-full"></div>
      <div class="h-3 bg-slate-800/70 rounded w-5/6"></div>
    </div>
    <!-- CTA skeleton -->
    <div class="h-11 bg-slate-800 rounded-xl w-full pt-2"></div>
  </div>
  ```

---

### State 2: Success / Data Presentation
- Data renders smoothly without layout pop-in or text jumps.
- Clean key assignment in lists (always unique semantic IDs like `item.id`, never raw array indices if list order is mutable).
- Number formatting adheres to the locale (e.g., `Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' })`).

---

### State 3: Friendly Error State with Actionable Retry
- **Forbidden:** Silent failures, blank screens, or dumping raw JSON / HTTP 500 error strings to the user.
- **Mandatory:** Empathetic, human-readable explanation paired with a clear recovery trigger:
  ```html
  <div class="w-full rounded-2xl p-8 bg-rose-950/20 border border-rose-500/30 text-center space-y-3">
    <div class="w-12 h-12 mx-auto rounded-full bg-rose-500/10 flex items-center justify-center text-rose-400">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">...</svg>
    </div>
    <h4 class="text-base font-bold text-white">Não foi possível carregar os planos</h4>
    <p class="text-xs text-slate-400 max-w-sm mx-auto">
      Houve uma oscilação na conexão com o servidor. Seus dados continuam seguros.
    </p>
    <button onclick="retryFetch()" class="inline-flex items-center justify-center px-4 py-2 text-xs font-bold text-white bg-slate-800 hover:bg-slate-700 active:scale-95 rounded-lg border border-slate-700 transition-all">
      🔄 Tentar Novamente
    </button>
  </div>
  ```

---

### State 4: Explanatory Empty State
- When data queries return an empty array `[]` (e.g., no products created yet, no search results):
- Provide clear context: Explain why it is empty.
- Provide a clear next step: A button to create the first record, reset filters, or contact support.
  ```html
  <div class="w-full rounded-2xl p-10 bg-slate-900/40 border border-dashed border-slate-800 text-center space-y-3">
    <span class="text-3xl">📦</span>
    <h4 class="text-base font-bold text-white">Nenhum produto cadastrado</h4>
    <p class="text-xs text-slate-400 max-w-xs mx-auto">
      Você ainda não adicionou itens ao seu catálogo. Comece cadastrando seu primeiro produto.
    </p>
    <button class="inline-flex items-center px-4 py-2.5 text-xs font-bold text-slate-950 bg-amber-400 hover:bg-amber-300 rounded-xl transition-transform active:scale-95">
      + Cadastrar Primeiro Produto
    </button>
  </div>
  ```

---

## 🧩 Architectural Decoupling: Presentation vs. Logic

Never mix raw `fetch()` or database calls directly inside visual render trees:

```
[ Component Presentation UI ]
          │ (calls)
[ Custom Hook / ViewModel ]
          │ (calls)
[ Typed API Client / Service Layer ]
          │ (validates)
[ Contract Schema (Zod / Valibot) ]
```

### Decoupling Rules:
1. **Visual Components:** Focus exclusively on markup, accessibility attributes (`aria-`), and passing user interactions to callback handlers.
2. **State & Effects:** Encapsulated in domain hooks (e.g., `usePricingSimulator()`, `useProductCatalog()`).
3. **API Services:** Isolated in standalone files (e.g., `services/api.ts`), returning strongly-typed Promises.

---

## 🎨 Zero Magic Numbers: Design Token Discipline

Every visual property must strictly map to the project's design system or Tailwind scale:

- **Forbidden Spacing:** `margin-top: 17px;`, `padding: 23px;`, `w-[327px]`.
- **Allowed Spacing:** Canonical spacing multiples of 4px / Tailwind scale (`gap-4`, `p-6`, `space-y-3`, `max-w-md`).
- **Forbidden Colors:** Arbitrary ad-hoc hex values scattered across files (`#1f2a37`, `#324152`).
- **Allowed Colors:** Semantic tokens or palette variables (`bg-slate-900`, `text-slate-400`, `text-[#f5b700]` where `#f5b700` is the registered brand token).

---

## 📋 Frontend Resilience Audit Checklist

Before releasing any frontend code:
1. [ ] Tested loading state: renders an accurate structural skeleton (no generic spinner).
2. [ ] Tested empty data state: shows informative message and CTA when array is empty.
3. [ ] Tested error state: shows human-readable error with a functioning "Retry" button.
4. [ ] No raw unformatted timestamps, currency values, or undefined strings (e.g., `NaN`, `undefined`).
5. [ ] No hardcoded magic spacing numbers or arbitrary colors outside design tokens.
6. [ ] Zero layout shift (CLS): dimensions on images, containers, and skeletons are explicitly declared.
