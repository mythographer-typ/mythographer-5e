// 14/02/2026
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/bestiary/bestiary.json
// Possible `alignment` data entries are as follows:
//
// array:
//    > alignmentEnum
//    > dict
//        > `alignment`: array: alignmentEnum - required
//        > `chance`: int
//        > `note`: string
//    > dict
//        > `special`: string - required

// Possible `alignmentEnum` data entries are:
// alignmentEnum

#import "../../../external.typ": transl

/// Translation is thought so that it looks up to the form of `Alignment` in the specified language.

#let law-order = ("L", "NX", "C")
#let moral-order = ("G", "NY", "E")

#let render-alignment(self, body) = {
  let raw = body.at("alignment", default: none)
  if raw == none { return }

  let alignment = []

  if "U" in raw {
    alignment = transl("U")
  } else if "A" in raw {
    alignment = transl("A")
  } else {
    // split into the two axes
    let law = law-order.filter(t => t in raw)
    let moral = moral-order.filter(t => t in raw)

    // legacy "N": neutral on whichever axis is missing (or both)
    if "N" in raw {
      if law.len() == 0 and moral.len() > 0 { law = ("NX",) } else if moral.len() == 0 and law.len() > 0 {
        moral = ("NY",)
      } else if law.len() == 0 and moral.len() == 0 {
        law = ("NX",)
        moral = ("NY",)
      }
    }

    // an empty axis means "unrestricted"
    if law.len() == 0 { law = law-order }
    if moral.len() == 0 { moral = moral-order }

    let law-full = law.len() == 3
    let moral-full = moral.len() == 3

    if law-full and moral-full {
      alignment = transl("A")
    } else if law.len() == 1 and moral.len() == 1 {
      if law.at(0) == "NX" and moral.at(0) == "NY" {
        alignment = transl("N") // true neutral
      } else {
        alignment = [#transl(law.at(0)) #transl(moral.at(0))]
      }
    } else {
      // generic "any ..." case: key is the concatenated codes,
      // e.g. "CGNYE" = any chaotic, "LNXCNYE" = any non-good
      alignment = transl(law.join() + moral.join())
    }
  }

  if "alignmentPrefix" in body {
    return [#body.alignmentPrefix #alignment]
  }
  return alignment
}
