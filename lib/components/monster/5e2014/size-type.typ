// 14/02/2026
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/bestiary/bestiary.json
// Possible `size` data entries are as follows:
//
// for higher compatibility I'm taking the `ifBrew` branch (which is compatible with both `site` and `ua`)
//// SIZE - sizeEnum
// array:
//    string:enum  > "F", "D", "T", "S", "M", "L", "H", "G", "C", "V"
//
// - F: Fine
// - D: Diminutive
// - T: Tiny
// - S: Small
// - M: Medium
// - L: Large
// - H: Huge
// - G: Gargantuan
// - C: Colossal
// - V: Varies


//// TYPE
// dict:
//    > `type`
//        > creatureType
//        > string
//        > dict
//            > `properties`: array - required
//                > creatureType
//            > `properties`: dict
//                > `tag`: str - required
//                > `prefix`: str - required
//                > prefixHidden: bool
//    > `swarmSize`
//      > sizeEnum
//    > `sidekickType`    -> ignored at the moment
//    > sidekickTags      -> ignored
//    -> sidekickHidden`  -> ignored

// creatureType
// string:enum > "aberration", "beast", "celestial", "construct", "dragon", "elemental", "fey", "fiend", "giant", "humanoid", "monstrosity", "ooze", "plant", "undead"


#import "../../../external.typ": get, transl
#import "../utils.typ": capitalize
#import "../../../utils/utils.typ": to-string


#let render-size-type(self, body) = context {
  if (not body.keys().contains("size")) { return }
  if (not body.keys().contains("type")) { return }

  let mtype = ""
  if type(body.type) == str {
    mtype = body.type
  } else if type(body.type) == dictionary {
    mtype = body.type.type
  }

  let beast_size = none
  if body.size.len() > 1 {
    // beast_size = transl("creature-description", msize: body.size.last(), mtype: mtype)
    best_size = transl("creature", mtype: mtype, msize: body.size.last(), count: "one")
    let body1 = body
    body1.pop()
    beast_size = [#beast_size #body1.map(size => get.text(transl("msize", msize: size)))]
  } else {
    // beast_size = transl("creature-description", msize: body.size.last(), mtype: mtype)
    beast_size = transl("creature", mtype: mtype, msize: body.size.last(), count: "one")
  }

  if (type(body.type) == dictionary) {
    if body.type.keys().contains("tags") {
      // dict
      /// tags
      if type(body.type.tags) == array {
        let tags = ()
        for entry in body.type.tags {
          if type(entry) == str {
            tags.push([#capitalize(entry)])
          } else {
            let tag = entry.tag
            let prefix = ""

            if entry.keys().contains("prefix") {
              prefix = entry.prefix
            }
            if entry.keys().contains("prefixHidden") and entry.prefixHidden == true {
              // TODO: discover what's covered and translate...
              // Maybe SRD races and a "failsafe" translation for the rest
              tags.push([#capitalize(tag)])
            } else {
              tags.push([#capitalize(prefix) #capitalize(tag)])
            }
          }
        }
        tags = tags.join(", ")
        // TODO: check how to translate :)
        // 114,115
        return [#beast_size (#tags)]
      }

      // TODO: idk which idxes, check translation
      return [#beast_size (#body.type.tags.map(tags => (capitalize(tags))).join(", "))]
    }

    if body.type.keys().contains("swarmSize") {
      context {
        let inner = transl(
          "creature",
          mtype: mtype,
          msize: body.type.swarmSize,
          gender: transl("gender", mtype: mtype, mode: str),
          mode: str,
        )

        return transl(
          "swarm",
          msize: body.size.last(),
          count: "one",
          gender: transl("gender", mtype: "swarm", mode: str),
          inner: inner,
        )
      }
    }
    // dict
    //    type: str
    //    tags: list
    //          (show in brackets)
    //    TODO: swarmSize --- NOT SUPPORTED YET
    //    TODO: sidekickType --- NOT SUPPORTED YET
    //    TODO: sidekickTags --- NOT SUPPORTED YET
    //    TODO: sidekickHidden --- NOT SUPPORTED YET
  } else {
    return beast_size
  }
}
