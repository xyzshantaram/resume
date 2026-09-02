#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 8.2pt,
)

#show: airy

#contact((
  ("pin", "Bangalore, India · remote, any time zone", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("gitlab", "xyzshantaram", "https://gitlab.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

Protocol engineer, three years in the Nostr ecosystem. I design specifications and then build
the runtimes that implement them: a Lua tile runtime with a Rust and WebAssembly core, and Nostr
signers across browser, desktop, hardware, and LoRa radio. On the Bitcoin side that means PSBT
and Taproot signing, BIP-375 silent payments, and split-secret key issuance.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox",
  location: "Remote",
  dates: "Apr 2024 — Present",
)
- #link("https://soapbox-pub.gitlab.io/nostr-canvas")[*nostr-canvas*] lets any compatible client run third-party mini-apps with no client-side code
  change. Tiles are sandboxed Lua programs published as kind-30207 Nostr events, and the same
  tile renders in three independent clients that share no UI code. I owned the runtime, the
  specification, and the Rust core.
- The specification is one NIP plus 26 TIPs, each with an explicit `requires` dependency graph
  and one of three conformance levels, so a client can state exactly what it supports and a tile
  can query that at runtime.
- The core is a 19k-line Rust crate compiled to WebAssembly, wrapped in a TypeScript embedding
  layer and React components (26k lines) that hosts drop into their own apps. Every tile gets an
  isolated Lua engine and no DOM access, so one tile cannot crash another or reach the host.
- Capability grants (`publish-event`, `nip44-encrypt`, `fetch`, `bitcoin-sign-psbt`) are declared
  on the tile event and gate every privileged call. Enforcement lives in Rust rather than host
  JavaScript, so a revoked grant takes effect inside the running worker.
- #link("https://gitlab.com/soapbox-pub/soapbox-signer")[*soapbox-signer*], a NIP-07 browser signer with per-site permissions and PSBT signing for
  Bitcoin and Taproot, including BIP-375 silent payments, exposed through `window.nostr.signPsbt`.
- #link("https://gitlab.com/soapbox-pub/systray-signer")[*traystr*], a Rust NIP-46 bunker for Linux. The key stays in the OS keyring and every signing
  request goes through a desktop approval dialog.
- An #link("https://gitlab.com/soapbox-pub/hardware-signer")[*ESP32 hardware signer*] moves the same protocol onto a device: NIP-46 over `bunker://`, SPI
  display, multi-relay reconnection, and on-device Lua scripting. I designed and fabricated the
  board, with physical confirm and cancel buttons so each signature is approved on the device.
- *cardea*, a Trezor Model 1 recreation on USB-C that I designed and fabricated: STM32F205, OLED,
  and a two-button interface.
- #link("https://gitlab.com/soapbox-pub/nostr-lora")[*NIP-LR*] carries Nostr events over LoRa mesh radio. I wrote the specification and the reference
  implementation, covering chunking, reassembly, and retransmission.
- Built the tile-authoring agent in #link("https://gitlab.com/soapbox-pub/tile-studio")[*tile-studio*], a browser IDE for vibecoding tiles, then
  extracted it into the reusable *nostr-canvas devkit* and shipped it into *Ditto*.
- Contributed to #link("https://gitlab.com/soapbox-pub/nostrify")[*Nostrify*], the Nostr framework for Deno and the browser. I migrated its package
  graph off JSR onto npm so AI coding tools could resolve and build against it, and added a
  Postgres-backed relay store.

#work(
  title: "Founder",
  company: "The Attention Button",
  location: "Bangalore",
  dates: "2023 — Present",
)
- An IoT desk toy for people in long-distance relationships, taken from idea to shipped units:
  enclosure CAD, a board I designed and fabricated, firmware, backend, website, and packaging.
  Hardware, firmware, and design files are open source.

#work(
  title: "Freelance Software Engineer",
  company: "Fractional Finance · Ready Cloud Consulting · Common Ground Practice",
  location: "Remote",
  dates: "2019 — Present",
)
- *Fractional Finance (later Frabric)*: Vue front end and Ethereum integrations for a
  decentralised finance platform. Earlier: Angular components for enterprise clients at Ready
  Cloud, and a Payload CMS and Next.js site on Postgres for Common Ground Practice, sole engineer.

== Selected Protocol and Open-Source Work

#proj("nostr-canvas", [Tile runtime, 26-TIP specification, Rust and WebAssembly core.], url: "soapbox-pub.gitlab.io/nostr-canvas")
#proj("monorail + tile-studio", [A Nostr tile launcher with a decentralised mini-app marketplace, and a browser IDE for authoring tiles.], url: "gitlab.com/soapbox-pub/monorail")
#proj("orange-ticket", [Physical Bitcoin vouchers where no single party knows the key at issuance.], url: "github.com/xyzshantaram/orange-ticket")
#proj("campfire", [A reactive web framework with no build step, maintained since 2021 on npm and JSR.], url: "campfire.js.org")

== Skills

#skills((
  ("Protocols", [Nostr (NIP-01, 05, 07, 19, 44, 46, 55, 98). Authored NIP-LR and the 26 nostr-canvas TIPs. Blossom, nsite, ActivityPub.]),
  ("Bitcoin", [PSBT, Taproot, BIP-375 silent payments, `rust-bitcoin`, key derivation and split-secret schemes]),
  ("Languages", [TypeScript, Rust, Lua, C, C++, JavaScript, Python]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`), sandboxing and capability security, embedded ESP32, LoRa mesh, Web Serial, Web BLE]),
  ("Web", [Deno, Node, React, Vue, Svelte, CodeMirror, Postgres, SQLite]),
  ("Ops", [Linux, Docker, dokku, nginx. I run my own relays and services in production.]),
))

== Education and Speaking

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026. Live demo of three clients running the same Nostr-published plugins.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs
