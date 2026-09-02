#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 7.8pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Rust-Systems-Engineer.pdf")

#contact((
  ("pin", "Bangalore, India · remote, any time zone", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("gitlab", "xyzshantaram", "https://gitlab.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

Systems engineer across Rust, WebAssembly, and embedded C. My work runs untrusted code safely in
a browser, guards private keys in an OS keyring, signs on a microcontroller, and carries protocol
traffic over LoRa radio. I have traced a memory leak into a Lua interpreter's garbage collector
and landed the fix upstream.

== Systems Work

#work(
  title: "nostr-canvas-core — sandboxed script runtime in Rust, shipped as WebAssembly",
  company: "Soapbox",
  location: "19k lines Rust",
  dates: "2026",
)
- The crate runs untrusted third-party Lua programs inside a browser Web Worker. It compiles to
  WebAssembly through `wasm-bindgen`, `serde-wasm-bindgen`, and `tsify`, and ships behind a
  TypeScript embedding layer that host applications consume as a normal package.
- It owns the engine pool, the reactive signal graph, the key-value store, capability dispatch,
  and the event filter layer. Each program gets an isolated Lua state, so a crash or a runaway
  loop in one cannot reach the host or a sibling.
- Untrusted code has no DOM access. It emits a UI tree as JSON and the host renders it. That one
  boundary is the whole security model, and it holds across three separate clients.
- I moved capability enforcement out of host JavaScript and into Rust: the network fetch allow
  list is checked in the engine, grant maps are clamped on every write, and revoking a grant
  propagates into the running worker.

#work(
  title: "omnilua — garbage collector memory leak, fixed upstream",
  company: "Pure-Rust Lua interpreter",
  location: "Rust",
  dates: "2026",
)
- The runtime builds and drops a Lua VM per program, and resident memory grew without bound even
  after every handle was dropped. I cut it to a minimal reproduction: *29KB definitely lost per VM*
  under valgrind, and every loaded chunk leaked its closure as well.
- The cause was in the allocator. `GcRef::new` fell back to an uncollected allocation whenever no
  heap guard was active, so those boxes sat on no owner list and neither the collector nor heap
  teardown freed them. My fix gives them one. Closed upstream two days after I filed it.

#work(
  title: "traystr — Rust remote-signing daemon",
  company: "Soapbox",
  location: "6k lines Rust",
  dates: "2026",
)
- A Linux system-tray daemon answering NIP-46 remote signing requests over relays. The private
  key lives in the OS keyring and never touches disk in plaintext. Every signing request raises a
  desktop dialog the user approves or denies.

#work(
  title: "Embedded and radio",
  company: "ESP32 signer · NIP-LR over LoRa · The Attention Button",
  location: "C, C++, TypeScript",
  dates: "2023 — 2026",
)
- The #link("https://gitlab.com/soapbox-pub/hardware-signer")[*ESP32 hardware signer*] puts remote signing on a device: NIP-46 over `bunker://`, an SPI
  display, multi-relay reconnection, Wi-Fi provisioning, and an embedded Lua scripting layer. I
  designed and fabricated the board around an ESP32-WROVER-E, with physical confirm and cancel
  buttons.
- *cardea*: a Trezor Model 1 hardware wallet I designed and fabricated, on the STM32F205 and moved
  to USB-C, with ESD and overcurrent protection on the input.
- #link("https://gitlab.com/soapbox-pub/nostr-lora")[*NIP-LR*] carries protocol events over LoRa mesh radio. I wrote the specification and the
  reference implementation: packet encoding, chunking, reassembly, and retransmission, over Web
  Serial and Web BLE to MeshCore devices.
- #link("https://github.com/theattentionbutton")[*The Attention Button*] is a physical IoT product I founded and shipped: OpenSCAD enclosure, a
  board I designed and fabricated, ESP8266 firmware, backend, and packaging, delivered to paying
  customers.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox · earlier: Fractional Finance, Ready Cloud Consulting",
  location: "Remote",
  dates: "2019 — Present",
)
- At Soapbox I own the runtime work above, plus a NIP-07 browser signer with PSBT and Taproot
  signing including BIP-375 silent payments. I also contributed to Nostrify, where I migrated the
  package graph off JSR onto npm so AI coding tools could build against it.
- Earlier freelance work: Vue and Ethereum integrations for a DeFi platform, and Angular
  components for enterprise clients.

== Other Rust and Low-Level Work

#proj("tetron", [2D ECS game engine in Rust with Rune scripting and overlayfs-based modding, so a game loads loose files in development and a zip in release.], url: "github.com/xyzshantaram/tetron")
#proj("stupid-simple-kv", [Key-value crate with order-preserving binary tuple keys, pluggable memory and SQLite backends, and generic serde values.], url: "github.com/xyzshantaram/stupid-simple-kv")

== Skills

#skills((
  ("Rust", [Async, `serde`, `wasm-bindgen`, `tsify`, FFI and embedding, clippy-enforced no-panic policy, crate design and publishing]),
  ("Systems", [WebAssembly, sandboxing, capability security, memory-safety debugging, garbage collector internals, Web Workers, binary key encoding]),
  ("Embedded", [ESP32, ESP8266, Arduino toolchain, SPI displays, Wi-Fi provisioning, LoRa mesh, Web Serial, Web BLE. PCB design in EasyEDA, schematic through layout and BOM. OpenSCAD.]),
  ("Security", [Key storage in OS keyrings, hardware signing devices, PSBT and Taproot, permission and grant models, split-secret key derivation]),
  ("Also", [TypeScript, Lua, C, C++, Python, Deno, Postgres, SQLite, Linux, Docker, nginx]),
))

== Education and Speaking

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026, on sandboxed user-extensible software.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs
