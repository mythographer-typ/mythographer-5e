#import "../external.typ"
#import "../utils.typ"

/// Note: even page on the left, thus align left, odd page on the right, thus align right.
#let footer-template(self, lr: str, chapter-name: str) = {
  let chap-align = left
  let number-dx = self.theme.footer.number.dx
  let number-dy = self.theme.footer.number.dy
  let chapter-dx = self.theme.footer.chapter.dx
  let chapter-dy = self.theme.footer.chapter.dy

  if lr == "left" {
    chap-align = right
    number-dx = -number-dx
    chapter-dx = -chapter-dx
  }

  set image(width: self.theme.footer.image.scale)

  align(
    bottom + center,
    [
      #place(
        chap-align + top,
        dx: number-dx,
        dy: number-dy,
        circle(radius: 12pt, stroke: self.theme.footer.number.debug-circle-fill)[
          #align(center + horizon)[
            #text(
              ..self.theme.footer.number.text,
            )[
              #context counter(page).display("1")
            ]
          ]
        ],
      )
      #place(
        chap-align + top,
        dx: chapter-dx,
        dy: chapter-dy,
        [
          #text(
            ..self.theme.footer.chapter.text,
          )[
            #chapter-name
          ]
        ],
      )
      #self.theme.footer.image.at(lr)
    ],
  )
}


#let setup-footer-rules(self, body) = context {
  {
    let elements = query(selector(heading.where(level: 2, outlined: true)).before(here()))

    if elements.len() > 0 {
      let chapter-name = none
      if self.show-chapter {
        chapter-name = upper([#external.transl("chapter") ] + str(elements.len()) + " | " + elements.last().body)
      } else {
        chapter-name = elements.last().body
      }

      // Format the chapter name
      chapter-name = utils.call-if-fn(self.theme.footer.chapter.text-style, chapter-name)

      // Determine if the current page is even or odd
      let is-even-page = calc.rem(here().page(), 2) == 0

      // Define footer content based on page parity
      let footer-content = if is-even-page {
        footer-template(self, lr: "left", chapter-name: chapter-name)
      } else {
        footer-template(self, lr: "right", chapter-name: chapter-name)
      }

      // Render the footer content
      footer-content
    }
  }
}

// context {
//       {
//         let elements = query(selector(heading.where(level: 2, outlined: true)).before(here()))

//         if elements.len() > 0 {
//           let chapter-name = none
//           if self.show-chapter {
//             chapter-name = upper([#external.transl("chapter") ] + str(elements.len()) + " | " + elements.last().body)
//           } else {
//             chapter-name = elements.last().body
//           }

//           // Format the chapter name
//           chapter-name = utils.call-if-fn(self.theme.footer.chapter.text-style, chapter-name)

//           // Determine if the current page is even or odd
//           let is-even-page = calc.rem(here().page(), 2) == 0

//           // Define footer content based on page parity
//           let footer-content = if is-even-page {
//             footer-template(self, lr: "left", chapter-name: chapter-name)
//           } else {
//             footer-template(self, lr: "right", chapter-name: chapter-name)
//           }

//           // Render the footer content
//           footer-content
//         }
//       }
//     }
