#import "../utils/core.typ"
#import "../utils/flex-heading.typ"
#import "../external.typ"

#let dnd-image-heading-part(config: (:), img, title-styled, title-unstyled: none) = core.fn-wrapper(self => {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set image(height: 100%, width: 100%, fit: "cover")
  set page(background: img, footer: none)

  heading(depth: 1)[
    #if title-unstyled != none {
      flex-heading.flex-heading(title-styled, title-unstyled)
    } else {
      title-styled
    }
  ]
})

#let dnd-image-heading-section(
  config: (:),
  img,
  depth,
  title-styled,
  offset: 0em,
  title-unstyled: none,
  img-height: auto,
  img-width: auto,
  img-fit: "cover",
  alignment: center,
) = core.fn-wrapper(self => {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  show heading.where(level: 2): it => context {
    align(alignment)[
      #text(..self.theme.heading.level-2.text)[
        #if self.show-chapter {
          [#smallcaps[#external.transl("chapter") #counter(heading).get().last(): #it.body]]
        } else {
          it.body
        }
      ]
    ]
  }

  pagebreak()

  context {
    let page-width = page.width

    set image(fit: img-fit, height: img-height, width: page-width)

    // TODO: find a way to automate this "7.5em"
    place(
      dy: -7.5em,
      top + center,
      img,
    )

    v(measure(img).height - 6.5em)
    v(-offset)
    // TODO: here we may add a "separator" for the heading and the body
  }

  [
    #heading(depth: depth)[
      #if title-unstyled != none {
        flex-heading.flex-heading(title-styled, title-unstyled)
      } else {
        title-styled
      }
    ]
  ]
})
