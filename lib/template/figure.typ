#import "../utils/utils.typ"

#let setup-figure-rules(self, body) = {
  set figure.caption(position: top)
  show figure.caption: it => {
    set text(..self.theme.table.text)
    set align(left)
    utils.maybe-apply-style(self.theme.table.title.text-style, { it.body })
  }
  [#body]
}
