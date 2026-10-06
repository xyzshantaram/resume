#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 9pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Resume.pdf")

#contact((
  ("pin", "Bangalore, India · remote, any time zone", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("gitlab", "xyzshantaram", "https://gitlab.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

Engineer who works across hardware and software. I design and fabricate printed circuit boards, write
the firmware that runs on them, and specify the protocols they speak. I built the Rust runtime behind
them and the web product it powers. I have also taken a physical product to paying customers and built
every part of it. Six years of software engineering, most of it independent.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox",
  location: "Remote",
  dates: "Apr 2024 — Present",
)
- *#link("https://github.com/xyzshantaram/nostr-canvas")[nostr-canvas]* lets any compatible client run third-party mini-apps with no client-side
  code change. Plugins are sandboxed Lua programs published as Nostr events, and the same plugin
  renders in three independent clients that share no UI code. I wrote the runtime, the plugin
  specification, and the Rust core.
- The core is a *19k-line Rust crate* compiled to WebAssembly through `wasm-bindgen` and `tsify`,
  behind a TypeScript embedding layer and React components (26k lines) that hosts drop into their
  own applications. Every plugin gets an isolated Lua engine and no DOM access, so one plugin
  cannot crash another or reach the host.
- *Capability grants* gate fetch, event publishing, encryption, and Bitcoin signing. Rust enforces
  them, out of reach of the host's JavaScript, so revoking a grant takes effect inside the running
  worker. The specification is one NIP plus *26 numbered Tile Improvement Proposals* with an
  explicit dependency graph and three conformance levels.
- Extracted the plugin-authoring agent into a reusable *nostr-canvas devkit* and integrated it into
  *Ditto*, a separate production client. Its `edit-code` tool addresses lines by *content hash* to
  keep edits token-efficient.
- Signing, across four surfaces: a *#link("https://github.com/xyzshantaram/soapbox-signer")[browser extension]* with per-site permissions and PSBT,
  Taproot, and BIP-375 silent payments; *#link("https://github.com/xyzshantaram/systray-signer")[traystr]*, a Rust desktop daemon keeping the key in the
  OS keyring; an *#link("https://github.com/xyzshantaram/hardware-signer")[ESP32 hardware signer]* I designed the board and firmware for; and
  *#link("https://github.com/xyzshantaram/nostr-lora")[NIP-LR]*, a specification and reference implementation carrying events over LoRa mesh radio.
- Worked deeply on the Mastodon API implementation in *#link("https://github.com/xyzshantaram/ditto-v1")[Ditto v1]*, a Hono server that speaks the
  Mastodon client API so existing apps work against it unchanged. Ditto v2 is a React and TypeScript
  single-page application.
- Contributed to *#link("https://github.com/xyzshantaram/nostrify")[Nostrify]*, a core framework in Soapbox's Nostr tooling. I wrote its initial
  Postgres storage layer: protocol filters compiled to Kysely queries over a `jsonb`-indexed schema, with
  migrations, a benchmark suite, and 1.1k lines of tests. I also migrated the package graph off JSR
  onto npm so AI coding tools could resolve and build, and set up typechecking in CI.

#work(
  title: "Founder and sole engineer",
  company: "The Attention Button — an IoT desk toy, designed and sold",
  location: "Bangalore",
  dates: "2023 — Present",
)
- One person, whole product: parametric OpenSCAD enclosure, a *#link("https://github.com/theattentionbutton")[board I designed and
  fabricated]*, the ESP8266 firmware, a backend service, the website, an illustrated instruction
  leaflet, and a packaging-layout generator. Sold to paying customers, with the design files open.
- *Design for manufacture.* Iterated the chassis across 55 STL revisions, built an assembly jig for
  seating the rotary encoder repeatably, ran print-parameter studies for layer height and surface
  finish, and produced batch plates for the production run.

#work(
  title: "Freelance Software Engineer",
  company: "Fractional Finance · Ready Cloud Consulting · Common Ground Practice",
  location: "Remote",
  dates: "2019 — Present",
)
- *Common Ground Practice*: the full content site on Payload CMS and Next.js with Postgres and
  Docker Compose, including the admin model and the deploy path. Sole engineer.
- *Fractional Finance (later Frabric)*: Vue front end and Ethereum integrations for a decentralised
  finance platform.
- *Ready Cloud Consulting*: Angular front-end components for enterprise clients.

== Hardware

PCB design+fabrication, firmware, and parametric CAD (OpenSCAD) work for various hardware projects.

- *#link("https://github.com/xyzshantaram/hardware-signer")[Soapbox hardware signer]* — ESP32-WROVER-E with a 2.4-inch ILI9341/ST7789 TFT and a six-button
  pad with physical confirm and cancel, so each signature is approved on the device. I wrote its
  firmware as well.
- *cardea* — a Trezor Model 1 recreation moved to USB-C, built on the STM32F205 with an SSD1306
  OLED, a two-button interface, and ESD and overcurrent protection on the USB input.
- *#link("https://github.com/theattentionbutton")[The Attention Button]* — the board inside the product above: ESP-12F, a rotary encoder,
  a MAX7219 LED matrix, and a buzzer. 0805 passives chosen for hand assembly in small batches.

== Agent and developer tooling

#proj("Thursday", [A work in progress: a coding-agent harness that folds aidos and dotfiles-ai into a single product of their own — aidos contributing the enforcement and evidence model, dotfiles-ai the observability and cheaper-workflow plugins.])
#proj("aidos", [A coding-agent harness with enforced gates. Tickets cannot leave verification without human evidence, and the harness stamps evidence authorship from the entry point so an agent cannot forge a human sign-off. Human and agent share one board, and every action a person takes on it reaches the agent as structured data.], url: "github.com/xyzshantaram/aidos")
#proj("tile-studio", [A browser IDE for authoring plugins, built on the nostr-canvas devkit: a chat pane, a live sandboxed preview, and a publish pipeline.], url: "github.com/xyzshantaram/tile-studio")
#proj("dotfiles-ai", [A set of experiments in agent observability and cheaper workflows, shipped as DeepSeek Harness plugins: a bash guard that rewrites a wrong call, a graph of each command chain and its exit codes, inline actions on tool calls, per-role model fallbacks, a unified subscription view, and more.], url: "github.com/xyzshantaram/dotfiles-ai")
#proj("crazy-wall", [A spatial LLM interface: answers render as typed widgets on an infinite canvas.], url: "github.com/xyzshantaram/crazy-wall")

== Selected open source

#proj("campfire", [A reactive web framework: chainable DOM builder, reactive stores, no build step, no virtual DOM. Maintained since 2021 on npm and JSR, with a docs site.], url: "campfire.js.org")
#proj("omnilua", [Found and fixed a garbage-collector memory leak in a pure-Rust Lua interpreter: allocations made with no active heap guard were linked onto no owner list, so nothing ever freed them. Roughly 29KB lost per VM. Fix merged upstream.], url: "github.com/ianm199/omnilua/issues/249")
#proj("stupid-simple-kv", [Key-value crate with order-preserving binary tuple keys, pluggable memory and SQLite backends, and generic serde values.], url: "github.com/xyzshantaram/stupid-simple-kv")
#proj("orange-ticket", [Physical Bitcoin vouchers where no single party knows the key at issuance.], url: "github.com/xyzshantaram/orange-ticket")
#proj("writers-jam", [A weekly writing exercise and anti-social network. Deno service, running in production: *361 posts and 102,302 views* to date.], url: "writersjam.shantaram.xyz")
#proj("etu", [A time-clock and invoicing CLI for freelancers, in Deno and compiled to a single binary. Invoices render through Typst templates fed a JSON context. I have billed my own contract work with it daily since 2024.], url: "github.com/xyzshantaram/etu")
#proj("ink-editor", [WYSIWYG markdown editor on CodeMirror 6, with vertical and horizontal modes.], url: "github.com/xyzshantaram/ink-editor")
#proj("wizardkit", [Build a step-by-step wizard as a Deno script, served as HTML over HTTP so the same script runs in a browser or a desktop window.], url: "jsr.io/@xyzshantaram/wizardkit")
#proj("luacheck-ts", [Ported a 22k-line Lua static analyzer to TypeScript for the browser, Deno, and Node.], url: "jsr.io/@xyzshantaram/luacheck-ts")
#proj("dsh-compaction-instant", [Deterministic context compaction for coding agents: it compresses history in milliseconds with no model call and keeps the original tokens, never replacing them with a summary. I fixed checkpoints consuming each other and added per-tool retention.], url: "github.com/xyzshantaram/dsh-compaction-instant")

== Skills

#skills((
  ("Languages", [Rust, TypeScript, C, C++, Lua, Python, JavaScript]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), sandboxing and capability security, memory-safety debugging, garbage collector internals, Web Workers, language tooling]),
  ("Agents", [Harness design, tool and permission gating, evidence and audit models, MCP servers, plugin systems, prompt and skill authoring]),
  ("Protocols", [Nostr (NIP-01, 05, 07, 19, 44, 46, 55, 98). Authored NIP-LR and 26 Tile Improvement Proposals. Bitcoin: PSBT, Taproot, BIP-375, `rust-bitcoin`. Blossom, nsite, ActivityPub]),
  ("Hardware", [PCB design in EasyEDA, schematic through layout and BOM. ESP32, ESP8266, STM32, SPI displays, LoRa radio, Web Serial, Web BLE. Parametric CAD in OpenSCAD, FDM process tuning, fixturing]),
  ("Web and ops", [Deno, Node, React, Vue, Svelte, Vite, CodeMirror, Postgres, SQLite, Linux, Docker, dokku, nginx. I run my own relays and services in production]),
))

== Education and speaking

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

#proj("pideck", [Best Capstone project of 2024 in the Electrical and Electronics Engineering department at VIT Chennai. A handheld modular computer, my final-year project: a carrier board integrating a Raspberry Pi Zero W, a 3.5-inch LCD, a matrix keypad, and boost and audio stages, with custom footprints for each module. I wrote the keyboard matrix driver in C against Linux 6.1, plus the #link("https://github.com/xyzshantaram/pideck-launcher")[launcher]. Full BOM and cost analysis, itemised to the resistor. Three working units.], url: "shantaram.xyz/misc/rev3_slides_final.pdf")
#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026, on software that empowers users to extend it themselves, by building systems easy for both people and computers to understand.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs
