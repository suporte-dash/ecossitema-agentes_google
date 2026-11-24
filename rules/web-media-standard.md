# WEB MEDIA STANDARD — DIRETRIZ MESTRE DE FORMATOS & OTIMIZAÇÃO DE MÍDIAS WEB
## REGRA UNIVERSAL DO ECOSSISTEMA: LEVEZA MÁXIMA, NITIDEZ INFINITA E ZERO BLOAT

Esta regra rege **todo e qualquer projeto web, landing page, aplicativo ou dashboard** desenvolvido no ecossistema de agentes.
Nenhum arquivo de imagem pode ser integrado ao código de produção sem aderir rigorosamente a esta matriz de decisão.

---

### 1. A Matriz Mandatória de Formatos por Finalidade

| Finalidade da Imagem | Formato Mandatório | Justificativa Técnica de Engenharia |
| :--- | :---: | :--- |
| **Ícones de UI, Setas, Botões e Logotipos Vetoriais** | **SVG** (`.svg` ou `<svg>`) | Pesa 1 a 3 KB. Nitidez matemática infinita (nunca borra em 4K/8K/Retina). Estilizável dinamicamente com CSS (`fill`, `stroke`, `currentColor`). |
| **Vitrines de Produto, Mockups 3D, Fotos e Banners** | **WebP** (`.webp`) | 25-35% mais leve que JPEG e até 75-80% mais leve que PNG. Suporta transparência (canal alpha) com bordas suaves e compressão moderna. |
| **Fotografia Hiper-Pesada / E-commerce de Luxo** | `<picture>` com **AVIF + WebP** | AVIF oferece até 20% mais compressão que WebP. Usar sempre `<picture>` com `<source type="image/avif">` e fallback em `<source type="image/webp">`. |
| **Favicons & Crawlers de Motores de Busca (Google)** | **WebP + PNG 48px + favicon.ico** | WebP para abas de navegadores modernos; PNG 48x48 para atender às diretrizes do Googlebot-Image; `favicon.ico` na raiz para compatibilidade universal. |
| **Arquivos de Design Brutos (Figma, Photoshop)** | **PNG / PSD** | Exclusivamente para criação offline e manipulação em alta fidelidade. **Nunca subir PNGs pesados (> 300 KB) para a web.** |

---

### 2. Padrão Canônico de Favicons de Alto Padrão (Design & SEO)
1. **Recorte Circular Mandatório**:
   - Favicons com fundo escuro ou colorido devem receber máscara circular com cantos externos transparentes (`alpha: 0`).
   - Evita o efeito "azulejo" quadrado de 90° nas abas cinzas de navegadores (Brave, Chrome, Edge) e casa 100% com a moldura redonda da busca do Google.
2. **Dupla Tag Limpa no `<head>`**:
   ```html
   <link rel="icon" type="image/webp" href="/assets/favicon-google.webp" />
   <link rel="icon" type="image/png" sizes="48x48" href="/assets/favicon-google-48.png" />
   <link rel="shortcut icon" href="/favicon.ico" />
   ```
3. **Proibição de Matrizes Redundantes**:
   - Proibido empilhar múltiplos arquivos PNG duplicados (ex.: 96px, 144px, 192px, 512px) na pasta de assets sem justificativa de PWA dedicado. Mantenha a pasta limpa com o WebP e o PNG de 48px.

---

### 3. Regras de Carregamento e Core Web Vitals (LCP & CLS)
1. **Prevenção de Layout Shift (CLS = 0)**:
   - Todas as tags `<img>` devem declarar explicitamente atributos `width` e `height` (ou `aspect-ratio` no CSS).
2. **Carregamento Inteligente**:
   - **Abaixo da dobra**: `loading="lazy"` e `decoding="async"` mandatórios.
   - **Hero LCP (Acima da dobra)**: Nunca usar `loading="lazy"` na imagem principal do Hero; usar `<link rel="preload" as="image" href="..." fetchpriority="high">` no `<head>`.
3. **Eliminação de Margem Morta (Alpha Trim)**:
   - Imagens recortadas com transparência devem passar por trim de canal alfa (`sharp.trim()`), garantindo que o sujeito ocupe o volume óptico real sem margens vazias invisíveis.

---

### 4. Padrões Proibidos (Anti-Patterns)
- ❌ Proibido o uso de PNG ou JPEG para ícones de interface quando um SVG estiver disponível.
- ❌ Proibido o envio de imagens maiores que 350 KB para a web sem compressão prévia.
- ❌ Proibido manter imagens duplicadas (mesma arte em PNG e WebP) na pasta `assets` sem o uso de `<picture>`.
