---
layout: lewk
title: lewk — framework preview
permalink: /lewk.html
---

<section class="section">
  <div class="split">
    <div>
      <h6 class="meta">Memex / Style Framework / MVP</h6>
      <h1 style="margin-top: var(--sp-2)">A new lewk.</h1>
    </div>
    <div>
      <p style="font-size: var(--fs-4); max-width: 36em;">
        A lightweight, full-bleed CSS framework for the memex — replacing
        fomantic and the legacy stylesheet. One accent color, alpha-stepped
        grayscale, hairline rules instead of cards, and instant theme
        swapping. Right-click the swatches in the corner to roll a random
        theme.
      </p>
      <div class="cluster" style="margin-top: var(--sp-3)">
        <a class="btn btn--accent" href="#layouts">See layouts</a>
        <a class="btn" href="#components">Components</a>
        <a class="link-arrow" href="#themes">Theme system</a>
      </div>
      <nav class="cluster" style="margin-top: var(--sp-4); font-family: var(--font-ui); font-size: var(--fs-2); text-transform: uppercase; letter-spacing: 0.06em">
        <a href="#typography">Type</a>
        <a href="#layouts">Layouts</a>
        <a href="#splits">Splits</a>
        <a href="#components">Components</a>
        <a href="#blocks">Blocks</a>
        <a href="#memex">Memex</a>
        <a href="#themes">Themes</a>
      </nav>
    </div>
  </div>
</section>

<section class="section" id="typography">
  <div class="row">
    <div class="label">Typography</div>
    <div class="stack">
      <h1>Display heading</h1>
      <h2>Section heading</h2>
      <h3>Subsection heading</h3>
      <h4>Tertiary heading</h4>
      <h5>Eyebrow / Label</h5>
      <h6>Smallcaps meta</h6>
      <p>Body text in Lora, set at <code>--fs-3</code> (1rem) with line-height <code>1.55</code>. Links inherit color and use a <a href="#">solid 1px underline</a> that becomes <a href="#" style="text-decoration-style:wavy;text-decoration-color:var(--accent)">wavy</a> on hover. Inline <code>code</code> sits on the buffer tint, and <em>emphasis</em> and <strong>strong</strong> are rendered with the body face.</p>
      <blockquote>Hairline rules, em-based padding, and a single foreground color stepped by alpha do most of the work. The framework is roughly 280 lines of CSS.</blockquote>
    </div>
  </div>

  <div class="row">
    <div class="label">Type scale</div>
    <div class="stack-tight">
      <div style="font-size: var(--fs-7); line-height:1">fs-7 — Display</div>
      <div style="font-size: var(--fs-6); line-height:1">fs-6 — H2</div>
      <div style="font-size: var(--fs-5); line-height:1">fs-5 — H3</div>
      <div style="font-size: var(--fs-4); line-height:1">fs-4 — H4 / lede</div>
      <div style="font-size: var(--fs-3); line-height:1">fs-3 — Body</div>
      <div style="font-size: var(--fs-2); line-height:1">fs-2 — Small / UI</div>
      <div style="font-size: var(--fs-1); line-height:1">fs-1 — Micro</div>
    </div>
  </div>
</section>

<section class="section" id="layouts">
  <h2>Layouts</h2>
  <p class="muted">Three primitives cover most pages: <code>.row</code> (label / content), <code>.dir</code> (three-col directory), and <code>.grid</code> (auto-fill index).</p>

  <h3 style="margin-top: var(--sp-5)">Row — label / content</h3>
  <div class="row">
    <div class="label">Profile</div>
    <div>
      <p>Memex of Ním Daghlian. Notes, gardens, octothorpes, half-finished essays, and assorted clearings.</p>
      <a class="link-bracket" href="#">More..</a>
    </div>
  </div>
  <div class="row">
    <div class="label">Education</div>
    <div class="stack-tight">
      <p>Vestibulum Euismod Ultrices (Congue), 2023</p>
      <p>Suspendisse Aenean Lectus (3 years)</p>
      <p>Aliquam Faucibus Tellus</p>
    </div>
  </div>
  <div class="row">
    <div class="label">Contact</div>
    <div class="cluster">
      <a class="link-bracket" href="#">Email</a>
      <a class="link-bracket" href="#">Mastodon</a>
      <a class="link-bracket" href="#">RSS</a>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Directory — three-column</h3>
  <div class="dir">
    <div><span class="meta">1. Test Project</span></div>
    <div>
      <em>Phantomas</em> — N° 35-36<br>
      Editions de la revue Phantomas<br>
      Bruxelles, 1962
    </div>
    <div>
      <p>A Belgian literary magazine published 1953–1980. The framework borrows its label/content rhythm from cargo.site editorial templates.</p>
      <a class="link-bracket" href="#">More..</a>
    </div>
  </div>
  <div class="dir">
    <div><span class="meta">2. Test Project</span></div>
    <div>
      Hamish Fulton, <em>Nepal</em><br>
      Exhibition Catalog<br>
      Van Abbemuseum, Eindhoven, 1977
    </div>
    <div>
      <p>Hairline rules separate every directory row. No card chrome — the structure carries the weight.</p>
      <a class="link-bracket" href="#">More..</a>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Fixed columns — <code>.cols-2</code> / <code>.cols-3</code> / <code>.cols-4</code></h3>
  <p class="muted">Desktop: N columns. ≤960px: drops to 2. ≤640px: stacks to 1. Try resizing the window.</p>

  <div class="cols cols-3" style="margin-top: var(--sp-3)">
    <div class="card--boxed">
      <div class="meta">Note · 2026</div>
      <h4 style="margin: var(--sp-2) 0">Brain methods</h4>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porta ex a porta blandit.</p>
      <a class="link-bracket" href="#">Read</a>
    </div>
    <div class="card--boxed">
      <div class="meta">Garden · 2026</div>
      <h4 style="margin: var(--sp-2) 0">Clearings</h4>
      <p>Suspendisse feugiat justo at mauris molestie molestie. Ut mattis urna sed sem pulvinar.</p>
      <a class="link-bracket" href="#">Read</a>
    </div>
    <div class="card--boxed">
      <div class="meta">Photo · 2025</div>
      <h4 style="margin: var(--sp-2) 0">Hummingbirds</h4>
      <p>Curabitur laoreet erat et sapien venenatis luctus, vitae rutrum nulla ultrices.</p>
      <a class="link-bracket" href="#">Read</a>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Rails — equal columns with vertical hairlines</h3>
  <p class="muted">The signature cargo / editorial layout: full-bleed equal-weight columns separated by vertical 1px rules. <code>.rails-3</code> goes 1 → 2 → 3 columns; <code>.rails-4</code> goes 1 → 2 → 4. Each child is independently scrollable content.</p>

  <div class="rails rails-3" style="margin-top: var(--sp-3); border-top: var(--rule); padding-top: var(--sp-4)">
    <div>
      <div class="meta">Profile (Sample)</div>
      <p style="margin-top: var(--sp-2)">hello@example.com<br>Instagram</p>
      <p>Vestibulum et dignissim magna. Nullam at ultrices felis. Suspendisse facilisis sagittis sem sit amet tempor. Nam sit amet nibh et enim laoreet porta sit amet vel purus.</p>
      <div class="meta" style="margin-top: var(--sp-3)">Contact</div>
    </div>
    <div>
      <div class="meta">Material (Sample)</div>
      <h4 style="margin: var(--sp-2) 0 var(--sp-3); font-family: var(--font-display); font-size: var(--fs-5)">Bark Barque Baroque</h4>
      <p><em>Bark Barque Baroque</em>, with John R. Nash<br>Ian Hamilton Finlay (1925–2006)<br>The Fleming Collection</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porta ex a porta blandit. Suspendisse feugiat justo at mauris molestie molestie.</p>
      <a class="link-bracket" href="#">More..</a>
    </div>
    <div>
      <div class="meta">CV (Sample)</div>
      <dl>
        <dt>Education</dt>
        <dd>Vestibulum Euismod Ultrices (Congue)<br>Suspendisse Aenean Lectus, 2023</dd>
        <dt>Employment</dt>
        <dd>Vestibulum Ultricies Suspendisse Aenean, 2023–2024</dd>
        <dd>Pellentesque Habitant 'Morbi Tristique Senectus', 2024</dd>
        <dt>Awards</dt>
        <dd>Volutpat Ultricies Curabitur Fringilla Ornare (since 2020)</dd>
      </dl>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Rails — four columns of project tiles</h3>
  <div class="rails rails-4" style="margin-top: var(--sp-3); border-top: var(--rule); padding-top: var(--sp-4)">
    <div>
      <div class="meta">A1 / 2024</div>
      <div style="aspect-ratio: 4/5; background: linear-gradient(135deg, var(--swatch-2), var(--swatch-5)); margin: var(--sp-2) 0"></div>
      <h5 style="font-family: var(--font-display); font-size: var(--fs-4); text-transform: none; letter-spacing: 0">Phantomas</h5>
      <p class="small">Editions de la revue Phantomas, Bruxelles, 1962. Belgian literary magazine.</p>
      <a class="link-bracket" href="#">View..</a>
    </div>
    <div>
      <div class="meta">B1 / 2025</div>
      <div style="aspect-ratio: 4/5; background: linear-gradient(225deg, var(--accent), var(--swatch-4)); margin: var(--sp-2) 0"></div>
      <h5 style="font-family: var(--font-display); font-size: var(--fs-4); text-transform: none; letter-spacing: 0">Nepal, 1975</h5>
      <p class="small">Hamish Fulton, exhibition catalog. Van Abbemuseum, Eindhoven, 1977.</p>
      <a class="link-bracket" href="#">View..</a>
    </div>
    <div>
      <div class="meta">C1 / 2025</div>
      <div style="aspect-ratio: 4/5; background: linear-gradient(45deg, var(--swatch-3), var(--swatch-6)); margin: var(--sp-2) 0"></div>
      <h5 style="font-family: var(--font-display); font-size: var(--fs-4); text-transform: none; letter-spacing: 0">A Walk in England</h5>
      <p class="small">A thousand hours, a thousand miles. 1974.</p>
      <a class="link-bracket" href="#">View..</a>
    </div>
    <div>
      <div class="meta">D1 / 2026</div>
      <div style="aspect-ratio: 4/5; background: linear-gradient(315deg, var(--swatch-2), var(--accent)); margin: var(--sp-2) 0"></div>
      <h5 style="font-family: var(--font-display); font-size: var(--fs-4); text-transform: none; letter-spacing: 0">Vercors, France</h5>
      <p class="small">A ten day circular walk, December full moon, 1995.</p>
      <a class="link-bracket" href="#">View..</a>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Auto-fill grid — <code>.grid</code></h3>
  <p class="muted">Item-driven: tiles wrap based on a minimum width (18rem default). No breakpoints needed; just <code>minmax(min(100%, 18rem), 1fr)</code> doing the work.</p>
  <div class="grid">
    <a class="card" href="#">
      <div class="card-thumb"></div>
      <div class="card-title">Adventures C-A-N</div>
      <div class="card-meta">2026 · Field notes</div>
    </a>
    <a class="card" href="#">
      <div class="card-thumb"></div>
      <div class="card-title">Brain Methods</div>
      <div class="card-meta">2026 · Concepts</div>
    </a>
    <a class="card" href="#">
      <div class="card-thumb"></div>
      <div class="card-title">Clouds in SE</div>
      <div class="card-meta">2025 · Photo</div>
    </a>
    <a class="card" href="#">
      <div class="card-thumb"></div>
      <div class="card-title">Coffee We Like</div>
      <div class="card-meta">2025 · List</div>
    </a>
  </div>
</section>

<section class="section" id="splits">
  <h2>Splits & features</h2>
  <p class="muted">Asymmetric layouts for sidebars, captions, and editorial features. All collapse to a single column at 800px.</p>

  <h3 style="margin-top: var(--sp-5)">Split — sidebar / main (<code>1fr 2fr</code>)</h3>
  <div class="split">
    <aside class="stack-tight">
      <div class="meta">On this page</div>
      <a href="#" style="display:block">Introduction</a>
      <a href="#" style="display:block">Methods</a>
      <a href="#" style="display:block">Findings</a>
      <a href="#" style="display:block">Footnotes</a>
      <hr>
      <div class="meta">Tags</div>
      <div class="cluster">
        <a class="tag" href="#">essay</a>
        <a class="tag" href="#">memex</a>
      </div>
    </aside>
    <article>
      <h3 style="margin-top:0">An entry, with sidebar</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porta ex a porta blandit. Suspendisse feugiat justo at mauris molestie molestie. Ut mattis urna sed sem pulvinar, vitae rutrum nulla ultrices.</p>
      <p>Curabitur laoreet erat et sapien venenatis luctus. Nullam mollis turpis nec varius scelerisque, est est ornare enim, sit amet facilisis ante metus posuere sapien.</p>
    </article>
  </div>

  <h3 style="margin-top: var(--sp-5)">Feature — image / text</h3>
  <div class="feature">
    <div class="feature-media" style="background: linear-gradient(135deg, var(--swatch-3), var(--swatch-5))"></div>
    <div>
      <div class="meta">Field notes · 2026</div>
      <h3 style="margin: var(--sp-2) 0">A walk in England, 1974</h3>
      <p>A thousand hours, a thousand miles. Editorial feature pattern — image left at 5 columns, text right at 7. Reverses with <code>.feature--reverse</code> and stacks at narrow widths.</p>
      <a class="link-arrow" href="#">Continue reading</a>
    </div>
  </div>

  <div class="feature feature--reverse">
    <div class="feature-media" style="background: linear-gradient(225deg, var(--accent), var(--swatch-4))"></div>
    <div>
      <div class="meta">Garden · 2025</div>
      <h3 style="margin: var(--sp-2) 0">Reverse direction</h3>
      <p>Same primitive, swapped order. On mobile both stack media-first; the order swap only applies on desktop.</p>
      <a class="link-arrow" href="#">Continue reading</a>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Long-form columns — <code>.text-cols</code></h3>
  <p class="muted">CSS multi-column text flow for editorial. Drops to single column when the container narrows past <code>2 × 18rem</code>.</p>
  <div class="text-cols" style="margin-top: var(--sp-3)">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porta ex a porta blandit. Suspendisse feugiat justo at mauris molestie molestie. Ut mattis urna sed sem pulvinar, vitae rutrum nulla ultrices. Curabitur laoreet erat et sapien venenatis luctus.</p>
    <p>Nullam mollis, turpis nec varius scelerisque, est est ornare enim, sit amet facilisis ante metus posuere sapien. Curabitur nec sapien molestie, facilisis lacus eget, egestas nunc. Vivamus mattis metus placerat vehicula ultricies.</p>
    <p>Vivamus nec nisi lacus. Ut id egestas sem, sit amet cursus turpis. Sed sed congue nulla. Phasellus rhoncus tempor volutpat. Suspendisse interdum varius ante non fringilla. In et ligula lectus.</p>
    <p>Ut egestas tortor odio, id sodales arcu hendrerit vel. Proin rhoncus tortor nec commodo lacinia. Sed orci dolor, suscipit vitae ipsum eget, tempus pharetra metus. Aliquam non dolor quis odio rutrum pretium quis at neque.</p>
  </div>

  <h3 style="margin-top: var(--sp-5)">Spanning items — <code>.span-2</code> / <code>.span-all</code></h3>
  <p class="muted">Inside a fixed-column grid, children can span multiple tracks. They collapse with the grid.</p>
  <div class="cols cols-3" style="margin-top: var(--sp-3)">
    <div class="card--boxed span-2"><div class="meta">Featured</div><h4 style="margin: var(--sp-2) 0">Two-column hero</h4><p>This card spans two of the three columns at desktop, drops to span-2 of 2 (full width) at tablet, and stacks at mobile.</p></div>
    <div class="card--boxed"><div class="meta">Note</div><h4 style="margin: var(--sp-2) 0">Single</h4><p>Fills the third column.</p></div>
    <div class="card--boxed"><div class="meta">Note</div><h4 style="margin: var(--sp-2) 0">Single</h4><p>Standard column item.</p></div>
    <div class="card--boxed"><div class="meta">Note</div><h4 style="margin: var(--sp-2) 0">Single</h4><p>Standard column item.</p></div>
    <div class="card--boxed span-all" style="background: var(--buffer)"><div class="meta">Announcement</div><h4 style="margin: var(--sp-2) 0">Full-width row</h4><p>Spans all tracks at every breakpoint.</p></div>
  </div>
</section>

<section class="section" id="components">
  <h2>Components</h2>

  <div class="row">
    <div class="label">Buttons</div>
    <div class="cluster">
      <a class="btn" href="#">Default</a>
      <a class="btn btn--accent" href="#">Accent</a>
      <button class="btn">Native button</button>
      <a class="link-bracket" href="#">More..</a>
      <a class="link-arrow" href="#">Read on</a>
    </div>
  </div>

  <div class="row">
    <div class="label">Tags</div>
    <div class="cluster">
      <a class="tag" href="#">essay</a>
      <a class="tag" href="#">field-notes</a>
      <a class="tag" href="#">octothorpe</a>
      <a class="tag tag--accent" href="#">featured</a>
      <a class="tag" href="#">draft</a>
    </div>
  </div>

  <div class="row">
    <div class="label">Description list</div>
    <div>
      <dl>
        <dt>Foreground</dt>
        <dd><code>--fg</code> — base ink color, alpha-stepped into 6 swatches</dd>
        <dt>Background</dt>
        <dd><code>--bg</code> — base paper color</dd>
        <dt>Accent</dt>
        <dd><code>--accent</code> — single hue used for hover, selection, and emphasis</dd>
      </dl>
    </div>
  </div>

  <div class="row">
    <div class="label">Code</div>
    <div>
<pre><code>:root {
  --fg: #111;
  --bg: #fff;
  --accent: #d31138;
}
[data-theme="dark"] {
  --fg: #f0f0f0;
  --bg: #111;
}</code></pre>
    </div>
  </div>

  <div class="row">
    <div class="label">Table</div>
    <div>
      <table>
        <thead><tr><th>Token</th><th>Value</th><th>Use</th></tr></thead>
        <tbody>
          <tr><td><code>--fs-3</code></td><td>1rem</td><td>Body</td></tr>
          <tr><td><code>--fs-5</code></td><td>1.6rem</td><td>H3</td></tr>
          <tr><td><code>--fs-7</code></td><td>3.25rem</td><td>Display</td></tr>
        </tbody>
      </table>
    </div>
  </div>
</section>

<section class="section" id="blocks">
  <h2>Blocks</h2>
  <p class="muted">Chunky offset-shadow buttons, ported from <a href="https://github.com/thesephist/blocks.css/">thesephist/blocks.css</a>. Wired to theme tokens — they re-tint with the active theme. Hover to nudge, click to press.</p>

  <div class="row">
    <div class="label">Default + accent</div>
    <div class="cluster">
      <a class="block" href="#">Default block</a>
      <a class="block block--accent" href="#">Accent block</a>
      <button class="block">Native button</button>
    </div>
  </div>

  <div class="row">
    <div class="label">Round</div>
    <div class="cluster">
      <a class="block block--round" href="#">Round block</a>
      <a class="block block--round block--accent" href="#">Round accent</a>
    </div>
  </div>

  <div class="row">
    <div class="label">Inline</div>
    <div>
      <p>Body text with an <a class="block block--inline" href="#">inline</a> block embedded — sits in flow at <code>0.75em</code> with tighter padding. Useful for <a class="block block--inline block--accent" href="#">accent calls</a> mid-paragraph.</p>
    </div>
  </div>

  <div class="row">
    <div class="label">Fixed (display)</div>
    <div class="cluster">
      <span class="block block--fixed">Status</span>
      <span class="block block--fixed block--accent">Featured</span>
      <span class="block block--fixed block--round">v1.0</span>
    </div>
  </div>
</section>

<section class="section" id="themes">
  <h2>Themes</h2>
  <p class="muted">Themes set only <code>--fg</code>, <code>--bg</code>, and <code>--accent</code>. Every other token is derived via <code>color-mix()</code>, so the entire UI re-tints from one pair. Click a swatch in the lower right; right-click anywhere on the switcher to roll a random theme.</p>

  <div class="grid grid--dense" style="margin-top: var(--sp-4)">
    <div class="fill-bg" style="aspect-ratio: 4/3; display:flex; flex-direction:column; justify-content:space-between; padding: var(--sp-3)">
      <span class="meta">Buffer</span>
      <span><code>--buffer</code></span>
    </div>
    <div class="invert" style="aspect-ratio: 4/3; display:flex; flex-direction:column; justify-content:space-between; padding: var(--sp-3)">
      <span class="meta">Invert</span>
      <span><code>--fg</code> / <code>--bg</code></span>
    </div>
    <div style="aspect-ratio: 4/3; display:flex; flex-direction:column; justify-content:space-between; padding: var(--sp-3); background: var(--accent); color: var(--bg)">
      <span class="meta" style="color:inherit">Accent</span>
      <span><code style="background:rgba(255,255,255,.2)">--accent</code></span>
    </div>
    <div style="aspect-ratio: 4/3; display:grid; grid-template-rows: repeat(6,1fr)">
      <div style="background:var(--swatch-1)"></div>
      <div style="background:var(--swatch-2)"></div>
      <div style="background:var(--swatch-3)"></div>
      <div style="background:var(--swatch-4)"></div>
      <div style="background:var(--swatch-5)"></div>
      <div style="background:var(--swatch-6)"></div>
    </div>
  </div>
</section>

<section class="section" id="memex">
  <h2>Memex primitives</h2>
  <p class="muted">Patterns specific to the memex templates: article + sidebar, backlinks, tag/category clouds, filter bars, the colophon footer, and the per-page accent override via <code>page.color</code>.</p>

  <h3 style="margin-top: var(--sp-5)">Article + sidebar (<code>note.html</code> / <code>page.html</code>)</h3>
  <div class="split split--wide">
    <article class="prose">
      <h1 style="margin-top: 0">Sample note title</h1>
      <p>The article body sits in a <code>.prose</code> container with a max width matched to <code>--col-wide</code>. Sidebar metadata floats alongside on screens ≥ 800px and stacks below on mobile.</p>
      <p>Links inherit color and hover wavy. <a href="#">An internal link</a> looks like this. The article assumes the page layout has set <code>--accent</code> from <code>page.color</code> when present.</p>
      <blockquote>Hairline rules separate sections instead of cards or boxes.</blockquote>
      <p>End of sample body.</p>
    </article>
    <aside class="side stack">
      <div>
        <h5>Categories</h5>
        <div class="cluster">
          <a class="btn" href="#">essays</a>
          <a class="btn" href="#">field-notes</a>
        </div>
      </div>
      <div>
        <h5>Tags</h5>
        <div class="cluster">
          <a class="tag" href="#">draft</a>
          <a class="tag" href="#">memex</a>
          <a class="tag" href="#">2026</a>
        </div>
      </div>
      <div>
        <h5>Octothorpes</h5>
        <div class="cluster">
          <octo-thorpe>memex</octo-thorpe>
          <octo-thorpe>lewk</octo-thorpe>
        </div>
      </div>
      <div>
        <h5>Links to this page</h5>
        <div class="backlinks">
          <div class="backlinks-item">
            <a href="#">Interdependence Day 2026</a>
            <p>An assortment of clearings, half-finished essays, and pinned notes on what to do next.</p>
          </div>
          <div class="backlinks-item">
            <a href="#">Brain crack, meth, and coffee</a>
            <p>On the productive uses of unfinished ideas.</p>
          </div>
        </div>
      </div>
      <div>
        <h5>Status</h5>
        <span class="status">Sprouting</span>
        <p class="meta" style="margin-top: var(--sp-2)">Last updated 2026-05-06</p>
      </div>
    </aside>
  </div>

  <h3 style="margin-top: var(--sp-5)">Filter bar + card grid (<code>tag.html</code> / <code>category.html</code>)</h3>
  <p class="muted">The filter bar pairs with <code>listfilter.html</code>'s JS; <code>aria-pressed="true"</code> lights the active button.</p>
  <div class="filter-bar">
    <button class="btn" aria-pressed="true">All</button>
    <button class="btn">essay</button>
    <button class="btn">field-notes</button>
    <button class="btn">draft</button>
    <button class="btn">2026</button>
  </div>
  <div class="cols cols-4">
    <a class="card card--row" href="#">
      <div class="card-thumb"></div>
      <div>
        <div class="card-meta">May 6, 2026</div>
        <div class="card-title">A sample note</div>
      </div>
    </a>
    <a class="card card--row" href="#">
      <div class="card-thumb"></div>
      <div>
        <div class="card-meta">Apr 18, 2026</div>
        <div class="card-title">Brain crack</div>
      </div>
    </a>
    <a class="card card--row" href="#">
      <div class="card-thumb"></div>
      <div>
        <div class="card-meta">Apr 04, 2026</div>
        <div class="card-title">Show and tell flyer</div>
      </div>
    </a>
    <a class="card card--row" href="#">
      <div class="card-thumb"></div>
      <div>
        <div class="card-meta">Mar 22, 2026</div>
        <div class="card-title">Interdependence day</div>
      </div>
    </a>
  </div>

  <h3 style="margin-top: var(--sp-5)">Hero (<code>home.html</code> featured album)</h3>
  <div class="hero" style="background-image: linear-gradient(135deg, var(--swatch-5), var(--buffer-strong))">
    <div class="hero-content">
      <div class="meta">Featured album</div>
      <h2 style="margin: var(--sp-2) 0">Some kind of cloud</h2>
      <p>A drifting set of images. The hero sits inside a section with no border, lets a background image bleed underneath, and the content overlays at the bottom.</p>
      <a class="btn btn--accent" href="#">View album</a>
    </div>
  </div>

  <h3 style="margin-top: var(--sp-5)">Tag / category cloud</h3>
  <p class="muted">Apply <code>.cloud-1</code> through <code>.cloud-5</code> per item to size by frequency.</p>
  <div class="cloud">
    <a href="#" class="cloud-1">apocrypha</a>
    <a href="#" class="cloud-2">essay</a>
    <a href="#" class="cloud-4">memex</a>
    <a href="#" class="cloud-1">draft</a>
    <a href="#" class="cloud-3">field-notes</a>
    <a href="#" class="cloud-5">octothorpe</a>
    <a href="#" class="cloud-2">lewk</a>
    <a href="#" class="cloud-1">stub</a>
    <a href="#" class="cloud-3">2026</a>
    <a href="#" class="cloud-2">notes</a>
  </div>

  <h3 style="margin-top: var(--sp-5)">Colophon (site footer with about + collections + tags)</h3>
  <p class="muted">Replaces the existing 3-column <code>footer.html</code>. The fixed bottom <code>.footer</code> stays for the running clock; the colophon is its own block above.</p>
  <div class="colophon">
    <section>
      <h5>About this site</h5>
      <p>Memex of Ním Daghlian. Notes, gardens, octothorpes, half-finished essays, and assorted clearings.</p>
      <a class="link-arrow" href="#">More about this site</a>
    </section>
    <section>
      <h5>Types of things</h5>
      <div class="cluster">
        <a class="btn" href="#">notes</a>
        <a class="btn" href="#">galleries</a>
        <a class="btn" href="#">media</a>
        <a class="btn" href="#">words</a>
      </div>
      <h5 style="margin-top: var(--sp-4)">Categories</h5>
      <div class="cloud">
        <a href="#" class="cloud-2">apocrypha</a>
        <a href="#" class="cloud-1">tooling</a>
        <a href="#" class="cloud-3">memex</a>
        <a href="#" class="cloud-1">misc</a>
      </div>
    </section>
    <section>
      <h5>Tags on things</h5>
      <div class="cloud">
        <a href="#" class="cloud-1">apocrypha</a>
        <a href="#" class="cloud-2">essay</a>
        <a href="#" class="cloud-4">memex</a>
        <a href="#" class="cloud-1">draft</a>
        <a href="#" class="cloud-3">field-notes</a>
        <a href="#" class="cloud-5">octothorpe</a>
        <a href="#" class="cloud-2">lewk</a>
        <a href="#" class="cloud-1">stub</a>
        <a href="#" class="cloud-3">2026</a>
        <a href="#" class="cloud-2">notes</a>
        <a href="#" class="cloud-1">draft</a>
        <a href="#" class="cloud-2">writing</a>
      </div>
    </section>
  </div>
</section>

<section class="section">
  <div class="row">
    <div class="label">Status</div>
    <div>
      <p>MVP plus memex primitives — sidebar block, backlinks, filter bar, cloud, colophon, hero, status pill, octothorpe styling, and a per-page <code>--accent</code> hook from <code>page.color</code>.</p>
      <p class="muted">Next: port <code>note.html</code> and <code>page.html</code> first; they exercise every new primitive.</p>
    </div>
  </div>
</section>
