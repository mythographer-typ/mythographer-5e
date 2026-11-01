// 01/11/2026
// array
//   dict
//     `name`
//     `entries` -> array
//        str
//
//        `name`: str
//        `entry`: str

#import "regex.typ"

#let process-trait-action-entry(key, body) = {
  if not body.keys().contains(key) { return }
  if body.at(key) == none { return }

  // return (body.at(key))

  if type(body.at(key)) == array {
    let sup_entries = ()
    for sup_entry in body.at(key) {
      let name = sup_entry.name
      let entries = ()
      // name, entries

      for entry in sup_entry.entries {
        // string
        if type(entry) == str {
          entries.push([#entry])
        }
        // dict
        if type(entry) == dictionary {
          if entry.keys().contains("items") {
            entries.push(
              entry
                .items
                .map(item => {
                  [===== #strong(item.name)
                    #item.entry]
                })
                .join(linebreak()),
            )
            // return [#entry]
          }
        }
      }

      sup_entries.push([==== #sup_entry.name:
        #entries.join(linebreak())])
    }
    return sup_entries.join(linebreak())
    // for entry in sup_entries.entries {

    // }

    // if (type(sup_entry.entries.at(0)) == dictionary) {
    // continue
    // }

    // sup_entries.push([==== #sup_entry.name:
    // #sup_entry.entries. #type(sup_entry.entries)])

    return sup_entries.join(linebreak())
  }
  // if type(body.at(key)) == array {
  //   return body
  //     .at(key)
  //     .map(entry => {
  //       if type(entry) == dictionary {
  //         // keys: name <str>, entries <array of str>
  //         [#entry]
  //         // [==== #entry.name #entry.entries.join(", ")]
  //       } else {
  //         panic("not supported entry type: ", type(entry))
  //       }
  //     })
  //     .join(linebreak())
  // }
  panic("not supported entry type: ", type(body.at(key)))
}
