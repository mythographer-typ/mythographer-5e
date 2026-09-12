#import "config.typ"
#import "core.typ"
#import "utils.typ"
#import "flex-heading.typ"
#import "lang.typ"

#import "external.typ"

/// Note: even page on the left, thus align left, odd page on the right, thus align right.
#let footer-template(self, lr: str, chapter-name: str) = {
  let chap-align = left
  let number-dx = self.theme.footer.number.dx
  let number-dy = self.theme.footer.number.dy
  let chapter-dx = self.theme.footer.chapter.dx
  let chapter-dy = self.theme.footer.chapter.dy

  if lr == "left" {
    chap-align = right
    number-dx = -number-dx
    chapter-dx = -chapter-dx
  }

  set image(width: self.theme.footer.image.scale)

  align(
    bottom + center,
    [
      #place(
        chap-align + top,
        dx: number-dx,
        dy: number-dy,
        circle(radius: 12pt, stroke: self.theme.footer.number.debug-circle-fill)[
          #align(center + horizon)[
            #text(
              ..self.theme.footer.number.text,
            )[
              #context counter(page).display("1")
            ]
          ]
        ],
      )
      #place(
        chap-align + top,
        dx: chapter-dx,
        dy: chapter-dy,
        [
          #text(
            ..self.theme.footer.chapter.text,
          )[
            #chapter-name
          ]
        ],
      )
      #self.theme.footer.image.at(lr)
    ],
  )
}


#let dnd-template(
  is-first: true,
  title-page: none,
  ..args,
  body,
) = {
  let args = (config.default-config-14,) + args.pos()
  let self = utils.merge-dicts(..args)

  set document(
    ..(
      if type(self.title) in (str, content) {
        (title: self.title)
      }
    ),
    ..(
      if type(self.author) in (str, array) {
        (author: self.author)
      } else if type(self.author) == content {
        (author: self.author.map(author => author.name))
      }
    ),
    ..(
      if type(self.date) in (datetime,) {
        (date: self.date)
      }
    ),
  )

  set page(
    ..self.page,
    footer: context {
      {
        let elements = query(selector(heading.where(level: 2, outlined: true)).before(here()))

        if elements.len() > 0 {
          let chapter-name = none
          if self.show-chapter {
            chapter-name = upper([#external.transl("chapter") ] + str(elements.len()) + " | " + elements.last().body)
          } else {
            chapter-name = elements.last().body
          }

          // Format the chapter name
          chapter-name = utils.call-if-fn(self.theme.footer.chapter.text-style, chapter-name)

          // Determine if the current page is even or odd
          let is-even-page = calc.rem(here().page(), 2) == 0

          // Define footer content based on page parity
          let footer-content = if is-even-page {
            footer-template(self, lr: "left", chapter-name: chapter-name)
          } else {
            footer-template(self, lr: "right", chapter-name: chapter-name)
          }

          // Render the footer content
          footer-content
        }
      }
    },
    footer-descent: -100pt,
  ) if is-first

  // external.transl(data: eval(external.fluent("l10n/", lang: ("en", self.page.lang))))

  // external.transl(data: read("l10n/it.ftl"), lang: "it")
  // external.transl(data: read("l10n/en.ftl"), lang: "en")
  lang.setup-transl-lang(self.lang)

  // set text(
  // font: self.theme.text.font,
  // size: self.theme.text.size,
  // weight: self.theme.text.weight,
  // fill: self.theme.text.fill,
  // hyphenate: true,
  // tracking: -0.2pt,
  // lang: self.page.lang,
  // overhang: true
  // )
  set text(..self.theme.text, lang: self.lang)

  // // set par(leading: 0.9pt)

  // ////////////////////////////////////////////
  // ////////////////////////////////////////////
  // // HEADERS

  set heading(numbering: "1.")
  show heading.where(level: 1): it => {
    let parts = counter(heading).get()

    if parts.last() == 0 {
      smallcaps[
        #text(
          ..self.theme.heading.level-1.text,
        )[#it.body #v(-2.3em)]
      ]
      linebreak()
      linebreak()
    } else {
      pagebreak(weak: true, to: self.theme.heading.level-1.to)
      align(center + horizon)[
        #smallcaps[
          #text(
            ..self.theme.heading.level-1.text,
          )[
            #if self.show-part {
              [#external.transl("part") #counter(heading).at(it.location()).last() #linebreak() #it.body]
            } else {
              utils.maybe-apply-style(self.theme.heading.level-1.text-style, { it.body() })
            }
          ]
        ]
      ]
    }
  }

  show heading.where(level: 2): it => {
    if (
      it.fields().keys().contains("label") and it.label != "dnd-image-heading-section"
        or not it.fields().keys().contains("label")
    ) {
      pagebreak()
    }

    align(left)[
      #text(
        ..self.theme.heading.level-2.text,
        // font: self.headers.level-2.font,
        // weight: self.headers.level-2.weight,
        // size: self.headers.level-2.size,
        // stroke: self.headers.level-2.stroke,
        // fill: self.headers.level-2.fill,
      )[
        #if self.show-chapter {
          [#smallcaps[#external.transl("chapter") #counter(heading).at(it.location()).last(): #it.body]]
        } else {
          utils.maybe-apply-style(self.theme.heading.level-2.text-style, { it.body })
        }
      ]
    ]
  }

  show heading.where(level: 3): it => {
    text(
      ..self.theme.heading.level-3.text,
    )[
      #utils.maybe-apply-style(self.theme.heading.level-2.text-style, { it.body })
      #linebreak()
    ]
  }

  show heading.where(level: 4): it => {
    v(-6pt)
    stack(
      spacing: self.theme.heading.level-4.spacing,
      text(
        ..self.theme.heading.level-4.text,
      )[
        #utils.maybe-apply-style(self.theme.heading.level-4.text-style, { it.body })
      ],
      self.theme.heading.level-4.decorative-line,
      v(-4pt),
    )
  }

  show heading.where(level: 5): it => {
    text(..self.theme.heading.level-5.text)[
      #utils.maybe-apply-style(self.theme.heading.level-5.text-style, { it.body })
      #linebreak()
    ]
  }

  show heading.where(level: 6): it => {
    v(-0.6em, weak: false)
    set text(..self.theme.heading.level-6.text)
    utils.maybe-apply-style(self.theme.heading.level-6.text-style, { it.body + "." + h(1em, weak: true) })
  }

  show heading.where(level: 7): it => {
    v(-0.6em, weak: false)
    h(1em, weak: false)
    set text(..self.theme.heading.level-7.text)
    utils.maybe-apply-style(self.theme.heading.level-7.text-style, { it.body })
  }

  ////////////////////////////////////////////
  ////////////////////////////////////////////
  /// OUTLINE

  let indent = (
    "1": 0em,
    "2": 1em,
    "3": 2em,
    "4": 3em,
    "5": 4em,
    "6": 5em,
    "7": 6em,
  )

  let indent-outline(level) = {
    if self.theme.outline.indent {
      if not self.using-parts {
        h(indent.at(str(level - 1)))
      } else {
        h(indent.at(str(level)))
      }
    }
  }

  let show-lower-outlines(it, outline-text) = {
    (
      indent-outline(it.level) + outline-text + self.theme.outline.repeated-sequence + it.page() + linebreak()
    )
  }

  show outline.entry: it => {
    link(
      it.element.location(),
      [
        #if it.level == 1 {
          let part-num = counter(heading).at(it.element.location())
          stack(
            spacing: 3pt,
            text(..self.theme.outline.heading.level-1.text)[
              #if self.show-part {
                utils.maybe-apply-style(self.theme.outline.heading.level-1.text-style, {
                  [#external.transl("part") #str(part-num.last()): #it.body()]
                })
              } else {
                utils.maybe-apply-style(self.theme.outline.heading.level-1.text-style, { it.body() })
              }
            ],
            self.theme.outline.decorative-spacer,
            // line(
            //   stroke: (
            //     paint: self.outline.line.fill,
            //     thickness: self.outline.line.thickness,
            //   ),
            //   length: 100%,
            // ),
          )
        } else if it.level == 2 {
          let ch-num = counter(heading).at(it.element.location())

          v(12pt, weak: true)
          indent-outline(it.level)

          utils.maybe-apply-style(self.theme.outline.heading.level-2.text-style, {
            text(..self.theme.outline.heading.level-2.text)[
              #if self.show-chapter {
                [#external.transl("chapter", t: "short") #ch-num.last(): ]
              }
              #it.body()
              #self.theme.outline.repeated-sequence
              // #box(width: 1fr, repeat([#self.outline.repeated-symbol], gap: 0.15em, justify: true))
              #it.page()
              #linebreak()
            ]
          })
        } else if it.level == 3 {
          set text(
            ..self.theme.outline.heading.level-3.text,
          )
          let outline-text = utils.maybe-apply-style(self.theme.outline.heading.level-3.text-style, { it.body() })
          show-lower-outlines(it, outline-text)
        } else if it.level == 4 {
          let outline-text = utils.maybe-apply-style(self.theme.outline.heading.level-4.text-style, { it.body() })
          show-lower-outlines(it, outline-text)
        } else if it.level == 5 {
          let outline-text = utils.maybe-apply-style(self.theme.outline.heading.level-5.text-style, { it.body() })
          show-lower-outlines(it, outline-text)
        } else {
          (
            indent-outline(it.level) + it.body() + self.theme.outline.repeated-sequence + it.page() + linebreak()
          )
        }
      ],
    )
  }

  show table.cell.where(y: 0): set text(..self.theme.table.header.text)
  show table.cell: set align(left)
  show table: set text(..self.theme.table.text)
  set table(
    fill: (none_, y) => if calc.odd(y) { self.theme.table.cell.primary.fill } else {
      if y > 1 { self.theme.table.cell.secondary.fill }
    },
    stroke: none,
  )

  // FIGURE CONFIG
  set figure.caption(position: top)
  show figure.caption: it => {
    set text(..self.theme.table.text)
    set align(left)
    utils.maybe-apply-style(self.theme.table.title.text-style, { it.body })
  }

  show: core.show-content-with-warp.with(self: self, is-first-slide: false)

  body
}

#let show-outline(n-cols: 2, do-pagebreak: true, balance-columns: false) = {
  show outline: it => {
    flex-heading.in-outline.update(true)
    it
    flex-heading.in-outline.update(false)
  }

  if (do-pagebreak == true) {
    pagebreak()
  }

  let l-outline = columns(n-cols)[
    #outline()
  ]

  if balance-columns {
    utils.columns-balance(
      n-cols: n-cols,
      l-outline,
    )
  } else {
    l-outline
  }

  set page(columns: 1)
}

#let dnd-par(
  config: (:),
  body,
) = core.fn-wrapper(self => {
  [====== #body]
})

#let dnd-subpar(body) = core.fn-wrapper(self => {
  [======= #body]
})

#let dnd-image-page(config: (:), img) = core.fn-wrapper(self => {
  panic("not implemented yet")
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set image(height: 100%, width: 100%, fit: "cover")
  set page(background: img, footer: none)

  [a]
  // Maybe reset to standard
})

#let dnd-image-heading-part(config: (:), img, title-styled, title-unstyled: none) = core.fn-wrapper(self => {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set image(height: 100%, width: 100%, fit: "cover")
  set page(background: img, footer: none)

  heading(depth: 1)[
    #if title-unstyled != none {
      flex-heading.flex-heading(title-styled, title-unstyled)
    } else {
      title-styled
    }
  ]
})

#let dnd-image-heading-section(
  config: (:),
  img,
  depth,
  title-styled,
  offset: 0em,
  title-unstyled: none,
  img-height: auto,
  img-width: auto,
  img-fit: "cover",
  alignment: center,
) = core.fn-wrapper(self => {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  show heading.where(level: 2): it => context {
    align(alignment)[
      #text(..self.theme.heading.level-2.text)[
        #if self.show-chapter {
          [#smallcaps[#external.transl("chapter") #counter(heading).get().last(): #it.body]]
        } else {
          it.body
        }
      ]
    ]
  }

  pagebreak()

  context {
    let page-width = page.width

    set image(fit: img-fit, height: img-height, width: page-width)

    // TODO: find a way to automate this "7.5em"
    place(
      dy: -7.5em,
      top + center,
      img,
    )

    v(measure(img).height - 6.5em)
    v(-offset)
    // TODO: here we may add a "separator" for the heading and the body
  }

  [
    #heading(depth: depth)[
      #if title-unstyled != none {
        flex-heading.flex-heading(title-styled, title-unstyled)
      } else {
        title-styled
      }
    ]<dnd-image-heading-section>
  ]
})
