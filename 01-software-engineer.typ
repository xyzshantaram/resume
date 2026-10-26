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

Software engineer, #years-in-production() years in production, mostly as an independent contractor.
I build systems that stay predictable under load and under abuse: a Rust and WebAssembly sandbox,
capability-gated signing, local dictation, and agent harnesses with enforced evidence. What I care
about is open-source software that is useful, fast, and correct, and simple enough that someone else
can read and change it.

== Current work

#fact-proj("thursday")
#fact-proj("ai-for-all", limit: 1)
#fact-proj("thursday-dsh", detail: false)

== Experience

#job("soapbox", bullets: ("runtime", "captcha", "nostrify", "signing"))

#job("freelance", bullets: ("clients",))

#job("attention-button", bullets: ("product",))

== Selected Work

#fact-proj("dots")
#fact-proj("homepage")
#fact-proj("campfire")
#fact-proj("luacheck-ts")

== Skills

#skills((
  ("Languages", [TypeScript, Rust, Lua, C, C++, Python, JavaScript]),
  ("Systems", [Rust to WebAssembly (`wasm-bindgen`, `tsify`), sandboxing and capability security, Web Workers, language tooling, deterministic context management]),
  ("Agents", [Harness design, tool and permission gating, evidence and audit models, MCP servers, plugin systems, evaluation design]),
  ("Interface", [Quickshell and QML surfaces, canvas interaction, local-first input, proof-of-work gates]),
  ("Web and ops", [Deno, Node, Bun, React, Vue, Svelte, Postgres, SQLite, Linux, Docker, nginx, Just. I run my own services in production.]),
))

== Education and Speaking

#fact-edu()

#fact-talk("hackable")

== References

#refs
