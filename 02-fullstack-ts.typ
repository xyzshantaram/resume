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

Full-stack TypeScript engineer with #years-in-production() years of production work, most of it as an
independent contractor: React applications, APIs, Postgres, browser tooling, and a Rust/WebAssembly
runtime. I take a product from an empty repository to a running service, and I maintain a published
web framework. Client work has shipped in React, Vue, Angular, and Next.js.

== Experience

#job("soapbox", bullets: ("canvases", "ditto", "nostrify", "extension", "luacheck"))

#job("freelance", bullets: ("cgp", "fractional", "ready-cloud"))

#job("attention-button", bullets: ("solo",))

#job("earlier-freelance")

== Selected Projects

#fact-proj("campfire")
#fact-proj("writers-jam")
#fact-proj("etu")
#fact-proj("ink-editor")
#fact-proj("macrolight")

== Skills

#skills((
  ("Languages", [TypeScript, JavaScript, Rust, Python, Lua, C, C++, SQL, HTML, CSS]),
  ("Front end", [React, Vue, Angular, Svelte, Next.js, Vite, web components, vanilla. Accessible, responsive, mobile-first work.]),
  ("Mobile", [Capacitor and Cordova wrappers around a React web app, React Native, Ionic. One TypeScript codebase shipped to web, Android, and iOS.]),
  ("Back end", [Deno, Node, Express, Payload CMS, REST+RPC APIs, WebSockets, auth/sessions, Postgres, SQLite, Kysely, Redis]),
  ("Practice", [Testing with Vitest and Playwright, CI pipelines, semantic release, code review, technical writing]),
  ("Ops", [Linux, Docker, dokku, nginx, self-hosted deployment. I run my own production services.]),
  ("Working style", [Independent, written-first, comfortable across every time zone, used to owning a project from scope to delivery.]),
))

== Education and Speaking

#fact-edu()

#fact-talk("hackable")

== References

#refs
