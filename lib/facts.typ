// Reads facts.yaml and exposes it to the résumés.
//
// The résumés keep their per-résumé prose; everything repeated across files —
// contact, dates, orgs, bullets, projects — lives in facts.yaml and is reached
// through the helpers below. Bullet strings are Typst markup and are rendered
// back with `eval(.., mode: "markup")`.
#import "shared.typ" as shared

#let facts = yaml("../facts.yaml")

#let org(key) = facts.orgs.at(key)
#let project(key) = facts.projects.at(key)
#let talk(key) = facts.talks.at(key)
#let education = facts.education

// The contact row: (icon, label, url) triples, as `contact` expects.
#let contact-items = facts.person.contact.map(c => (
  c.icon,
  c.label,
  c.at("url", default: ""),
))

// "four years in production" — computed from the start year, never typed.
// `cap: true` capitalises it for the start of a sentence.
#let _words = (
  "zero", "one", "two", "three", "four", "five",
  "six", "seven", "eight", "nine", "ten",
)
#let years-in-production(cap: false) = {
  let n = datetime.today().year() - facts.tenure.production_start
  let w = _words.at(calc.clamp(n, 0, _words.len() - 1))
  if cap { upper(w.first()) + w.slice(1) } else { w }
}

// A work entry plus the named bullets from its pool, in the order given.
#let job(key, bullets: ()) = {
  let o = org(key)
  shared.work(
    title: o.title,
    company: o.company,
    location: o.at("location", default: ""),
    dates: o.dates,
  )
  for b in bullets {
    list.item(eval(o.bullets.at(b), mode: "markup"))
  }
}

// A free-standing bullet run from the `lists` block, e.g. the hardware lists.
#let fact-list(group, ids) = {
  let g = facts.lists.at(group)
  for id in ids {
    list.item(eval(g.at(id), mode: "markup"))
  }
}

#let fact-proj(key) = {
  let p = project(key)
  shared.proj(
    p.name,
    eval(p.note, mode: "markup"),
    url: p.at("url", default: ""),
    label: p.at("label", default: ""),
  )
}

#let fact-talk(key) = {
  let t = talk(key)
  shared.proj(t.name, eval(t.note, mode: "markup"), url: t.at("url", default: ""))
}

#let fact-edu() = shared.edu(
  institution: education.institution,
  location: education.location,
  dates: education.dates,
  degree: education.degree,
  consistent: true,
)
