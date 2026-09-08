#import "external.typ"
#import "config.typ"
#import "core.typ"
#import "utils.typ"

#let dnd-dropcap(config: (:), letter, smalcap, body) = core.fn-wrapper(self => {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  external.dropcap(
    ..self.theme.dropcap.text,
  )[#letter #smallcaps[#smalcap] #body]
})
