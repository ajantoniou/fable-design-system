# Evidence & provenance

This package is a **reconstruction of a design style**, not a recovered or
official spec. There is no published "Fable design system." What follows explains
how the persona was derived and — just as importantly — what its limits are, so
you can use it with clear eyes and correct it where it's wrong.

## How it was derived

The persona was reconstructed from **two independent streams of publicly- or
locally-observable evidence**, then cross-checked against each other:

- **Stream A — observed build output.** Real CSS/HTML produced by the `fable`
  coding model during UI work, plus the model's own stated design reasoning
  (its "thinking") where that was visible. The concrete values — type scales,
  color tokens, shadow strings, easings, radius scales — come from reading
  actual shipped markup, not from imagination.
- **Stream B — recorded build sessions.** Multiple publicly-posted videos
  (8+ creators) of people building websites with the model, in several of which
  the model's design reasoning appears on screen verbatim — including
  self-critique, contrast measurements, and exact color values. Across ~15
  distinct sites observed this way, several patterns recur independently of any
  single creator: the **clean display + one-word serif-italic emphasis**
  headline; **full-bleed moody-photography heros** with near-white type
  (cinematic register); a **starburst/asterisk** brand glyph; **mono coordinate
  / specimen labels**; **subtle scroll parallax + line-draw animations**; and
  **brand-adaptive single accents** (green/teal/blue/terracotta/navy-orange),
  the constant being "one accent + restraint," not a fixed hue. Cross-creator
  repetition is what raised these from "one demo" to "signal." Later sessions
  surfaced Fable's high-end *motion* stack verbatim on screen — **GSAP**
  (`gsap@^3.13.0`), scroll-progress lerping (factor `0.08`), `power1.out` /
  `power2.out` easings, paused split-text scroll reveals (with `aria-label`
  fallbacks), a cursor-spotlight radial-mask reveal, and `-mx*40/-my*40` mouse
  parallax — plus a premium **neon-on-near-black** palette (`#FF005E` on
  `#11010a`), **iridescent color-shifting** hero gradients, and AI-generated
  cinematic hero art (via an image MCP). These fed §4 (color) and §8 (animation).
  The most design-articulate sessions ("Claude Code Club" lessons) also stated
  Fable's *philosophy* verbatim: **one thesis line tested against every decision**,
  **structure-before-style on a single upgraded `index.html`**, *"a scene picks
  the colors, not the category,"* **OKLCH with no pure `#000`/`#fff`**, **Lenis**
  smooth-scroll wired to GSAP ScrollTrigger with a `.reveal` / `power3.out` /
  `top 85%` pattern, and motion that **serves a narrative, not decoration.**

- **Stream C — expert written reviews (checked, mostly thin).** Public reviews of
  Fable (Simon Willison, Anthropic's announcement, others) were read for design
  specifics. Finding worth recording: they focus on *functional* capability
  (benchmarks, vision-based rebuilding, long-horizon coding) and say little about
  *aesthetics*. The few principle-level takeaways used here: Fable "catches design
  holes a lesser model misses," needs far less nudging (reads intent), and
  **self-corrects with vision** against the goal. Conclusion: the concrete
  *aesthetic* evidence genuinely lives in the build videos (Stream B), not in
  written press.

- **Stream D — game / 3D-world art direction.** The standout primary source is the
  open-source **`Braffolk/fable5-world-demo`** ("LAAS") — a Fable-built 3D world
  whose README documents the art direction in unusual detail. Verified directly:
  the human brief set **a vision bar ("UE5-class reference frames"), hard floors,
  and banned outcomes — *"black shadows, cloned trees, fog as cover"* — and
  "deliberately does not say how to build any of it."** Fable then self-verified
  with **headless screenshots, pixel sampling, frame diffs vs. baselines, and a
  "no-black-shadows rule enforced by automated pixel sampling,"** building ~99%
  autonomously; humans judged only feel (wind sway, camera bob, cloud lag).
  Environment detail = **per-instance uniqueness ("no two trees share a mesh")**
  plus a cohesive lighting/atmosphere/wind/water stack. This fed §8b. Honest gaps:
  game UI/HUD is lightly documented; game **juice/feel** is thin and is Fable's
  weaker, least-autonomous axis. Source: github.com/Braffolk/fable5-world-demo.
- **No new web *token* specifics found.** A dedicated search for Fable-attributable
  web tokens (exact fonts/hex/easings/radii beyond what's already here) turned up
  **nothing** — reviews discuss *outcomes*, not values. The persona was *not*
  padded with invented numbers. (One disputed view worth noting: a skeptical
  designer called Fable's web output strong for "internal/enterprise tools" but
  argued it reads as "mechanical guideline-translation rather than original taste"
  for top-end brands — a fair caveat on the ceiling.)

The streams independently agree on the core signals (editorial type pairings,
measured/value-separated color, vision-based self-correction against a live
browser, restraint on decorative "AI sparkle"), which is what raised confidence
enough to publish.

## Representative reasoning (illustrative, paraphrased from observed output)

The model's design voice was distinctive in ways that shaped this persona:

- **Color by measurement, not vibes:** diagnosing that mid-tone backgrounds sat
  "too close in value" to the ink text, then re-separating the palette into
  clearly-light and clearly-dark surfaces — and *removing* a band-aid hack once
  the real cause was found.
- **Editorial typography:** a variable-width heavy display face + a serif italic
  counterpoint + a monospace for technical annotations, with monochrome imagery.
  Note: this is *observed*, not prescribed — the persona's type spec doesn't
  mandate any one serif, since the model's font choices varied by brand.
- **Live-DOM verification:** running the site locally, scrolling it, checking the
  console, and verifying lower sections in the real DOM before calling it done.
- **Small measured iteration:** nudging a hue step by step and re-measuring rather
  than guessing.

These behaviors are encoded as the *method* in
[`FABLE-DESIGN-PERSONA.md`](./FABLE-DESIGN-PERSONA.md) — they matter more than any
single token.

## Honest caveats — please read before treating values as canon

- The model's true internal "persona" is **unknowable**. This is reverse-
  engineered from outputs; treat it as a well-grounded approximation.
- **Specific token values (exact hexes, px, easings) are illustrative starting
  points, not constants.** They were observed in particular projects/demos and
  reflect those contexts. Adapt them to your brand.
- Some observed work *adapted an inherited house design system* rather than
  inventing one from scratch; the persona tries to separate the model's own taste
  from borrowed tokens, but the line isn't always perfectly clean.
- This package contains **no model weights, no proprietary prompts, and no
  provider material** — only original design guidance written from observed
  patterns.

## Not affiliated

This is an **independent, community project**. It is not affiliated with,
sponsored by, or endorsed by any model provider, and "Fable" here refers to the
observed design *style*, used descriptively. If you represent a rights-holder and
have concerns, open an issue and we'll address it promptly.
