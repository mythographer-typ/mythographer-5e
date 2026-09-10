#import "core.typ"
#import "utils.typ"

// WARING: removed `context`

/// Formats items.
/// `=` for the item name, `==` for the item type, and the rest of the text is the description of the item. No limit on the number of `=` or `==` you can use.
///
/// === Usage:
/// ```typst
///  #dnd-item[
///    = Foo's Quill
///    == Wondrous item, rare
///    The quill has 3 charges.
///  ]
/// ```
///
/// === Config structure:
/// ```
/// (
///   heading: (
///     level-1: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///     ),
///    level-2: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///     ),
///   ),
///   text: (text-fn-arguments): main body text style,
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted item
///

#let dnd-item(config: (:), body) = core.fn-wrapper(self => {
  self = self.theme.item
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.heading.level-1.text)
    utils.call-if-fn(self.heading.level-1.text-style, [#it.body])
    linebreak()
  }

  show heading.where(level: 2): it => {
    set text(..self.heading.level-2.text)
    utils.call-if-fn(self.heading.level-1.text-style, [#it.body])
  }

  set text(..self.text)

  body
})
