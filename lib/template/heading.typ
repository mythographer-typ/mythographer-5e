#import "../external.typ"
#import "../utils/utils.typ"

#let rule-level-1-heading(self, it) = {
  let parts = counter(heading).get()

  if parts.last() == 0 {
    // If it's the first part
    smallcaps[
      #text(
        ..self.theme.heading.level-1.text,
      )[#it.body #v(-2.3em)]
    ]
    linebreak()
    linebreak()
  } else {
    pagebreak(weak: true, to: self.theme.heading.level-1.to)
    align(center + horizon)[
      #smallcaps[
        #text(
          ..self.theme.heading.level-1.text,
        )[
          #if self.show-part {
            [#external.transl("part") #counter(heading).at(it.location()).last() #linebreak() #it.body]
          } else {
            utils.maybe-apply-style(self.theme.heading.level-1.text-style, { it.body })
          }
        ]
      ]
    ]
  }
}

#let rule-level-2-heading(self, it) = {
  if (
    it.fields().keys().contains("label") and it.label != "dnd-image-heading-section"
      or not it.fields().keys().contains("label")
  ) {
    pagebreak()
  }

  align(left)[
    #text(..self.theme.heading.level-2.text)[
      #if self.show-chapter {
        [#smallcaps[#external.transl("chapter") #counter(heading).at(it.location()).last(): #it.body]]
      } else {
        utils.maybe-apply-style(self.theme.heading.level-2.text-style, { it.body })
      }
    ]
  ]
}

#let rule-level-3-heading(self, it) = {
  text(..self.theme.heading.level-3.text)[
    #utils.maybe-apply-style(self.theme.heading.level-2.text-style, { it.body })
    #linebreak()
  ]
}

#let rule-level-4-heading(self, it) = {
  v(-6pt)
  stack(
    spacing: self.theme.heading.level-4.spacing,
    text(
      ..self.theme.heading.level-4.text,
    )[
      #utils.maybe-apply-style(self.theme.heading.level-4.text-style, { it.body })
    ],
    self.theme.heading.level-4.decorative-line,
    v(-4pt),
  )
}

#let rule-level-5-heading(self, it) = {
  text(..self.theme.heading.level-5.text)[
    #utils.maybe-apply-style(self.theme.heading.level-5.text-style, { it.body })
    #linebreak()
  ]
}

#let rule-level-6-heading(self, it) = {
  v(-0.6em, weak: false)
  set text(..self.theme.heading.level-6.text)
  utils.maybe-apply-style(self.theme.heading.level-6.text-style, { it.body + "." + h(1em, weak: true) })
}

#let rule-level-7-heading(self, it) = {
  v(-0.6em, weak: false)
  h(1em, weak: false)
  set text(..self.theme.heading.level-7.text)
  utils.maybe-apply-style(self.theme.heading.level-7.text-style, { it.body })
}

#let switch-rule(level, self, it) = {
  // [#self]
  if level == 1 {
    if self.use-part {
      rule-level-1-heading(self, it)
    } else {
      rule-level-2-heading(self, it)
    }
  }
  if level == 2 {
    if self.use-part {
      rule-level-2-heading(self, it)
    } else {
      rule-level-3-heading(self, it)
    }
  }
  if level == 3 {
    if self.use-part {
      rule-level-3-heading(self, it)
    } else {
      rule-level-4-heading(self, it)
    }
  }
  if level == 4 {
    if self.use-part {
      rule-level-4-heading(self, it)
    } else {
      rule-level-5-heading(self, it)
    }
  }
  if level == 5 {
    if self.use-part {
      rule-level-5-heading(self, it)
    } else {
      rule-level-6-heading(self, it)
    }
  }
  if level == 6 {
    if self.use-part {
      rule-level-6-heading(self, it)
    } else {
      rule-level-7-heading(self, it)
    }
  }
  if level == 7 {
    rule-level-7-heading(self, it)
  }
}

#let setup-heading-rules(self, body) = {
  show heading.where(level: 1): it => switch-rule(1, self, it)
  show heading.where(level: 2): it => switch-rule(2, self, it)
  show heading.where(level: 3): it => switch-rule(3, self, it)
  show heading.where(level: 4): it => switch-rule(4, self, it)
  show heading.where(level: 5): it => switch-rule(5, self, it)
  show heading.where(level: 6): it => switch-rule(6, self, it)
  show heading.where(level: 7): it => switch-rule(7, self, it)
  [#body]
}
