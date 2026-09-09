#import "config.typ"
#import "core.typ"
#import "utils.typ"

#let dnd-area(config: (:), body) = core.fn-wrapper(self => context {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  let area-counter = counter("dnd-area")

  // Reset both levels whenever a new dnd-area starts.
  area-counter.update((0, 0))

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    [
      #area-counter.step(level: 1)
      #context {
        let n = area-counter.get().at(0)

        set text(..self.theme.area.heading.level-1.text)

        stack(
          spacing: 3pt,
          [
            #v(-0.5em)
            #utils.call-if-fn(
              self.theme.area.heading.level-1.text-style,
              [#n #it.body],
            )
          ],
          self.theme.area.line,
        )
      }
    ]
  }

  show heading.where(level: 2): it => {
    [
      #area-counter.step(level: 2)
      #context {
        let n = area-counter.get()

        set text(..self.theme.area.heading.level-2.text)

        [
          #v(-0.5em)
          #utils.call-if-fn(
            self.theme.area.heading.level-2.text-style,
            [#n.at(0).#n.at(1) #it.body],
          )
        ]
      }
    ]
  }

  body
})
