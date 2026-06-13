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
  (5+ creators) of people building websites with the model, in several of which
  the model's design reasoning appears on screen verbatim — including
  self-critique, contrast measurements, and exact color values. Across ~15
  distinct sites observed this way, several patterns recur independently of any
  single creator: the **clean display + one-word serif-italic emphasis**
  headline; **full-bleed moody-photography heros** with near-white type
  (cinematic register); a **starburst/asterisk** brand glyph; **mono coordinate
  / specimen labels**; **subtle scroll parallax + line-draw animations**; and
  **brand-adaptive single accents** (green/teal/blue/terracotta/navy-orange),
  the constant being "one accent + restraint," not a fixed hue. Cross-creator
  repetition is what raised these from "one demo" to "signal."

The two streams independently agree on the core signals (editorial type pairings,
measured/value-separated color, vision-based self-correction against a live
browser, restraint on "AI sparkle"), which is what raised confidence enough to
publish.

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
