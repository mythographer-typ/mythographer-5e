#import "../utils.typ": call-if-fn

#import "utils.typ": capitalize, translate-top-level-word-if-possible
#import "visual.typ": triangle-bar

#import "5e2014/name.typ": render-name
#import "5e2014/size-type.typ": render-size-type
#import "5e2014/alignment.typ": render-alignment
#import "5e2014/armor-class.typ": render-ac
#import "5e2014/hit-points.typ": render-hp
#import "5e2014/speed.typ": render-speed
#import "5e2014/ability-modifiers.typ": render-abilities
#import "5e2014/specs.typ": render-specs
#import "5e2014/traits.typ": render-traits
#import "5e2014/act-bon-react.typ": render-act-bon-react, render-legendary-action
#import "process/shortname.typ": compute-shortname

#let bar-5e2014(self, alignment, dx-mod: 1, dy-mod: 1) = place(
  alignment,
  dx: dx-mod * (1em + 2pt),
  dy: dy-mod * (1em + 2pt),
  rect(
    fill: self.theme.monster.ribbon.fill,
    stroke: (top: 0.5pt + black, bottom: 0.5pt + black),
    height: 4pt,
    width: 100% + 2em,
  ),
)


#let monster-5e2014(self, body) = {
  set text(..self.text)
  // Monster Name
  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.heading.level-1.text)
    call-if-fn(self.heading.level-1.text-style, it.body)
  }

  // Heading w/RedBar (Actions/BonusActions/Reactions/Legendary/Mythic)
  show heading.where(level: 2): it => {
    set text(..self.heading.level-2.text)

    block(breakable: false)[#call-if-fn(self.heading.level-2.text-style, it.body)
      #v(-12pt)
      #self.heading.level-2.decorative-line]
  }

  // Specs
  show heading.where(level: 3): it => {
    set text(..self.heading.level-3.text)
    call-if-fn(self.heading.level-3.text-style, it.body) + ":"
  }

  // Spells/Traits/Actions
  show heading.where(level: 4): it => {
    set text(..self.heading.level-4.text)
    call-if-fn(self.heading.level-4.text-style, it.body) + "."
  }

  // Add short name as it's needed e.g. in `legendary action headers`
  let body = compute-shortname(body)
  [
    #render-name(self, body)
    #linebreak()
    #render-size-type(self, body), #render-alignment(self, body) #linebreak()
    #triangle-bar(self)
    // AC HP SPEED
    #render-ac(self, body) #linebreak()
    #render-hp(self, body) #linebreak()
    #render-speed(self, body) #linebreak()
    #triangle-bar(self)
    // // ABILITY SCORES
    #render-abilities(self, body)
    #triangle-bar(self)
    // // SPECS
    #render-specs(self, body)
    #triangle-bar(self)
    // // TRAITS + SPELLCASTING
    #render-traits(self, body)
    // // ACTIONS - BONUS - REACTIONS (they have the same structure)
    #render-act-bon-react(self, "action", body)
    #render-act-bon-react(self, "reaction", body)
    #render-act-bon-react(self, "bonus", body)
    // // // LEGENDARY - very similar to actions. Wrapper to add custom heading.
    #render-legendary-action(self, body)
    #render-act-bon-react(self, "mythic", body)
  ]
}
