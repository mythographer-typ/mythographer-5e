#import "config.typ"
#import "utils/core.typ"
#import "utils/utils.typ"
#import "utils/flex-heading.typ"
#import "utils/lang.typ"

#import "template/heading.typ": setup-heading-rules
#import "template/table.typ": setup-table-rules
#import "template/figure.typ": setup-figure-rules
#import "template/outline.typ": setup-outline-rules
#import "template/footer.typ": setup-footer-rules

#import "external.typ"

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
    footer: setup-footer-rules(self, body),
    footer-descent: -100pt,
  ) if is-first

  lang.setup-transl-lang(self.lang)
  set text(..self.theme.text, lang: self.lang)

  set heading(numbering: "1.")
  show: body => setup-heading-rules(self, body)
  show: body => setup-outline-rules(self, body)
  show: body => setup-table-rules(self, body)
  show: body => setup-figure-rules(self, body)

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
