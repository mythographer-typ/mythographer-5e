#import "config.typ"
#import "core.typ"
#import "utils.typ"

#let dnd-area(config: (:), body) = core.fn-wrapper(self => context {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  let dnd-area-counter = counter("dnd-area")
  let dnd-area-counter1 = counter("dnd-area1")

  dnd-area-counter.update(0)
  dnd-area-counter1.update(0)

  dnd-area-counter.step()
  dnd-area-counter1.step()

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    dnd-area-counter.step()
    dnd-area-counter1.update(1)

    set text(..self.theme.area.heading.level-1.text)

    stack(
      spacing: 3pt,
      [
        #v(-0.5em)#utils.call-if-fn(self.theme.area.heading.level-1.text-style, [#(
            dnd-area-counter.at(it.location()).last()
          ) #it.body])
      ],
      self.theme.area.line,
    )
  }

  show heading.where(level: 2): it => {
    dnd-area-counter1.step()

    set text(..self.theme.area.heading.level-2.text)

    [
      #v(-0.5em)#utils.call-if-fn(self.theme.area.heading.level-2.text-style, [#(
          numbering("1.", dnd-area-counter.at(it.location()).last() - 1)
        )#(numbering("a", dnd-area-counter1.at(it.location()).last())) #it.body]) #linebreak()
    ]
  }

  body
})
