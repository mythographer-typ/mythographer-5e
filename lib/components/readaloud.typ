#import "../utils/core.typ"
#import "../utils/utils.typ"

// 03/02/2026 - full rewrite heavily inspired by https://github.com/yanwenywan/typst-packages/blob/master/wenyuan-campaign/0.1.2/campaign.typ

/// Formats readlaoud.
/// Usually you would use `=` once for the prerequsites and `==` for the item name. Then the rest of the text is the description of the feat. No limit on the number of `=` or `==` you can use, but it is recommended to use only one of each for clarity.
///
/// === Usage:
/// ```typst
///  #dnd-readaloud[
///  A read aloud.
///  ]
/// ```
///
/// === Config structure:
/// ```
/// (
///   block: (block-fn-arguments): block style,
///   corner: (
///    dx: (length),
///    dy: (length),
///    radius: (length),
///    draw: (block-fn-arguments),
///   ),
///   text: (text-fn-arguments): main body text style,
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted readlaoud
///
#let dnd-readaloud(config: (:), body) = core.fn-wrapper(self => {
  self = self.theme.readaloud

  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set text(..self.text)

  // take from inset (?) todo check
  let corner(alignment, dx-mod: 1, dy-mod: 1) = place(
    alignment,
    dx: dx-mod * (self.corner.dx + self.corner.radius),
    dy: dy-mod * (self.corner.dy + self.corner.radius),
    self.corner.draw,
  )

  block(..self.block)[
    #corner(top + left, dx-mod: -1, dy-mod: -1)
    #corner(top + right, dx-mod: 1, dy-mod: -1)

    #body

    #corner(bottom + left, dx-mod: -1, dy-mod: 1)
    #corner(bottom + right, dx-mod: 1, dy-mod: 1)
  ]
})
