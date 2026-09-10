#import "core.typ"
#import "utils.typ"

/// Formats comments.
///
/// === Usage:
/// ```typst
/// #dnd-comment[
///   = This is a comment box!
///   A `dnd-comment` is a box for minimal highlighting of text.
///   It lacks the ornamentation of `dnd-sidebar`, but it can
///   be broken across columns.
/// ]
/// ```
///
/// === Config structure:
/// ```
/// (
///   background: (block-fn-arguments): background block style,
///   heading: (
///     level-1: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///     ),
///   ),
///   text: (text-fn-arguments): main body text style,
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted comment
///
#let dnd-comment(config: (:), body) = core.fn-wrapper(self => {
  self = self.theme.commentbox
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.heading.level-1.text)
    utils.call-if-fn(self.heading.level-1.text-style, [#it.body])
    linebreak()
  }

  block(..self.background)[
    #set text(..self.text)
    #body
  ]
})
