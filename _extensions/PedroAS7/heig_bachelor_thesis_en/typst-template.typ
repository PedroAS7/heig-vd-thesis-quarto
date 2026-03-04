/*
|              ██         
| ████▄ ▄███▄ ▀██▀▀ ▄█▀█▄ 
| ██ ██ ██ ██  ██   ██▄█▀ 
| ██ ██ ▀███▀  ██   ▀█▄▄▄ 
| 
| Adapted from code by @DACC4 and @samuelroland.
| Source: https://github.com/DACC4/HEIG-VD-typst-template-for-TB
| Translated into English by @EnJiBe
| Adapted for Quarto by @PS-HEIG with help from Claude AI Sonnet 4.6
*/

#import "_extensions/PedroAS7/heig_bachelor_thesis_en/macros.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/dashy-todo:0.1.3": *

// ------------------------------------
// Main template function
// ------------------------------------
#let tb-report(
  title: none,
  subtitle: none,
  author: none,
  supervisor: none,
  department: none,
  program: none,
  specialization: none,
  client-name: none,
  client-company: none,
  academic-years: none,
  abstract: none,
  confidential: false,
  lang: "en",
  doc,
) = {

  // ------------------------------------
  // Codly initialisation (syntax highlighting)
  // ------------------------------------
  show: codly-init.with()

  // ------------------------------------
  // Heading styles
  // ------------------------------------
  set heading(numbering: none)

  show heading.where(level: 1): it => [
    #pagebreak(weak: true, to: none)
    #v(2.5em)
    #it
    \
  ]

  show outline.entry.where(level: 1): it => {
    if it.element.func() != heading {
      return it
    }
    v(20pt, weak: true)
    strong(it)
  }

  // ------------------------------------
  // Page layout
  // ------------------------------------
  let confidential_text = if confidential { [Confidential] } else { [] }

  set page(
    paper: "a4",
    numbering: "1",
    header: context {
      if (not is-first-page(page)) and (not is-title-page(page)) {
        columns(2, [
          #align(left)[#smallcaps([#currentH()])]
          #colbreak()
          #align(right)[#if author != none { author }]
        ])
        hr()
      }
    },
    footer: context {
      if not is-first-page(page) {
        hr()
        columns(2, [
          #align(left)[#smallcaps(confidential_text)]
          #colbreak()
          #align(right)[#counter(page).display()]
        ])
      }
    },
    margin: (
      top: 150pt,
      bottom: 150pt,
      x: 1in,
    ),
  )

  // ------------------------------------
  // Typography — LaTeX look and feel
  // ------------------------------------
  set text(font: "New Computer Modern", lang: lang)
  set par(leading: 0.55em, spacing: 0.55em, justify: true)
  show heading: set block(above: 1.4em, below: 1em)
  show heading.where(level: 1): set text(size: 25pt)
  set table.cell(breakable: false)
  show figure: set block(breakable: true)
  show link: underline
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )

  // ------------------------------------
  // Title page
  // ------------------------------------
  image("_extensions/PedroAS7/heig_bachelor_thesis_en/images/HEIG-VD_logotype-baseline_rouge-cmjn.pdf", width: 6cm)
  v(10%)
  align(center, [#text(size: 14pt, [*Bachelor's Thesis*])])
  v(4%)
  align(center, [#text(size: 24pt, [*#if title != none { title } else { [Untitled] }*])])
  v(1%)
  if subtitle != none {
    align(center, [#text(size: 16pt, [#subtitle])])
  }
  v(4%)
  if confidential {
    align(center, [#text(size: 14pt, [*Confidential*])])
  } else {
    v(14pt)
  }
  v(8%)

  align(left, [
    #block(width: 100%, [
      #table(
        stroke: none,
        columns: (35%, 65%),
        [*Student*],        [*#if author != none { author } else { [] }*],
        [], [],
        [*Supervisor*],     [#if supervisor != none { supervisor } else { [] }],
        [], [],
        [*Department*],     [#if department != none { department } else { [] }],
        [*Program*],        [#if program != none { program } else { [] }],
        [*Specialization*], [#if specialization != none { specialization } else { [] }],
        [], [],
        [*Client name*],    [#if client-name != none { client-name } else { [] }],
        [*Client company*], [#if client-company != none { client-company } else { [] }],
        [], [],
        [*Academic year*],  [#if academic-years != none { academic-years } else { [] }],
      )
    ])
  ])
  align(bottom + right, [
    Yverdon-les-Bains, #datetime.today().display("[day] [month repr:long] [year]")
  ])
  pagebreak(weak: true)

  // ------------------------------------
  // Authentication page
  // ------------------------------------
  heading(level: 1, [Authentication])
  [I hereby certify that I have completed this work and have used no sources other than those expressly mentioned.]
  v(20%)
  table(
    stroke: none,
    columns: (60%, 40%),
    [], [#if author != none { author } else { [] }],
  )
  align(left + bottom, [
    Yverdon-les-Bains, #datetime.today().display("[day] [month repr:long] [year]")
  ])
  pagebreak(weak: true)

  // ------------------------------------
  // Preamble page
  // ------------------------------------
  heading(level: 1, [Preamble])
  [This Bachelor's thesis (hereinafter referred to as TB) is completed at the end of the course of study, with a view to obtaining the title of Bachelor of Science HES-SO in Engineering.]
  v(4%)
  [As an academic work, its content, without prejudice to its value, does not engage the responsibility of the author, the Bachelor's thesis jury, or the School.]
  v(4%)
  [Any use, even partial, of this TB must be made in compliance with copyright law.]
  v(10%)
  table(
    stroke: none,
    columns: (60%, 40%),
    [], [HEIG-VD],
    [], [Head of Department #if department != none { department } else { [] }],
  )
  align(bottom + left, [
    Yverdon-les-Bains, #datetime.today().display("[day] [month repr:long] [year]")
  ])
  pagebreak(weak: true)

  // ------------------------------------
  // Abstract page (only rendered if `abstract:` is set in .qmd front matter)
  // ------------------------------------
  if abstract != none {
    heading(level: 1, [Abstract])
    align(left)[*Bachelor's Thesis #if academic-years != none { academic-years }*]
    align(left)[*Title:* #if title != none { title }]
    if subtitle != none {
      align(left)[*Subtitle:* #subtitle]
    }
    v(5%)
    abstract
    v(5%)
    align(bottom + left, [
      #block(width: 100%, [
        #table(
          stroke: none,
          columns: (35%, 65%),
          [*Student*],    [*#if author != none { author } else { [] }*],
          [], [],
          [*Supervisor*], [#if supervisor != none { supervisor } else { [] }],
        )
      ])
    ])
    pagebreak(weak: true)
  }

  // ------------------------------------
  // Table of Contents
  // ------------------------------------
  heading(level: 1, numbering: none, outlined: false, bookmarked: true)[Table of Contents]
  outline(title: none, depth: 2, indent: 15pt)

  set heading(numbering: "1.1")

  // ------------------------------------
  // Main content
  // ------------------------------------
  doc

  // ------------------------------------
  // Table of figures
  // ------------------------------------
  context {
    let figures = query(figure.where(kind: "quarto-float-fig"))
    if figures.len() != 0 {
      heading(level: 1, numbering: none)[Table of Figures]
      outline(title: none, target: figure.where(kind: "quarto-float-fig"))
    }
  }

  // ------------------------------------
  // List of tables
  // ------------------------------------
  context {
    let tables = query(figure.where(kind: "quarto-float-tbl"))
    if tables.len() != 0 {
      heading(level: 1, numbering: none)[List of Tables]
      outline(title: none, target: figure.where(kind: "quarto-float-tbl"))
    }
  }
}
