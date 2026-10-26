#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *
#import "lib/facts.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 8.4pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Fullstack-Engineer.pdf")

#contact(contact-items)

Full-stack TypeScript engineer with #years-in-production() years of production work, mostly
independent: React, APIs, Postgres, browser tooling and a Rust/WebAssembly runtime. I take a
product from an empty repository to a running service, and I maintain a published web framework.
Client work has shipped in React, Vue, Angular and Next.js.

== Experience

#job("soapbox", bullets: ("canvases", "ditto", "nostrify", "captcha", "luacheck"))

#job("freelance", bullets: ("clients",))

#job("attention-button", bullets: ("product",))

== AI systems

#fact-proj("thursday", detail: false)
#fact-proj("thursday-dsh", detail: false)
#fact-proj("ai-for-all", detail: false)

== Selected Projects

#fact-proj("homepage")
#fact-proj("campfire")
#fact-proj("writers-jam")
#fact-proj("etu")
#fact-proj("macrolight")

== Skills

#skills((
  ("Languages", [TypeScript, JavaScript, Rust, Python, Lua, C, C++, SQL, HTML, CSS]),
  ("Frontend + Mobile", [React, Vue, Angular, Svelte, Next.js, Vite, web components; Capacitor, React Native. Accessible, responsive work from one TypeScript codebase on web, Android and iOS.]),
  ("Back end and data", [Deno, Node, Bun, Hono, Express, Payload CMS, REST and RPC, WebSockets, auth, Postgres, SQLite, Kysely, Redis]),
  ("Agentic engg.", [Harness and tool design, permission gating, Vitest, Playwright, CI, code review, technical writing]),
  ("Ops", [Linux, Docker, dokku, nginx, Just, self-hosted deployment. I run my own production services.]),
))

== Education and Speaking

#fact-edu()

#fact-talk("hackable")

== References

#refs
