# Siddharth S Singh — résumés

**TL;DR** — you probably want the general one:
[read it in the browser](https://xyzshantaram.github.io/resume/resume.html)
or [download the PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Resume.pdf).

Six résumés, one per kind of role, written in [Typst](https://typst.app) from a
shared template. Five are one page. The general one is two.

Each one builds twice: a PDF to attach to an application, and an HTML page that
reads well on a phone. The built files are not kept in git. Every push to `main`
rebuilds them, and a tagged push publishes the PDFs to a release, so the links
below always point at the newest build.

## Read or download

| Résumé | For | Links |
| --- | --- | --- |
| **General** | The public one. Two pages. Use it when the role is not yet known. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Resume.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Resume.pdf) |
| Nostr and Bitcoin protocol engineer | Protocol, signing, and Lightning work. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Nostr-Bitcoin-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Nostr-Bitcoin-Engineer.pdf) |
| AI agent and developer tooling engineer | Coding agents, harnesses, MCP, plugin systems. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-AI-Agent-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-AI-Agent-Engineer.pdf) |
| Rust systems and embedded security engineer | Rust, WebAssembly, embedded C, radio. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Rust-Systems-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Rust-Systems-Engineer.pdf) |
| Senior full-stack TypeScript engineer | Product work, front end through deploy. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Fullstack-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Fullstack-Engineer.pdf) |
| Hardware and mechanical engineer | CAD, fixturing, design for manufacture, PCBs. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Mechanical-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Mechanical-Engineer.pdf) |

Contact: [me@shantaram.xyz](mailto:me@shantaram.xyz) ·
[shantaram.xyz](https://shantaram.xyz) ·
[github.com/xyzshantaram](https://github.com/xyzshantaram) ·
[gitlab.com/xyzshantaram](https://gitlab.com/xyzshantaram)

## Quickstart

```sh
git clone git@github.com:xyzshantaram/resume.git
cd resume
make site                                  # build everything into out/
python3 -m http.server -d out/site 8000    # then open http://localhost:8000
```

You need [Typst](https://github.com/typst/typst) for the PDFs and
[Deno](https://deno.com) for the HTML index. Typst downloads the `basic-resume`
package itself on the first run.

```sh
cargo install --locked typst-cli           # or: brew install typst
curl -fsSL https://deno.land/install.sh | sh
```

## Build targets

```sh
make          # build all six PDFs into out/, under their send-ready names
make html     # build the HTML pages into out/site/
make site     # both, plus this README rendered as the index
make clean
```

To work on one resume, let Typst rebuild it on every save and keep a viewer open
on the result:

```sh
typst watch 06-general.typ out/preview.pdf
```

HTML export in Typst is still marked experimental, so the build prints warnings
about ignored page and padding rules. Those are expected. `lib/shared.typ`
re-emits the parts that HTML export would otherwise drop.

## Release

A tag publishes a release with all six PDFs attached. Tags are ISO 8601 basic
with the local UTC offset, for example `20260903T001948+0530`:

```sh
make tag                  # tags the current commit with the time right now
git push origin --tags
```

The workflow in `.github/workflows/build.yaml` builds on every push to `main`,
deploys the GitHub Pages copy, and creates the release when the push is a tag.

## Layout

| Path | What it is |
| --- | --- |
| `0*.typ` | One résumé each. Content only. |
| `lib/shared.typ` | The shared template: spacing, the contact row, links, projects, skills, references, and the HTML branch. |
| `lib/page.css` | Styling for the HTML pages. |
| `lib/icons/` | The marks used in the contact row and next to links. |
| `build-index.ts` | Renders this README into the GitHub Pages index. |
