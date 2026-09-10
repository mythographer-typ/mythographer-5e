#import "config.typ"
#import "core.typ"
#import "utils.typ"

#import "external.typ"

/// Format spells.
///
/// === Usage:
/// ```typst
/// #dnd-spell[Beautiful Typesetting][4th level illusion][1 action][5 feet][S, M][Until dispelled][Spell description]
/// ```
///
/// === Config structure:
/// ```
/// (
///   title: (
///     text: (text-fn-arguments): title text style,
///     text-style: (text-fn-arguments): title text style,
///   ),
///   level: (text: (text-fn-arguments)): level text style,
///   text: (text-fn-arguments): main body text style,
/// )
/// ```
/// - config ():
/// - title ():
/// - level ():
/// - time ():
/// - range ():
/// - components ():
/// - duration ():
/// - body ():
/// -> formatted spell
#let dnd-spell(
  config: (:),
  title,
  level,
  time,
  range,
  components,
  duration,
  body,
) = core.fn-wrapper(self => {
  self = self.theme.spell
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set text(..self.text)

  text(..self.title.text)[
    #utils.call-if-fn(self.title.text-style, [#title])
    #linebreak()
  ]

  text(..self.level.text)[
    #level
    #linebreak()
  ]

  let sing-or-plur = "sing"
  if (components.text.split(regex("[,]")).len() > 1) {
    sing-or-plur = "plur"
  }

  text[*#external.transl("casting-time")*: #time]
  linebreak()
  text[*#external.transl("range")*: #range]
  linebreak()
  text[*#external.transl("component", t: sing-or-plur)*: #components]
  linebreak()
  text[*#external.transl("duration")*: #duration]
  // set par(justify:true, spacing: 0.65em)
  linebreak()
  // TODO: fix this spacing
  // https://staging.typst.app/docs/reference/model/par/#parameters-justification-limits
  body
})
