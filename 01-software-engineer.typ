#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 8pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Software-Engineer.pdf")

#contact((
  ("pin", "Bangalore, India · remote, any time zone", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("gitlab", "xyzshantaram", "https://gitlab.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

Software engineer, six years in production, most of it as an independent contractor owning a
product end to end. I move into an unfamiliar stack quickly and work from research rather than
assumption, then build the systems and interfaces I can reason about — a Rust and WebAssembly
sandbox, the protocol runtime around it, a coding-agent harness, and the web apps on top.
What I care about is open-source software that is useful, fast, and correct — worth reaching for,
and simple enough that someone else can read and change it.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox",
  location: "Remote",
  dates: "Apr 2024 — Present",
)
- Owned a plugin runtime that runs third-party mini-apps in a client with no code change: a
  *19k-line Rust crate compiled to WebAssembly* behind a TypeScript embedding layer, consumed by
  three independent clients. I wrote the runtime, the specification, and the Rust core; each
  plugin gets an isolated Lua engine and no DOM access.
- Moved capability enforcement out of host JavaScript into Rust, so grants are clamped on every
  write and revoking one takes effect inside the running worker. *Implemented one signing
  protocol four ways* to prove it portable: a browser extension, a Rust desktop daemon, an ESP32
  device I designed the board and firmware for, and a transport over LoRa mesh radio.
- Built the plugin-authoring agent (*tile-studio*, then a reusable devkit in *Ditto*) whose
  `edit-code` tool addresses lines by *content hash*, so a stale reference fails loudly instead
  of silently corrupting a file. Contributed to *Nostrify*: migrated its package graph off JSR
  onto npm and wrote its initial Postgres store.

#work(
  title: "Founder and sole engineer",
  company: "The Attention Button — an IoT desk toy, designed and sold",
  location: "Bangalore",
  dates: "2023 — Present",
)
- One person, whole product: parametric CAD, a board I designed and fabricated, firmware, a
  backend service, the website, and packaging. Sold to paying customers, open-sourced.

#work(
  title: "Freelance Software Engineer",
  company: "Fractional Finance · Ready Cloud Consulting · Common Ground Practice",
  location: "Remote",
  dates: "2019 — Present",
)
- *Common Ground Practice*: a Payload CMS and Next.js site on Postgres, sole engineer.
  *Fractional Finance*: Vue and Ethereum integrations. *Ready Cloud*: Angular components.

== Agent and Tooling Work

#work(
  title: "thursday — an environment that gets more out of a cheap model",
  company: "Built on DeepSeek Harness · aidos and dotfiles-ai",
  location: "TypeScript",
  dates: "2026",
)
- #link("https://github.com/xyzshantaram/aidos")[*aidos*], its ticket kernel, moves verification into the execution model: only a human moves a
  ticket out of verification, evidence is a first-class row stamped with its author, and gates
  are predicates over evidence. An agent cannot forge a human sign-off or mark its own work done.
- *Turns model actions into computations wherever it can.* Instant compaction folds session
  history with no model call; a bash guard parses each command and rewrites a wrong call into the
  right one; a bash graph draws each command chain and its exit codes. #link("https://github.com/xyzshantaram/dotfiles-ai")[*dotfiles-ai*], the plugin
  bundle underneath, adds inline actions on tool calls, per-role model fallbacks, a unified
  subscription view, and more.

== Selected Work

#proj("nostr-canvas", [A sandboxed plugin runtime for third-party mini-apps: one NIP plus 26 proposals, a Rust and WebAssembly core, and three client integrations.], url: "soapbox-pub.gitlab.io/nostr-canvas")
#proj("campfire", [My own reactive web framework: chainable DOM builder, reactive stores, no build step, no virtual DOM. Maintained since 2021 on npm and JSR.], url: "campfire.js.org")
#proj("luacheck-ts", [A 22k-line Lua static analyzer ported to TypeScript for the browser, Deno, and Node.], url: "jsr.io/@xyzshantaram/luacheck-ts")
#proj("wizardkit", [Build a step-by-step wizard as a Deno script, served as HTML to a browser or desktop window.], url: "jsr.io/@xyzshantaram/wizardkit")

== Skills

#skills((
  ("Languages", [TypeScript, Rust, Lua, C, C++, Python, JavaScript]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), sandboxing and capability security, Web Workers, language tooling]),
  ("Agents", [Harness design, tool and permission gating, evidence and audit models, MCP servers, plugin systems, skill authoring]),
  ("Web and ops", [Deno, Node, React, Vue, Svelte, Postgres, SQLite, Linux, Docker, nginx. I run my own services in production.]),
))

== Education and Speaking

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026, on software that empowers users to extend it themselves, by building systems easy for both people and computers to understand.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs
