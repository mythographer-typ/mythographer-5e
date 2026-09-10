// Many thanks to Boondoc: https://codeberg.org/boondoc/5e-spellbooks/src/commit/d58945c95405a05c12341e71897b5e55edd6733f/includes/render.typst#L41

#import "../../external.typ": get, transl
#import "../../utils.typ"

#let regex-5e = (
  dc: regex("\{@dc\s+(\d+)\}"),
  hit: regex("\{@hit\s+(\d+)\}"),
  h: regex("\{@h\}"),
  atk: regex("\{@atk [^}]+}"), // mw: melee weapon, rw: ranged weapon, ms: melee spell, rs: ranged spell. mw,rs is managed by the regex-5e.atk regex
  dice: regex("(?:\d+\s*\()?\{@dice\s+([^}]+)\}\)?"),
  dice-body: regex("\d+d\d+\s*(?:\+\s*\d+)?"),
  dmg: regex("(?:\d+\s*\()?\{@damage\s+([^}]+)\}\)?"),
  spell: regex("\{@spell [^}]+}"), // {@spell <name>}
  item: regex("\{@item [^|}]+(?:|[^}]+)?}"), // {@item <name>} or {@item <name>|<reference>} )
  condition: regex("\{@condition [^}]+}"), //{@condition <name>}
  status: regex("\{@status [^}]+}"), //{@status <name>}
  creature: regex("\{@creature [^}]+}"), //{@creature <name>}
  skill: regex("\{@skill [^}]+}"), //{@skill <name>}
  recharge: regex("\{@recharge(?: \d+)?\}"), //{@recharge <name>}
  quickref: regex("\{@quickref [^}]+}"), //{@quickref <name>}
)



#let process-5etool-tags(body) = {
  show regex-5e.dc: body => {
    let (text,) = body.text.match(regex-5e.dc).captures
    [#transl("dc") #text.find(regex("\d+"))]
  }

  show regex-5e.hit: body => {
    [#body.text.find(regex("\d+"))]
  }

  show regex-5e.h: body => {
    [#transl("hit"): ]
  }

  show regex-5e.atk: body => {
    let atk = body.text.trim("{@atk ").trim("}")
    if atk.contains(",") {
      return transl(atk.split(",").join())
    }
    return transl(atk)
  }

  show regex-5e.dice: body => {
    utils.dnd-dice(body.text.find(regex-5e.dice-body))
  }

  show regex-5e.dmg: body => {
    utils.dnd-dice(body.text.find(regex-5e.dice-body))
  }

  show regex-5e.spell: body => {
    // TODO: possible translate
    [#body.text.trim("{@spell ").trim("}")]
  }

  show regex-5e.item: body => {
    // TODO: possible translate
    [#body.text.trim("{@item ").trim("}").split("|").at(0)]
  }

  show regex-5e.condition: body => {
    // TODO: possible translate
    [#body.text.trim("{@condition ").trim("}")]
  }

  show regex-5e.status: body => {
    // TODO: possible translate
    [#body.text.trim("{@status ").trim("}").split("|").at(-1)]
  }

  show regex-5e.creature: body => {
    // TODO: possible translate
    //       note that the name can have spaces and strange characters. When adding translations this should be taken into account.
    [#body.text.trim("{@creature ").trim("}")]
  }

  show regex-5e.skill: body => {
    [#body.text.trim("{@skill ").trim("}")]
  }

  show regex-5e.recharge: body => {
    // TODO: add translation
    let recharge = body.text.trim("{@recharge").trim("}")

    if recharge.len() > 1 {
      return [(#transl("recharge") #recharge.at(1)-6)]
    } else {
      return [(#transl("recharge") 6)]
    }
  }

  show regex-5e.quickref: body => {
    [#body.text.trim("{@quickref ").trim("}").split("||").at(0)]
  }

  body
}
