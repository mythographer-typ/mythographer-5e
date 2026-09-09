#import "config.typ"
#import "core.typ"
#import "utils.typ"

#let dnd-comment(config: (:), title, body) = core.fn-wrapper(self => {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  block(..self.theme.commentbox.background)[
    #set text(..self.theme.commentbox.title.text)
    #utils.call-if-fn(self.theme.commentbox.title.text-style, [#title])
    #set text(..self.theme.commentbox.text)
    #v(-5pt)
    #body
  ]
})
