# Siddharth S Singh — résumés

This repository holds four résumés, one per kind of role, written in
[Typst](https://typst.app) from a shared template. The general one is the
broadest; the others are tailored to a specific role.

Each build produces a PDF to attach to an application and an HTML page that
reads well on a phone. Built files are not kept in git: every push to `main`
rebuilds them, and a tagged push publishes the PDFs to a release, so the links
below always resolve to the newest build.

## Read or download

| Résumé | For | Links |
| --- | --- | --- |
| **General** | Two pages. The broadest summary: hardware, systems, product, and tooling. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Resume.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Resume.pdf) |
| Software engineer | Systems and product engineering across TypeScript, Rust, and WebAssembly, including agent tooling. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Software-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Software-Engineer.pdf) |
| Senior full-stack TypeScript engineer | Product work, front end through deploy. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Fullstack-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Fullstack-Engineer.pdf) |
| Hardware and electrical engineer | CAD, fixturing, design for manufacture, PCBs. | [read](https://xyzshantaram.github.io/resume/Siddharth-Singh-Hardware-Engineer.html) · [PDF](https://github.com/xyzshantaram/resume/releases/latest/download/Siddharth-Singh-Hardware-Engineer.pdf) |

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

Typst builds the PDFs and Deno renders the HTML index. Typst downloads the
`basic-resume` package itself on the first run.

```sh
cargo install --locked typst-cli           # or: brew install typst
curl -fsSL https://deno.land/install.sh | sh
```

## Build targets

```sh
make          # build every PDF into out/, under its send-ready name
make html     # build the HTML pages into out/site/
make site     # both, plus this README rendered as the index
make clean
```

To work on one résumé, let Typst rebuild it on every save and keep a viewer open
on the result:

```sh
typst watch 04-general.typ out/preview.pdf
```

HTML export in Typst is still marked experimental, so the build prints warnings
about ignored page and padding rules. Those are expected. `lib/shared.typ`
re-emits the parts that HTML export would otherwise drop.

## Release

A tag publishes a release with every PDF attached. Tags are ISO 8601 basic
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
