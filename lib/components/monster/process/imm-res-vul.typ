// 30/10/26
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/bestiary/bestiary.json
// Possible 'immune', 'resist', 'vulnerable' data entries are as follows:
//
// immune -> conditionImmunityArray
// immune -> damageImmunityArray
// resist -> damageResistArray
// vulnerable -> damageVulnerabilityArray
//
// conditionImmunityArray | damageResistArray | damageVulnerabilityArray <array>
//    > array
//       > dataCondition
//       > dict
//           > `special`: string - required
//       > dict
//           > `preNote`: string
//           > `immune` | `resist` | `vulnerable` : <array> - required
//           > `note`: string

#import "../utils.typ"
#import "../process/enum.typ"

#let switch(call) = {
  // assert(call in ("con", "imm", "res", "vul"), "call must be either 'imm', 'res', or 'vul'")

  if call == "con" {
    return (
      bodyKey: "conditionImmune",
      internalKey: "immune",
      _enum: enum.data-condition,
      tKey: "data-condition",
    )
  }

  if call == "res" {
    return (
      bodyKey: "resist",
      internalKey: "resist",
      _enum: enum.data-damage-type,
      tKey: "damage-type",
    )
  }

  if call == "vul" {
    return (
      bodyKey: "vulnerable",
      internalKey: "vulnerable",
      _enum: enum.data-damage-type,
      tKey: "damage-type",
    )
  }

  if call == "imm" {
    return (
      bodyKey: "immune",
      internalKey: "immune",
      _enum: enum.data-damage-type,
      tKey: "damage-type",
    )
  }
}

/// - call (con, imm, res, vul): either "immune", "resist", or "vulnerable"
#let process(call, body) = {
  let (bodyKey, internalKey, _enum, tKey) = switch(call)

  if not body.keys().contains(bodyKey) { return }

  assert(type(body.at(bodyKey)) == array)

  let imm-str = ()
  let imm-dic = ()

  for _case in body.at(bodyKey) {
    if type(_case) == str {
      // string
      imm-str.push(utils.translate-t-word-if-possible(tKey, _case, _enum))
    } else if type(_case) == dictionary {
      // dictionary
      let curr-imm = ()
      let imm-keys = _case.keys()

      if imm-keys.contains("special") {
        imm-dic.push(utils.capitalize(_case.special))
        continue
      }

      if imm-keys.contains("preNote") { curr-imm.push(utils.capitalize(_case.preNote)) }
      curr-imm.push(
        _case
          .at(internalKey)
          .map(a => {
            utils.translate-t-word-if-possible(tKey, a, _enum)
          })
          .join(", "),
      )
      if imm-keys.contains("note") { curr-imm.push(_case.note) }
      if imm-keys.contains("cond") {}
      imm-dic.push(curr-imm.join(" "))
    } else {
      panic("this shouldn't exist")
    }
  }
  let processed = imm-str.join(", ")
  if imm-dic.len() > 0 {
    // imm-dic.insert(0, processed)
    processed = imm-dic.flatten()
    return (proc: processed.join("; "), amount: processed.len())
  }

  return (proc: (processed), amount: 1)
}
