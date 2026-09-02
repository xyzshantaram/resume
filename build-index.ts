// Render README.md into the page GitHub Pages serves. The README is the single
// source for the index, so the repository front page and the site never drift.
//
// Usage: deno run --allow-read --allow-write build-index.ts out/site/index.html
import { marked } from "npm:marked@15";

const out = Deno.args[0];
if (!out) {
  console.error("usage: build-index.ts <output.html>");
  Deno.exit(2);
}

const readme = await Deno.readTextFile(
  new URL("README.md", import.meta.url).pathname,
);

const body = await marked.parse(readme);

const CSS = `
:root { color-scheme: light dark; --accent: #1a3f66; --rule: #d8dde3; }
@media (prefers-color-scheme: dark) {
  :root { --accent: #8fb6dd; --rule: #33383d; }
}
body {
  margin: 0 auto; padding: 2.5rem 1.25rem 5rem; max-width: 46rem;
  font: 16px/1.6 ui-serif, Georgia, "Times New Roman", serif;
}
h1 { font-size: 1.9rem; color: var(--accent); margin: 0 0 .6rem; }
h2 {
  font-size: 1.15rem; margin: 2.4rem 0 .7rem; padding-bottom: .25rem;
  border-bottom: 1px solid var(--rule); letter-spacing: .02em;
}
a { color: var(--accent); }
table { border-collapse: collapse; width: 100%; margin: 1rem 0; }
th, td {
  text-align: left; vertical-align: top; padding: .5rem .7rem .5rem 0;
  border-bottom: 1px solid var(--rule);
}
th { font-size: .85rem; text-transform: uppercase; letter-spacing: .05em; }
code, pre {
  font-family: ui-monospace, SFMono-Regular, Menlo, monospace; font-size: .88em;
}
pre {
  padding: .8rem 1rem; overflow-x: auto;
  border: 1px solid var(--rule); border-radius: 6px;
}
`.trim();

const html = `<!doctype html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Siddharth S Singh — résumés</title>
<link rel="canonical" href="https://xyzshantaram.github.io/resume/">
<style>${CSS}</style>
${body}
`;

await Deno.writeTextFile(out, html);
console.log(`wrote ${out}`);
