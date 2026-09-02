#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 7.8pt,
)

#show: airy

#contact((
  ("pin", "Bangalore, India · remote, any time zone", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("gitlab", "xyzshantaram", "https://gitlab.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

I build the layer between a language model and a codebase: a coding-agent harness whose state
gates an agent cannot talk its way past, plugins and upstream fixes for DeepSeek Harness, an MCP
server that replaces Goose's built-in developer tools, and a capability-gated sandbox that runs
untrusted plugin code in Rust and WebAssembly. My interest is agent trust boundaries: what an
agent may do, and what proof it has to leave behind.

== Agent and Tooling Work

#work(
  title: "aidos — a coding-agent harness with enforced gates",
  company: "Built on DeepSeek Harness",
  location: "TypeScript",
  dates: "2026",
)
- An agent left alone widens scope and reports success it did not earn. aidos moves the fix out
  of the prompt and into the harness. Tickets run `open` → `in-progress` → `awaiting-verification`
  → `done`, and only the human moves one out of verification.
- *Evidence is a first-class row*: a kind, an author, a time, and a payload. The harness stamps
  the author from the entry point that made the call and never reads it from the payload, so an
  agent cannot write a row claiming the human signed off.
- *Gates* are predicates over evidence, declared in config rather than in schema. A refused
  transition names the missing evidence kind and the party who has to supply it, and evidence
  kinds are namespaced so plugins extend the registry without touching the kernel.

#work(
  title: "DeepSeek Harness (dsh) — plugin bundle and upstream fixes",
  company: "dotfiles-ai · dsh-remote · dsh-better-edit",
  location: "TypeScript",
  dates: "2026",
)
- `dotfiles-ai` is a complete dsh configuration bundle: Cordis plugins, skills, presets, and bash
  guard rules, driving a whole AI workstation from one repository.
- In `dsh-remote` I fixed the `ctx.provide` bind failure and the RPC response payload on several
  routes, and moved the loopback flip onto a cookie so the auth gate survives a reverse proxy.
  In `dsh-better-edit` I fixed the served-mirror rebase after an edit.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox",
  location: "Remote",
  dates: "Apr 2024 — Present",
)
- Built the tile-authoring agent: first inside #link("https://gitlab.com/soapbox-pub/tile-studio")[*tile-studio*], a browser IDE for vibecoding tiles,
  then extracted it into the reusable *nostr-canvas devkit* and shipped it into *Ditto*, a
  production Nostr client. An `AgentSession` loop drives a twelve-tool surface — read, write, and
  edit code, run a live preview, search and fetch NIPs, ask the user a question — with context
  compaction, token accounting, and tool-result pruning when the window fills.
- Its `edit-code` tool addresses lines by *content hash* rather than line number, so a stale model
  reference fails loudly instead of silently corrupting the file. Generated Lua is linted against
  a ported `luacheck` before it reaches the preview, which puts real diagnostics back in the loop.
- #link("https://soapbox-pub.gitlab.io/nostr-canvas")[*nostr-canvas*] is the runtime all of that targets. I owned the runtime, the spec, and the Rust
  core: a 19k-line crate compiled to WebAssembly behind a TypeScript embedding layer. Each plugin
  gets an isolated Lua engine and no DOM access.
- *Capability grants* gate each plugin's access to fetch, event publishing, encryption, and
  Bitcoin signing. Enforcement lives in Rust, not host JavaScript, so a revoked grant takes effect
  inside the running worker.
- Wrote the whole specification: one NIP plus 26 numbered Tile Improvement Proposals with a
  `requires` dependency graph and three conformance levels, so others can build against it.
- Contributed to #link("https://gitlab.com/soapbox-pub/nostrify")[*Nostrify*], a framework other teams ship on. I migrated its package graph off
  JSR onto npm so AI coding tools could resolve and build against it.

#work(
  title: "Freelance Software Engineer · Founder, The Attention Button",
  company: "Fractional Finance · Ready Cloud Consulting · Common Ground Practice",
  location: "Remote",
  dates: "2019 — Present",
)
- *Fractional Finance (later Frabric)*: Vue front end and Ethereum integrations for a DeFi platform.
- *Ready Cloud Consulting*: Angular front-end components for enterprise clients.
- *Common Ground Practice*: a Payload CMS and Next.js production site on Postgres, sole engineer.

== Selected Tooling Projects

#proj("js-dev-mcp", [A Model Context Protocol server exposing shell and text-editor tools, built as a drop-in replacement for Goose's built-in developer MCP.], url: "gitlab.com/soapbox-pub/js-dev-mcp")
#proj("crazy-wall", [A spatial interface for language models: answers render as typed widget nodes on an infinite canvas graph, not a linear chat log.], url: "github.com/xyzshantaram/crazy-wall")

== Skills

#skills((
  ("Agents", [Harness design, tool and permission gating, evidence and audit models, MCP servers, Cordis plugin systems, prompt and skill authoring, agent evaluation loops]),
  ("Languages", [TypeScript, Rust, Lua, C, C++, Python, JavaScript]),
  ("Runtime", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), Web Workers, sandboxing, capability security, language tooling (lexer, parser, scope analysis)]),
  ("Web", [Deno, Node, React, Vite, CodeMirror, Postgres, SQLite]),
  ("Ops", [Linux, Docker, dokku, nginx, CI pipelines. I run my own services in production.]),
))

== Education and Speaking

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026, on making applications extensible by default and lowering the barrier far enough that a model can write a working plugin.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs
