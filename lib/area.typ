#import "config.typ": default-config
#import "utils.typ"

/// Formats a map or dungeon area with automatic area numbering.
/// Numbering starts at 1 for each new area and resets when dnd-area
/// is called again.
///
/// === Usage:
/// ```typst
/// #dnd-area(config: (:), body)[
///   = Area Name
///   Area description.
///   == Subarea Name
///   Subarea description.
/// ]
/// ```
///
/// === Config structure:
/// ```
/// (
///   heading: (
///     level-1: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///       numbering: (numbering-style),
///     ),
///     level-2: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///       numbering: (numbering-style),
///     ),
///   )
///   text: (text-fn-arguments):
///   decorative-line: line or shape or image. Drawn as-is.
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted area
///
#let dnd-area(config: (:), body) = {
  let self = default-config.theme.area
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
        n = numbering(self.heading.level-1.numbering, n)

        set text(..self.heading.level-1.text)

        stack(
          spacing: 3pt,
          [
            #v(-0.5em)
            #utils.call-if-fn(
              self.heading.level-1.text-style,
              [#n #it.body],
            )
          ],
          self.decorative-line,
        )
      }
    ]
  }

  show heading.where(level: 2): it => {
    [
      #area-counter.step(level: 2)
      #context {
        let n = area-counter.get()
        n = numbering(self.heading.level-2.numbering, n.at(0), n.at(1))

        set text(..self.heading.level-2.text)

        [
          #v(-0.5em)
          #utils.call-if-fn(
            self.heading.level-2.text-style,
            [#n #it.body],
          )
        ]
      }
    ]
  }

  body
}
