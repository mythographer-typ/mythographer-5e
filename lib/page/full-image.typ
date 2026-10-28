#let dnd-image-page(config: (:), img) = core.fn-wrapper(self => {
  panic("not implemented yet")
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set image(height: 100%, width: 100%, fit: "cover")
  set page(background: img, footer: none)

  [a]
  // Maybe reset to standard
})
