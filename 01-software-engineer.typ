#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *
#import "lib/facts.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 8pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Software-Engineer.pdf")

#contact(contact-items)

Software engineer, #years-in-production() years in production, most of it as an independent contractor
owning a product end to end. I pick up unfamiliar stacks quickly and read before I write, then build
systems I can reason about: a Rust and WebAssembly sandbox, the protocol runtime around it, a
coding-agent harness, and the web apps on top. What I care about is open-source software that is
useful, fast, and correct — worth reaching for, and simple enough that someone else can read and
change it.

== Experience

#job("soapbox", bullets: ("runtime", "signing", "agent-and-nostrify"))

#job("attention-button", bullets: ("whole-product",))

#job("freelance", bullets: ("clients",))

== Agent and Tooling Work

#job("thursday", bullets: ("aidos", "computation"))

== Selected Work

#fact-proj("nostr-canvas")
#fact-proj("campfire")
#fact-proj("luacheck-ts")
#fact-proj("wizardkit")

== Skills

#skills((
  ("Languages", [TypeScript, Rust, Lua, C, C++, Python, JavaScript]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), sandboxing and capability security, Web Workers, language tooling]),
  ("Agents", [Harness design, tool and permission gating, evidence and audit models, MCP servers, plugin systems]),
  ("Web and ops", [Deno, Node, React, Vue, Svelte, Postgres, SQLite, Linux, Docker, nginx. I run my own services in production.]),
))

== Education and Speaking

#fact-edu()

#fact-talk("hackable")

== References

#refs
