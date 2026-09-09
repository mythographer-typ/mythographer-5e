#import "config.typ": default-config
#import "core.typ"
#import "utils.typ"

// 03/02/2026 - full rewrite heavily inspired by https://github.com/yanwenywan/typst-packages/blob/master/wenyuan-campaign/0.1.2/campaign.typ

#let dnd-readaloud(config: (:), body) = {
  let self = default-config

  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set text(..self.theme.readaloud.text)

  // take from inset (?) todo check
  let corner(alignment, dx-mod: 1, dy-mod: 1) = place(
    alignment,
    dx: dx-mod * (self.theme.readaloud.corner.dx + self.theme.readaloud.corner.radius),
    dy: dy-mod * (self.theme.readaloud.corner.dy + self.theme.readaloud.corner.radius),
    self.theme.readaloud.corner.draw,
  )

  block(..self.theme.readaloud.block)[
    #corner(top + left, dx-mod: -1, dy-mod: -1)
    #corner(top + right, dx-mod: 1, dy-mod: -1)

    #body

    #corner(bottom + left, dx-mod: -1, dy-mod: 1)
    #corner(bottom + right, dx-mod: 1, dy-mod: 1)
  ]
}
