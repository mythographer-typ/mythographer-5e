#import "../utils/utils.typ"
#import "../external.typ"

#let indent = (
  "1": 0em,
  "2": 1em,
  "3": 2em,
  "4": 3em,
  "5": 4em,
  "6": 5em,
  "7": 6em,
)

#let indent-outline(self, level) = {
  if self.theme.outline.indent {
    h(indent.at(str(level)))
  }
}

#let show-lower-outlines(self, it, outline-text) = {
  (
    indent-outline(self, it.level) + outline-text + self.theme.outline.repeated-sequence + it.page() + linebreak()
  )
}

#let rule-level-1(self, it) = {
  let part-num = counter(heading).at(it.element.location())
  stack(
    spacing: 3pt,
    text(..self.theme.outline.heading.level-1.text)[
      #if self.show-part {
        utils.maybe-apply-style(self.theme.outline.heading.level-1.text-style, {
          [#external.transl("part") #str(part-num.last()): #it.body()]
        })
      } else {
        utils.maybe-apply-style(self.theme.outline.heading.level-1.text-style, { it.body() })
      }
    ],
    self.theme.outline.decorative-spacer,
  )
  v(-0.7em)
}

#let rule-level-2(self, it) = {
  let ch-num = counter(heading).at(it.element.location())
  indent-outline(self, it.level)

  utils.maybe-apply-style(self.theme.outline.heading.level-2.text-style, {
    text(..self.theme.outline.heading.level-2.text)[
      #if self.show-chapter {
        [#external.transl("chapter", t: "short") #ch-num.last(): ]
      }
      #it.body()
      #self.theme.outline.repeated-sequence
      #it.page()
      #linebreak()
    ]
  })
}

#let rule-level-3(self, it) = {
  set text(
    ..self.theme.outline.heading.level-3.text,
  )
  let outline-text = utils.maybe-apply-style(self.theme.outline.heading.level-3.text-style, { it.body() })
  show-lower-outlines(self, it, outline-text)
}

#let rule-level-4(self, it) = {
  let outline-text = utils.maybe-apply-style(self.theme.outline.heading.level-4.text-style, { it.body() })
  show-lower-outlines(self, it, outline-text)
}

#let rule-level-5(self, it) = {
  let outline-text = utils.maybe-apply-style(self.theme.outline.heading.level-5.text-style, { it.body() })
  show-lower-outlines(self, it, outline-text)
}

#let rule-level-6(self, it) = {
  indent-outline(self, 6) + it.body() + self.theme.outline.repeated-sequence + it.page() + linebreak()
}

#let rule-level-7(self, it) = {
  indent-outline(self, 7) + it.body() + self.theme.outline.repeated-sequence + it.page() + linebreak()
}

#let switch-rule(level, self, it) = {
  // [#self]
  if level == 1 {
    if self.use-part {
      rule-level-1(self, it)
    } else {
      rule-level-2(self, it)
    }
  }
  if level == 2 {
    if self.use-part {
      rule-level-2(self, it)
    } else {
      rule-level-3(self, it)
    }
  }
  if level == 3 {
    if self.use-part {
      rule-level-3(self, it)
    } else {
      rule-level-4(self, it)
    }
  }
  if level == 4 {
    if self.use-part {
      rule-level-4(self, it)
    } else {
      rule-level-5(self, it)
    }
  }
  if level == 5 {
    if self.use-part {
      rule-level-5(self, it)
    } else {
      rule-level-6(self, it)
    }
  }
  if level == 6 {
    if self.use-part {
      rule-level-6(self, it)
    } else {
      rule-level-7(self, it)
    }
  }
  if level == 7 {
    rule-level-7(self, it)
  }
}

#let setup-outline-rules(self, body) = {
  show outline.entry.where(level: 1): it => switch-rule(1, self, it)
  show outline.entry.where(level: 2): it => switch-rule(2, self, it)
  show outline.entry.where(level: 3): it => switch-rule(3, self, it)
  show outline.entry.where(level: 4): it => switch-rule(4, self, it)
  show outline.entry.where(level: 5): it => switch-rule(5, self, it)
  show outline.entry.where(level: 6): it => switch-rule(6, self, it)
  show outline.entry.where(level: 7): it => switch-rule(7, self, it)
  [#body]
}
