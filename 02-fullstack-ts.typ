#import "@preview/basic-resume:0.2.9": *
#import "lib/shared.typ": *

#show: resume.with(
  author: "Siddharth S Singh",
  accent-color: "#1a3f66",
  font: "New Computer Modern",
  paper: "a4",
  font-size: 8.4pt,
)

#show: airy.with(pdf: "Siddharth-Singh-Fullstack-Engineer.pdf")

#contact((
  ("pin", "Bangalore, India · remote, any time zone", ""),
  ("mail", "me@shantaram.xyz", "mailto:me@shantaram.xyz"),
  ("github", "xyzshantaram", "https://github.com/xyzshantaram"),
  ("gitlab", "xyzshantaram", "https://gitlab.com/xyzshantaram"),
  ("globe", "shantaram.xyz", "https://shantaram.xyz"),
))

Full-stack TypeScript engineer with four years of production work, most of it as an independent
contractor: React applications, APIs, Postgres, browser tooling, and a Rust/WebAssembly runtime. I
take a product from an empty repository to a running service, and I maintain a published web
framework. Client work has shipped in React, Vue, Angular, and Next.js.

== Experience

#work(
  title: "Software Engineer (contract)",
  company: "Soapbox",
  location: "Remote",
  dates: "Apr 2024 — Present",
)
- Shipped three production web applications end to end: a plugin runtime library in TypeScript and
  Rust, a mobile-first app with a marketplace and a social feed in React, and #link("https://github.com/xyzshantaram/tile-studio")[*tile-studio*], a browser IDE
  for authoring plugins, with a chat pane, a live sandboxed preview, and a publish pipeline.
- Built that runtime into *Ditto*, a React and TypeScript client with a Capacitor shell: *117
  commits* covering the embedding layer, a plugin marketplace, an install and permissions flow, and
  a threat model, plus the AI chat feature with its provider settings, session hooks, and tool
  system. Earlier I worked deeply on the Mastodon API in #link("https://github.com/xyzshantaram/ditto-v1")[*Ditto v1*], a Hono server.
- Contributed to #link("https://github.com/xyzshantaram/nostrify")[*Nostrify*], a core framework in Soapbox's Nostr tooling. I wrote the
  initial version of its Postgres storage adapter, compiling protocol filters to Kysely queries over
  postgres.js and setting up its migrations and benchmarks, and worked around a Deno compatibility
  bug in postgres.js to get it running. I also built SQLite- and LMDB-backed event stores, and
  migrated the Nostrify package graph off JSR onto npm and set up typechecking in CI.
- Shipped a browser extension with a permission UI and per-site grants, published to the
  #link("https://chromewebstore.google.com/detail/soapbox-signer/nnodjkgakfpkckcnbacpcjbpmlmbihdd")[*Chrome Web Store*] and #link("https://addons.mozilla.org/en-US/firefox/addon/soapbox-pub-signer/")[*Firefox Add-ons*].
- Ported #link("https://jsr.io/@xyzshantaram/luacheck-ts")[*luacheck-ts*], a 22k-line static analyzer, to TypeScript so it runs in the browser,
  Deno, and Node from one codebase.
- Wrote the product's whole specification: 26 numbered Tile Improvement Proposals (TIPs).

#work(
  title: "Freelance Software Engineer",
  company: "Fractional Finance · Ready Cloud Consulting · Common Ground Practice",
  location: "Remote",
  dates: "2019 — Present",
)
- *Common Ground Practice*: built and deployed the full content site on Payload CMS and Next.js
  with Postgres and Docker Compose, including the admin model and the deploy path. Sole engineer.
- *Fractional Finance (later Frabric)*: Vue front end and Ethereum integrations for a
  decentralised finance platform.
- *Ready Cloud Consulting*: Angular front-end components for enterprise clients.

#work(
  title: "Founder",
  company: "The Attention Button",
  location: "Bangalore",
  dates: "2023 — Present",
)
- Designed, built, and sold an IoT product solo: enclosure CAD, a board I designed and
  fabricated, firmware, backend service, website, instruction leaflet, and packaging. Shipped to
  real customers with the hardware and firmware open-sourced.

== Selected Projects

#proj("campfire", [A reactive web framework: chainable DOM builder, reactive stores, no build step, no virtual DOM.], url: "campfire.js.org")
#proj("writers-jam", [A weekly writing exercise and anti-social network. *361 posts and 102,302 views* to date.], url: "writersjam.shantaram.xyz")
#proj("etu", [A time-clock and invoicing CLI for freelancers, in Deno and compiled to a single binary. Deno.Kv storage, and invoices render through Liquid and Typst templates fed a JSON context. I have billed my own contract work with it daily since 2024.], url: "github.com/xyzshantaram/etu")
#proj("ink-editor", [WYSIWYG markdown editor on CodeMirror 6, with vertical and horizontal modes.], url: "github.com/xyzshantaram/ink-editor")
#proj("macrolight", [A tiny cross-runtime syntax highlighter, a TypeScript rewrite of asvd's microlight.], url: "github.com/xyzshantaram/macrolight")

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

#edu(
  institution: "VIT Chennai",
  location: "Chennai, India",
  dates: "2020 — 2025",
  degree: "B.Tech, Electrical and Electronics Engineering",
  consistent: true,
)

#proj("\"Hackable By Default\"", [Talk at bitcoin++ Nairobi, 2026, on software that empowers users to extend it themselves, by building systems easy for both people and computers to understand.], url: "youtu.be/PO1lggcj-Ic")

== References

#refs
