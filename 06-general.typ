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

Engineer who takes a thing from nothing to shipped, across an unusually wide stack. I have designed
and fabricated printed circuit boards, written the firmware on them, specified the protocol they
speak, built the Rust runtime that enforces it, and shipped the web product on top. I have also
sold a physical product to strangers and handled everything that requires, down to the instruction
leaflet. Six years of contract work, most of it as the only engineer on the problem.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox",
  location: "Remote",
  dates: "Apr 2024 — Present",
)
- *#link("https://soapbox-pub.gitlab.io/nostr-canvas")[nostr-canvas]* lets any compatible client run third-party mini-apps with no client-side
  code change. Plugins are sandboxed Lua programs published as Nostr events, and the same plugin
  renders in three independent clients that share no UI code. I own the runtime, the specification,
  and the Rust core.
- The core is a *19k-line Rust crate* compiled to WebAssembly through `wasm-bindgen` and `tsify`,
  behind a TypeScript embedding layer and React components (26k lines) that hosts drop into their
  own applications. Every plugin gets an isolated Lua engine and no DOM access, so one plugin
  cannot crash another or reach the host.
- *Capability grants* gate fetch, event publishing, encryption, and Bitcoin signing. Enforcement
  lives in Rust rather than host JavaScript, so revoking a grant takes effect inside the running
  worker. The specification is one NIP plus *26 numbered Tile Improvement Proposals* with an
  explicit dependency graph and three conformance levels.
- Built the plugin-authoring agent inside *#link("https://gitlab.com/soapbox-pub/tile-studio")[tile-studio]*, a browser IDE, then extracted it into a
  reusable devkit and shipped it into *Ditto*, a separate production client. Its `edit-code` tool
  addresses lines by *content hash* rather than line number, so a stale model reference fails
  loudly instead of silently corrupting a file.
- Signing, across four surfaces: a *#link("https://gitlab.com/soapbox-pub/soapbox-signer")[browser extension]* with per-site permissions and PSBT,
  Taproot, and BIP-375 silent payments; *#link("https://gitlab.com/soapbox-pub/systray-signer")[traystr]*, a Rust desktop daemon keeping the key in the
  OS keyring; an *#link("https://gitlab.com/soapbox-pub/hardware-signer")[ESP32 hardware signer]* I designed the board and firmware for; and
  *#link("https://gitlab.com/soapbox-pub/nostr-lora")[NIP-LR]*, a specification and reference implementation carrying events over LoRa mesh radio.
- Worked deeply on the Mastodon API implementation in *#link("https://gitlab.com/soapbox-pub/ditto-v1")[Ditto v1]*, a Hono server that speaks the
  Mastodon client API so existing apps work against it unchanged. Ditto v2 is a React and TypeScript
  single-page application.
- Contributed to *#link("https://gitlab.com/soapbox-pub/nostrify")[Nostrify]*, a TypeScript framework other teams ship on. I wrote its Postgres
  storage layer: protocol filters compiled to Kysely queries over a `jsonb`-indexed schema, with
  migrations, a benchmark suite, and 1.1k lines of tests. I also migrated the package graph off JSR
  onto npm so AI coding tools could resolve and build against it, and made typecheck a required CI
  stage.

#work(
  title: "Founder and sole engineer",
  company: "The Attention Button — an IoT desk toy, designed and sold",
  location: "Bangalore",
  dates: "2023 — Present",
)
- One person, whole product: parametric OpenSCAD enclosure, a *#link("https://github.com/theattentionbutton")[board I designed and
  fabricated]*, the ESP8266 firmware, a backend service, the website, an illustrated instruction
  leaflet, and a packaging-layout generator. Sold to paying customers, open-sourced.
- *Design for manufacture.* Iterated the chassis across roughly 55 STL revisions, built a dedicated
  assembly jig for seating the rotary encoder repeatably, ran print-parameter studies for layer
  height and surface finish, and produced batch plates for the production run.
- Built my own *CH340G USB programmer* to flash units during assembly. Its header mates with one I
  put on the product board.

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

Five printed circuit boards, designed and fabricated, schematic capture through layout and BOM.

- *#link("https://gitlab.com/soapbox-pub/hardware-signer")[Soapbox hardware signer]* — ESP32-WROVER-E with a 2.4-inch ILI9341 TFT and a six-button
  pad with physical confirm and cancel, so each signature is approved on the device. I wrote its
  firmware as well.
- *cardea* — a Trezor Model 1 recreation moved to USB-C, built on the STM32F205 with an SSD1306
  OLED, a two-button interface, and ESD and overcurrent protection on the USB input.
- *#link("https://github.com/theattentionbutton")[The Attention Button]* — the board inside the product above: ESP-12F, a rotary encoder,
  a MAX7219 LED matrix, and a buzzer. 0805 passives chosen for hand assembly in small batches.
- *#link("https://shantaram.xyz/misc/rev3_slides_final.pdf")[pideck]* — a handheld modular computer, my final-year project. A carrier board integrating
  a Raspberry Pi Zero W, a 3.5-inch LCD, a matrix keypad, and boost and audio stages, with custom
  footprints drawn for each module. I wrote the keyboard matrix driver in C against the Linux 6.1
  kernel, plus the #link("https://github.com/xyzshantaram/pideck-launcher")[launcher]. Full BOM and cost analysis, itemised to the resistor. Three
  working units.
- *CH340G USB programmer* — production tooling I built to flash Attention Button units during
  assembly. Its header mates with one I put on the product board. Single-sided assembly.

== Agent and developer tooling

#proj("aidos", [A coding-agent harness with enforced gates. Tickets cannot leave verification without human evidence, and the harness stamps evidence authorship from the entry point so an agent cannot forge a human sign-off.], url: "github.com/xyzshantaram/aidos")
#proj("dotfiles-ai", [A complete agent-workstation configuration: plugins, skills, presets, and guard rules from one repository. Plus upstream fixes to DeepSeek Harness itself.], url: "github.com/xyzshantaram/dotfiles-ai")
#proj("js-dev-mcp", [A Model Context Protocol server exposing shell and text-editor tools, built as a drop-in replacement for Goose's built-in developer MCP.], url: "gitlab.com/soapbox-pub/js-dev-mcp")
#proj("crazy-wall", [A spatial interface for language models: answers render as typed widget nodes on an infinite canvas graph, not a linear chat log.], url: "github.com/xyzshantaram/crazy-wall")

== Selected open source

#proj("campfire", [My own reactive web framework: chainable DOM builder, reactive stores, no build step, no virtual DOM. Maintained since 2021 on npm and JSR, with a docs site.], url: "campfire.js.org")
#proj("omnilua", [Found and fixed a garbage-collector memory leak in a pure-Rust Lua interpreter: allocations made with no active heap guard were linked onto no owner list, so nothing ever freed them. Roughly 29KB lost per VM. Fix landed upstream.], url: "github.com/ianm199/omnilua/issues/249")
#proj("tetron", [2D ECS game engine in Rust with Rune scripting and overlayfs-based modding, so a game loads loose files in development and a zip in release.], url: "github.com/xyzshantaram/tetron")
#proj("stupid-simple-kv", [Key-value crate with order-preserving binary tuple keys, pluggable memory and SQLite backends, and generic serde values.], url: "github.com/xyzshantaram/stupid-simple-kv")
#proj("orange-ticket", [Physical Bitcoin vouchers where no single party knows the key at issuance.], url: "github.com/xyzshantaram/orange-ticket")
#proj("writers-jam", [A weekly writing exercise and an anti-social network. Deno service, running in production: *361 posts and 102,302 views* to date.], url: "writersjam.shantaram.xyz")
#proj("etu", [A time-clock and invoicing CLI for freelancers, in Deno and compiled to a single binary. Invoices render through Typst templates fed a JSON context. I have billed my own contract work with it daily since 2024.], url: "github.com/xyzshantaram/etu")
#proj("ink-editor", [WYSIWYG markdown editor on CodeMirror 6, with vertical and horizontal modes.], url: "github.com/xyzshantaram/ink-editor")
#proj("kysely-kv, kysely-deno-sqlite, xjsr", [Small published packages filling real gaps: a Deno.Kv-compatible adapter over any Kysely backend, a SQLite dialect, and a runner for JSR packages via npx.], url: "gitlab.com/soapbox-pub/kysely-kv")

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

#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026. Live demo of three clients running the same Nostr-published plugins, on making software extensible enough that a model can write a working plugin.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs-stacked
