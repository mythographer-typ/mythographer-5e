// // 15/02/2026
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/bestiary/bestiary.json
// Possible `action` | `bonus` | `reaction` | ? `legendary` data entries are as follows:
//
// array:
//    > dict
//        > name: str | required
//        > entries: array, dict(type, style, items: (list(dict: type, name, entry))) | required
//            > ?
//    > none

#import "regex.typ"


// NOTE: action, actionNote, bonus, bonusNote, reaction, reactionNote -> they may need to be rendered as well!

#let action-title() = {}

#let process-action(key, body) = {
  if not body.keys().contains(key) { return }
  if body.at(key) == none { return }

  let body = body.at(key)

  assert(type(body) == array, message: "Actions are created as arrays!")
  let processed = body.map(act => {
    block(above: 0em, below: 0em)[
      === #act.name
      #(
        act
          .entries
          .map(entry => {
            if type(entry) == str {
              return [#entry]
            }

            if type(entry) == dictionary {
              if entry.keys().contains("type") and entry.at("type") == "list" {
                if entry.keys().contains("items") and type(entry.at("items")) == array {
                  entry
                    .items
                    .map(item => {
                      if item.keys().contains("name") and item.keys().contains("entry") {
                        [
                          #linebreak()
                          ==== #item.name
                          #item.entry
                        ]
                      }
                    })
                    .join()
                }
              }
            }
          })
          .join()
      )
    ]
  })

  return processed.join([#linebreak()])
}
