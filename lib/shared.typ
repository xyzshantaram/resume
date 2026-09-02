// Shared bits layered on top of @preview/basic-resume.
//
// basic-resume owns the page, the headings, and the ATS-safe structure. This file
// only adds what it does not provide: looser line height, an icon contact line, a
// skills block, and a references block.

// Looser line height and a little more air between blocks. Applied with
// `#show: airy` right after the basic-resume show rule.
#let airy(body) = {
  set par(leading: 0.78em, spacing: 1.05em)
  set list(spacing: 0.78em, indent: 0.6em)
  body
}

// The contact line under the name. basic-resume joins its own contact items with
// "  |  " and offers no hook to change that, so the resumes pass no contact fields
// and call this instead. Each item is (icon, label, url); url "" renders as text.
#let contact(items) = {
  let parts = items.map(it => {
    let (icon, label, url) = it
    let mark = box(image("icons/" + icon + ".svg", height: 0.98em), baseline: 0.18em)
    let body = if url == "" { label } else { link(url)[#label] }
    box[#mark#h(0.34em)#body]
  })
  // Sit close under the name, then leave a clear gap before the summary so the
  // row reads as part of the heading rather than as the first line of the text.
  block(above: 0.1em, below: 1.7em, text(size: 0.95em, parts.join(h(1.15em))))
}

// Host icons for the link column. GitHub, GitLab, and JSR are simple-icons marks
// recoloured to the accent; the video and globe marks are hand-drawn. The icon
// carries the host, so the visible label drops the domain and keeps the path.
#let host-icon(url) = {
  let mark = if url.starts-with("github.com/") {
    "icons/github.svg"
  } else if url.starts-with("gitlab.com/") {
    "icons/gitlab.svg"
  } else if url.starts-with("jsr.io/") {
    "icons/jsr.svg"
  } else if url.starts-with("youtu.be/") or url.starts-with("youtube.com/") {
    "icons/play.svg"
  } else {
    "icons/globe.svg"
  }
  box(image(mark, height: 0.86em), baseline: 0.14em)
  h(0.3em)
}

// One compact project line: bold name, one sentence, optional link on the right.
// basic-resume's own `project` has no description slot, so this replaces it.
#let proj(name, note, url: "") = {
  // Show a short label but keep the full link target. A bare "github.com/" or
  // "gitlab.com/" prefix eats width from the description column and wraps the
  // line, so the host becomes an icon instead.
  let shown = url.replace("github.com/", "").replace("gitlab.com/", "").replace("jsr.io/", "")
  block(spacing: 0.72em)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      [*#name* — #note],
      if url != "" {
        text(size: 0.9em)[#host-icon(url)#link("https://" + url)[#shown]]
      } else { [] },
    )
  ]
}

// A label/value skills block. Takes an array of (label, content) pairs.
#let skills(rows) = {
  for (label, value) in rows {
    block(spacing: 0.72em)[
      #grid(
        columns: (78pt, 1fr),
        gutter: 8pt,
        text(weight: 700)[#label],
        value,
      )
    ]
  }
}

// The three named referees, side by side in one row so the block stays two lines
// tall. Running them together as prose made the trailing note read as part of the
// last referee's entry, so keep each in its own column.
#let refs = {
  block[
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: 12pt,
      [*Chad Curtis* — Soapbox],
      [*James Sutton* — Fractional Finance],
      [*Jared Ready* — Ready Cloud Consulting],
      align(right)[#text(size: 0.9em, style: "italic")[Contact details on request.]],
    )
  ]
}

// Two-page layout has the vertical room, so give each referee its own line. The
// single-row version above exists only to save space on the one-page resumes.
#let refs-stacked = {
  block[
    *Chad Curtis* — Soapbox \
    *James Sutton* — Fractional Finance \
    *Jared Ready* — Ready Cloud Consulting
    #v(2pt)
    #text(size: 0.92em)[Contact details on request.]
  ]
}
