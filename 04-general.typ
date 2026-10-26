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

Engineer across hardware and software: PCB design and fabrication, firmware, the protocols they
speak, the Rust runtime behind them and the web product it powers. I have taken a physical product
to paying customers. Lately I build tailored software for people, enabled by AI; Thursday and AI
for All are the current experiments. #years-in-production(cap: true) years of software engineering,
most of it independent.

== AI systems and interface

#fact-proj("thursday")
#fact-proj("thursday-dsh")
#fact-proj("ai-for-all")
#fact-proj("tile-studio")

== Experience

#job("soapbox", bullets: ("runtime-detail", "captcha", "signing", "nostrify", "plugin-agent"))

#job("freelance", bullets: ("cgp", "fractional", "ready-cloud"))

#job("attention-button", bullets: ("product", "dfm"))

#job("earlier-freelance")

== Hardware

PCB design and fabrication, firmware, and parametric CAD (OpenSCAD) work for hardware projects.

#fact-list("hardware", ("signer-general", "cardea", "attention-board"))

== Selected open source

#fact-proj("dots")
#fact-proj("homepage")
#fact-proj("campfire")
#fact-proj("omnilua")
#fact-proj("luacheck-ts")
#fact-proj("writers-jam")
#fact-proj("etu")
#fact-proj("macrolight")
#fact-proj("dsh-compaction-instant")
#fact-proj("stupid-simple-kv")
#fact-proj("orange-ticket")

== Skills

#skills((
  ("Languages", [Rust, TypeScript, C, C++, Lua, Python, JavaScript]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), sandboxing and capability security, memory-safety debugging, garbage collector internals, Web Workers, language tooling]),
  ("Agents and interface", [Harness design, tool and permission gating, evidence and audit models, MCP servers, plugin systems, Quickshell and QML, canvas interaction]),
  ("Protocols", [Nostr (NIP-01, 05, 07, 19, 44, 46, 55, 98, and NIP-LR). Bitcoin: PSBT, Taproot, BIP-375, `rust-bitcoin`. Blossom, nsite, ActivityPub]),
  ("Hardware and ops", [PCB design in EasyEDA, schematic through layout and BOM. ESP32, ESP8266, STM32, SPI displays, LoRa, Web Serial and BLE. OpenSCAD, FDM process tuning, fixturing. Deno, Node, Bun, Postgres, SQLite, Linux, Docker, nginx, Just, self-hosted services]),
))

== Education and speaking

#fact-edu()

#fact-proj("pideck")
#fact-talk("hackable")

== References

#refs
