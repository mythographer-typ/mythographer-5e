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
