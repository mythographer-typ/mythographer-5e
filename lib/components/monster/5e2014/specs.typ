#import "../../../external.typ": transl

#import "../process/save-throw.typ"
#import "../process/skill.typ"
#import "../process/senses.typ"
#import "../process/language.typ"
#import "../process/challenge-rating.typ"
#import "../process/imm-res-vul.typ"
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
  // tool -> ignored
  // gear -> ignored
  #render-trait-if-not-none(self, "languages", language.process-lang(body))
  #render-trait-if-not-none(self, "vulnerable", imm-res-vul.process("vul", body))
  #render-trait-if-not-none(self, "immune", imm-res-vul.process("imm", body))
  #render-trait-if-not-none(self, "resist", imm-res-vul.process("res", body))
  #render-trait-if-not-none(self, "condition-immune", imm-res-vul.process("con", body))
  #render-trait-if-not-none(self, "cr", lb: false, challenge-rating.process-cr(body)) #h(1fr) #render-trait-if-not-none(
    self,
    "proficiency-bonus",
    proficiency-bonus.process-proficiency(body),
  )
]
