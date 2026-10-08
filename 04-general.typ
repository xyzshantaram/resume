#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *
#import "lib/facts.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 9pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Resume.pdf")

#contact(contact-items)

Engineer who works across hardware and software. I design and fabricate printed circuit boards, write
the firmware that runs on them, and specify the protocols they speak. I built the Rust runtime behind
them and the web product it powers. I have also taken a physical product to paying customers and built
every part of it. #years-in-production(cap: true) years of software engineering, most of it independent.

== Experience

#job("soapbox", bullets: ("canvases-general", "core", "grants", "devkit", "signing-four", "mastodon", "nostrify"))

#job("attention-button", bullets: ("whole-product-general", "dfm"))

#job("freelance", bullets: ("cgp", "fractional", "ready-cloud"))

#job("earlier-freelance")

== Hardware

PCB design+fabrication, firmware, and parametric CAD (OpenSCAD) work for various hardware projects.

#fact-list("hardware", ("signer-general", "cardea", "attention-board"))

== Agent and developer tooling

#fact-proj("thursday")
#fact-proj("aidos")
#fact-proj("tile-studio")
#fact-proj("dotfiles-ai")

== Selected open source

#fact-proj("campfire")
#fact-proj("omnilua")
#fact-proj("stupid-simple-kv")
#fact-proj("orange-ticket")
#fact-proj("writers-jam")
#fact-proj("etu")
#fact-proj("ink-editor")
#fact-proj("wizardkit")
#fact-proj("luacheck-ts")
#fact-proj("dsh-compaction-instant")

== Skills

#skills((
  ("Languages", [Rust, TypeScript, C, C++, Lua, Python, JavaScript]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), sandboxing and capability security, memory-safety debugging, garbage collector internals, Web Workers, language tooling]),
  ("Agents", [Harness design, tool and permission gating, evidence and audit models, MCP servers, plugin systems]),
  ("Protocols", [Nostr (NIP-01, 05, 07, 19, 44, 46, 55, 98). Authored NIP-LR. Bitcoin: PSBT, Taproot, BIP-375, `rust-bitcoin`. Blossom, nsite, ActivityPub]),
  ("Hardware", [PCB design in EasyEDA, schematic through layout and BOM. ESP32, ESP8266, STM32, SPI displays, LoRa radio, Web Serial, Web BLE. Parametric CAD in OpenSCAD, FDM process tuning, fixturing]),
  ("Web and ops", [Deno, Node, React, Vue, Svelte, Vite, CodeMirror, Postgres, SQLite, Linux, Docker, dokku, nginx. I run my own relays and services in production]),
))

== Education and speaking

#fact-edu()

#fact-proj("pideck")
#fact-talk("hackable")

== References

#refs
