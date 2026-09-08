#import "config.typ"
#import "core.typ"
#import "utils.typ"

#let dnd-item(config: (:), body) = core.fn-wrapper(self => context {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.theme.item.heading.level-1.text)
    utils.call-if-fn(self.theme.item.heading.level-1.text-style, [#it.body])
    linebreak()
  }

  show heading.where(level: 2): it => {
    set text(..self.theme.item.heading.level-2.text)
    utils.call-if-fn(self.theme.item.heading.level-1.text-style, [#it.body])
  }

  set text(..self.theme.item.text)

  body
})
