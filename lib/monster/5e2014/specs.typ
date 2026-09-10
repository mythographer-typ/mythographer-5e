#import "../../external.typ": transl

#import "../process/save-throw.typ"
#import "../process/skill.typ"
#import "../process/senses.typ"
#import "../process/language.typ"
#import "../process/challenge-rating.typ"
#import "../process/vulnerability.typ"
#import "../process/immunity.typ"
#import "../process/resistance.typ"
#import "../process/condition-immunity.typ"
#import "../process/proficiency-bonus.typ"

#let render-trait-if-not-none(self, name, lb: true, body) = {
  if body == none { return }

  let sing-or-plur = "sing"
  if body.amount > 1 {
    sing-or-plur = "plur"
  }

  return [#text(fill: self.heading.level-1.text.fill, weight: self.heading.level-1.text.weight, transl(name, t: sing-or-plur)): #body.proc #if lb { linebreak() }]
}

#let render-specs(self, body) = context block(above: 0.5em, below: 0.5em)[
  #render-trait-if-not-none(self, "saving-throw", save-throw.process-save(body))
  #render-trait-if-not-none(self, "skill", skill.process-skills(body))
  #render-trait-if-not-none(self, "senses", senses.process-senses(body))
  // tool -> not developed
  // gear -> not developed
  #render-trait-if-not-none(self, "languages", language.process-lang(body))
  // Note: code for vulnerability, immunity and resistance, condition-immune is ~the same, they could be merged into one
  #render-trait-if-not-none(self, "vulnerable", vulnerability.process-vulnerability(body))
  #render-trait-if-not-none(self, "immune", immunity.process-immunity(body))
  #render-trait-if-not-none(self, "resist", resistance.process-resistance(body))
  #render-trait-if-not-none(self, "condition-immune", condition-immunity.process-condition-immune(body))
  #render-trait-if-not-none(self, "cr", lb: false, challenge-rating.process-cr(body)) #h(1fr) #render-trait-if-not-none(
    self,
    "proficiency-bonus",
    proficiency-bonus.process-proficiency(body),
  )
]
