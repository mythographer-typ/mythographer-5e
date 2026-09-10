#import "../process/trait-action-entry.typ": process-trait-action-entry
#import "../process/spellcasting.typ": process-spells
#let render-traits(self, body) = block(above: 0.5em, below: 0.5em)[
  #process-trait-action-entry("trait", body)
  #process-spells(body)
]
