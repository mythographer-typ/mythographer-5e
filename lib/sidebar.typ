#import "config.typ"
#import "core.typ"
#import "utils.typ"

/// Formats sidebar.
/// `=` for the sidebar title.
///
/// === Usage:
/// ```typst
/// #dnd-sidebar()[
/// = Behold the DndSidebar!
/// A simple sidebar.
/// ]
/// ```
///
/// === Config structure:
/// ```
/// (
///   background: (fill): background fill color,
///   edge: (fill): edge fill color,
///   heading: (
///     level-1: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///     ),
///   text: (text-fn-arguments): main body text style,
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted readlaoud
///
#let dnd-sidebar(config: (:), float: false, to-bottom: false, body) = core.fn-wrapper(self => {
  self = self.theme.sidebar
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.heading.level-1.text)
    utils.call-if-fn(self.heading.level-1.text-style, [#it.body#linebreak()])
  }

  let custom(title, body) = {
    stack(spacing: 0.3pt)[
      #grid(columns: 3)[
        #polygon(
          fill: self.edge.fill,
          (0em, 0.5em),
          (1em, 0em),
          (1em, 0.5em),
        )
      ][
        #h(1fr)
      ][
        #polygon(
          fill: self.edge.fill,
          (0em, 0.5em),
          (-1em, 0em),
          (-1em, 0.5em),
        )
      ]
    ][
      #box(
        width: 1fr,
        fill: self.background.fill,
        stroke: (
          top: 0.65pt + self.edge.fill,
          bottom: 0.65pt + self.edge.fill,
        ),
        inset: (
          top: 5pt,
          bottom: 5pt,
          left: 8pt,
          right: 8pt,
        ),
      )[
        #set text(..self.text)
        #body
      ]
    ][
      #grid(columns: 3)[
        #polygon(
          fill: self.edge.fill,
          (0em, 0em),
          (1em, 0em),
          (1em, 0.5em),
        )
      ][
        #h(1fr)
      ][
        #polygon(
          fill: self.edge.fill,
          (0em, 0em),
          (-1em, 0em),
          (-1em, 0.5em),
        )
      ]
    ]
  }

  if float {
    if to-bottom {
      place(bottom, float: true)[#v(1fr)#custom(title, body)]
    } else {
      place(auto, float: true)[#custom(title, body)]
    }
  } else {
    custom(title, body)
  }
})

