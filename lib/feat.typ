#import "config.typ"
#import "core.typ"
#import "utils.typ"

#import "external.typ"

#let dnd-feat(config: (:), body) = core.fn-wrapper(self => context {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.theme.feat.heading.level-1.text)

    stack(
      spacing: 3pt,
      utils.call-if-fn(self.theme.feat.heading.level-1.text-style, [#it.body]),
      self.theme.feat.decorative-line,
    )
  }

  show heading.where(level: 2): it => {
    set text(..self.theme.feat.heading.level-2.text)
    utils.call-if-fn(
      self.theme.feat.heading.level-2.text-style,
      [#external.transl("prerequisite"): #it.body],
    )
    linebreak()
  }

  set text(..self.theme.feat.text)

  body
})
