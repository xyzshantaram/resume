---
name: resume-select
description: Pick which of this repository's four résumés to send for a job listing, and outline how to tailor that pick to it. Use when the user shares a job posting (a link, pasted text, a file, or a screenshot) and asks which résumé fits — "which résumé should I send", "pick a résumé", "select a resume for this job" — or wants a listing classified against the résumé set.
argument-hint: "[job-listing url | pasted job text | path to file or screenshot]"
---

# Resume Select

Read a job listing, walk a fixed checklist over it, and name the one résumé from this
repository to send. The output is the choice, the evidence for it, and a short plan for
tailoring that choice to the listing — not a rewrite.

## The four résumés

| File (repo root) | Résumé | Send it for |
| --- | --- | --- |
| `01-software-engineer.typ` | Software engineer | Systems and product engineering across TypeScript, Rust, and WebAssembly, including AI and agent tooling. One page. |
| `02-fullstack-ts.typ` | Full-stack TypeScript engineer | Product work, front end through deploy. One page. |
| `03-hardware.typ` | Hardware and electrical engineer | CAD, fixturing, design for manufacture, PCBs, embedded hardware. One page. |
| `04-general.typ` | General | The broadest, two pages. The fallback when the role is unclear or spans domains. |

Each builds to a PDF named for the role. The links to hand over:

- Software engineer — read `https://xyzshantaram.github.io/resume/Siddharth-Singh-Software-Engineer.html` · PDF `https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Software-Engineer.pdf`
- Full-stack — read `…/Siddharth-Singh-Fullstack-Engineer.html` · PDF `…/releases/latest/download/Siddharth-Singh-Fullstack-Engineer.pdf`
- Hardware — read `…/Siddharth-Singh-Hardware-Engineer.html` · PDF `…/releases/latest/download/Siddharth-Singh-Hardware-Engineer.pdf`
- General — read `…/Siddharth-Singh-Resume.html` · PDF `…/releases/latest/download/Siddharth-Singh-Resume.pdf`

## Step 1 — Get the listing

Take the argument, or ask for it if there is none:

- **A URL** → fetch it with `web_fetch` (markdown). Follow one link to the posting itself if
  the first page is only a redirect or an index.
- **Pasted text** → use it as-is.
- **A local file / path** → read it with `read_file`.
- **A screenshot or image** → read it with `read_file` and read the text in it.

If a fetch fails or is blocked (LinkedIn, Indeed, and most aggregators gate their pages), say
so plainly and ask the user to paste the listing text. Never guess at a listing's contents.

## Step 2 — Walk the checklist

For each item below, mark **yes** or **no** and quote the exact phrase from the listing that
made you mark it. Quote; do not paraphrase, and do not infer a signal that is not written down.

**H — physical hardware**
1. PCB design, board bring-up, schematic, layout, or BOM.
2. CAD (SolidWorks, Fusion 360, OpenSCAD, Onshape) or mechanical/enclosure design.
3. Design for manufacture, tooling, fixturing, machining, or manufacturability.
4. "Hardware engineer", electrical/electronics engineer, sensors, or power.

**F — front end and product web**
5. React, Vue, Angular, Svelte, or Next.js named as the primary stack.
6. UI, UX, design systems, accessibility, or responsive/mobile web.
7. "Full-stack", "frontend engineer", "product engineer", or "web developer" in the title.
8. The deliverable is a shipping web or mobile product (features, pages, an app).

**S — systems, low level, and infrastructure**
9. Rust, C, or C++ as a primary language.
10. WebAssembly, a runtime, compiler, interpreter, or language tooling.
11. Systems, platform, or infrastructure in the title.
12. Security, sandboxing, cryptography, or protocol work.
13. Embedded software or firmware, if the role does **not** also own board or CAD work.

**A — AI, agents, and developer tooling**
14. LLM, agent, coding agent, harness, MCP, tool use, or prompt/skill authoring.
15. "AI engineer", "agent engineer", "developer tools", or "developer experience" in the title.

**P — protocol and cryptography**
16. Protocol engineer, Bitcoin, Nostr, PSBT, or signing.

**G — general and ambiguous**
17. A generic "software engineer" title with no domain named.
18. New grad, generalist, "founding engineer", or "wear many hats".
19. Nothing in the listing distinguishes a domain, or the listing could not be read.

## Step 3 — Decide

Walk these rules in order; the first one whose condition holds wins.

1. **H holds and hardware is the primary requirement** (item 1–4 in the title or the required
   qualifications) → `03-hardware.typ`.
2. **F holds and the role is primarily product web** (a title from item 7, or items 5–8 in the
   required qualifications, and the role is not systems-level) → `02-fullstack-ts.typ`.
3. **S, A, or P holds as the primary requirement** → `01-software-engineer.typ`.
4. **Otherwise** (G, unclassifiable, or a listing you could not read) → `04-general.typ`.

**Tie-breaks.** Required qualifications and responsibilities outweigh "nice to have". A term
only in the perks, the company blurb, or a "bonus" line does not decide the bucket. If two
buckets still tie:

- Firmware with no board or CAD ownership → `01-software-engineer.typ`; firmware **and** board
  design or CAD → `03-hardware.typ`.
- "AI" plus full-stack, where the deliverable is a product UI → `02-fullstack-ts.typ`; where it
  is tooling, infrastructure, or a runtime → `01-software-engineer.typ`.
- A role spanning hardware and software with neither dominant, or a listing that names no
  domain → `04-general.typ`.

The Software engineer résumé is the safe pick for any engineering role that is not clearly
front-end or hardware; the General one is the pick only when the role spans domains
or cannot be classified.

## Step 4 — Report

Reply in this shape and nothing longer:

- **Résumé:** the name and the file, e.g. Software engineer (`01-software-engineer.typ`).
- **Send:** the read link and the PDF link.
- **Why:** a short bullet per checklist item that fired, each with the quoted phrase.
- **Close call:** the runner-up and the single deciding factor — only when two buckets were
  close; otherwise omit.
- **Tailor:** what a version aimed at this listing would change, in four short parts:
  - **Lead with** — the bullets and projects already in the chosen résumé that match the
    listing's required qualifications, restated in the listing's own vocabulary.
  - **Pull in** — content that already exists in another résumé in this repo (or elsewhere in
    the repo) but is missing from the chosen one and that this listing asks for. Name the file
    it lives in.
  - **Trim** — the least-relevant material to cut or compress to hold the page budget, for the
    one-page résumés only.
  - **Gaps** — requirements the listing states that the résumé set does not evidence. Name them
    as gaps; never invent experience to fill one.

The Tailor plan is advice, not an edit. Keep it to the four parts and one line each.

## Worked examples

- "AI Engineer — build coding agents in TypeScript; tool use, MCP, evals, prompt and skill
  design." → A (items 14–15) as the primary requirement → **Software engineer**. Tailor: lead
  with thursday, aidos, and the bash guard and graph; pull the `edit-code` content-hash detail
  from `04-general.typ`; trim the signing and radio bullets.
- Title "Firmware Engineer — ESP32, FreeRTOS, C; bonus: assist with PCB bring-up." → S (firmware,
  items 9, 13), H only as a bonus (item 1) → **Software engineer**.
- "Hardware Engineer — design enclosures in SolidWorks, run DFM with the CM, own the PCB
  layout." → H (items 1–4) as the primary requirement → **Hardware**.
- "Full-stack Engineer — React, TypeScript, Postgres, ship customer-facing features." → F
  (items 5–8, title item 7) → **Full-stack**.
- "Software Engineer, new grad, generalist — work across the stack." → G (items 17–18) →
  **General**.

## Rules

- Select and suggest; do not edit. This skill names a résumé and outlines tailoring, but it
  does not touch the `.typ` files. If the user wants the changes made, that is a separate,
  explicit task.
- Tailoring may only reorder, reword, or surface content that already exists in the repository.
  Report a missing requirement as a gap; never invent experience to fill it.
- Quote the listing, never invent a signal. If the listing was unreadable, say so and either
  ask for a paste or fall back to `04-general.typ` with that stated as the reason.
- One recommendation. Mention a runner-up only when the decision was close.
