// Shared bits layered on top of @preview/basic-resume.
//
// basic-resume owns the page, the headings, and the ATS-safe structure. This file
// only adds what it does not provide: looser line height, an icon contact line, a
// skills block, and a references block.
//
// Every helper here has two branches. The paged branch keeps the print layout,
// which is tuned to exact page counts. The HTML branch emits plain elements for
// the GitHub Pages export, because HTML export drops `pad` and flattens `grid`.
#import "@preview/basic-resume:0.2.9" as br

// Looser line height and a little more air between blocks. Applied with
// `#show: airy` right after the basic-resume show rule. `pdf` is the file name
// of the built PDF, used by the download bar in HTML output.
#let airy(pdf: "", body) = {
  set par(leading: 0.78em, spacing: 1.05em)
  set list(spacing: 0.78em, indent: 0.6em)
  // In HTML mode the package's heading rules rely on `pad`, which HTML export
  // drops along with the whole title. Emit real heading elements instead. The
  // paged branch returns `it`, so the package rules still apply to the PDF.
  show heading.where(level: 1): it => context {
    if target() == "html" { html.elem("h1", it.body) } else { it }
  }
  show heading.where(level: 2): it => context {
    if target() == "html" { html.elem("h2", it.body) } else { it }
  }
  context {
    if target() == "html" {
      html.elem("style", read("page.css"))
      html.elem("p", attrs: (class: "dl dl-top"), html.elem("a", attrs: (href: pdf), "Download PDF"))
      // basic-resume emits the name heading before `airy` runs, so the heading
      // rule above never reaches it. The package sets the document title to the
      // author, so use that for the h1.
      html.elem("h1", document.title)
    }
  }
  body
  context {
    if target() == "html" {
      html.elem("p", attrs: (class: "dl dl-bottom"), html.elem("a", attrs: (href: pdf), "Download PDF"))
    }
  }
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
  context {
    if target() == "html" {
      // The icons and the horizontal spacing do not survive export, so drop the
      // icons and join the items with a visible separator.
      let plain = items.map(it => {
        let (icon, label, url) = it
        if url == "" { label } else { html.elem("a", attrs: (href: url), label) }
      })
      let sep = html.elem("span", attrs: (class: "sep"), "·")
      html.elem("p", attrs: (class: "contact"), plain.intersperse(sep).fold(none, (a, b) => if a == none { b } else { a + b }))
    } else {
      // Sit close under the name, then leave a clear gap before the summary so the
      // row reads as part of the heading rather than as the first line of the text.
      block(above: 0.1em, below: 1.7em, text(size: 0.95em, parts.join(h(1.15em))))
    }
  }
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
  context {
    if target() == "html" {
      let link-part = if url == "" {
        none
      } else {
        html.elem("a", attrs: (href: "https://" + url), " " + shown)
      }
      html.elem("p", attrs: (class: "proj"),
        html.elem("strong", name) + " — " + note
          + if link-part == none { [] } else { link-part },
      )
    } else {
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
  }
}

// A label/value skills block. Takes an array of (label, content) pairs.
#let skills(rows) = {
  context {
    if target() == "html" {
      let cells = rows.map(pair => {
        let (label, value) = pair
        (html.elem("dt", text(weight: 700, label)), html.elem("dd", value))
      }).flatten()
      html.elem("dl", attrs: (class: "skills"), cells.fold(none, (a, b) => if a == none { b } else { a + b }))
    } else {
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
  }
}

// The referee list in HTML form, shared by `refs` and `refs-stacked`.
#let refs-html() = {
  let people = (
    ("Chad Curtis", "Soapbox"),
    ("James Sutton", "Fractional Finance"),
    ("Jared Ready", "Ready Cloud Consulting"),
  )
  let items = people.map(pair => {
    let (name, org) = pair
    html.elem("li", html.elem("strong", name) + " — " + org)
  })
  // Join the two elements into one piece of content. Returning an array here
  // would put an array in content position, and Typst renders that as its debug
  // repr instead of as markup.
  let list = html.elem(
    "ul",
    attrs: (class: "refs"),
    items.fold(none, (a, b) => if a == none { b } else { a + b }),
  )
  let note = html.elem("p", attrs: (class: "note"), "Contact details on request.")
  list + note
}

// The three named referees, side by side in one row so the block stays two lines
// tall. Running them together as prose made the trailing note read as part of the
// last referee's entry, so keep each in its own column.
#let refs = {
  context {
    if target() == "html" { refs-html() } else {
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
  }
}

// Two-page layout has the vertical room, so give each referee its own line. The
// single-row version above exists only to save space on the one-page resumes.
#let refs-stacked = {
  context {
    if target() == "html" { refs-html() } else {
      block[
        *Chad Curtis* — Soapbox \
        *James Sutton* — Fractional Finance \
        *Jared Ready* — Ready Cloud Consulting
        #v(2pt)
        #text(size: 0.92em)[Contact details on request.]
      ]
    }
  }
}

// One work or degree entry in HTML form. The package builds these with `grid`,
// and HTML export flattens a grid with no separator, so the words run together.
// Emit labelled spans instead; the CSS puts the dates and the location on the
// right.
#let entry-html(role, dates, org, where) = {
  html.elem("div", attrs: (class: "entry"),
    html.elem("div", attrs: (class: "entry-head"),
      html.elem("span", attrs: (class: "role"), role)
        + html.elem("span", attrs: (class: "dates"), dates),
    )
    + html.elem("div", attrs: (class: "entry-sub"),
      html.elem("span", attrs: (class: "org"), org)
        + html.elem("span", attrs: (class: "where"), where),
    ),
  )
}

// A work entry. In paged mode this calls the package version, so the PDF does
// not change.
#let work(title: "", dates: "", company: "", location: "") = {
  context {
    if target() == "html" {
      entry-html(title, dates, company, location)
    } else {
      br.work(title: title, dates: dates, company: company, location: location)
    }
  }
}

// A degree entry. Same shape as `work`; the institution takes the role slot and
// the degree takes the org slot.
#let edu(institution: "", dates: "", degree: "", gpa: "", location: "", consistent: false) = {
  context {
    if target() == "html" {
      entry-html(institution, dates, degree, location)
    } else {
      br.edu(
        institution: institution, dates: dates, degree: degree,
        gpa: gpa, location: location, consistent: consistent,
      )
    }
  }
}
