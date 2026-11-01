part = Part

chapter = { $t ->
  *[sing] Chapter
   [plur] Chapter
   [short] Ch.
}

## Spell
casting-time = Casting Time
range = Range
component = { $t ->
  *[sing] Component
   [plur] Components
}
duration = duration

## Feat
prerequisite = Prerequisite


###############################################
##### Monster
## Contract (every locale must provide these messages):
##   gender   ($mtype)                            -> grammar token for the noun, passed back as $gender
##   creature ($mtype, $msize, $count, $gender)  -> "<size> <type>"
##   swarm    ($msize, $count, $gender, $inner)  -> "<size> swarm of <inner>"
##     $inner is a creature phrase the code already built (plural, with the swarm's creature size)
##     the code calls gender/swarm with mtype "swarm" and count 1
## Helper messages (size, type, swarm-noun) may be restructured freely.

# English has no grammatical gender.
gender = n

## Size: F D T S M L H G C V
size =
    { $msize ->
        [F] Fine
        [D] Diminutive
        [T] Tiny
        [S] Small
        [M] Medium
        [L] Large
        [H] Huge
        [G] Gargantuan
        [C] Colossal
        [V] Varies
       *[other] Unknown
    }

## Type noun, singular/plural via $count
type =
    { $mtype ->
        [aberration]
            { $count ->
                [one] aberration
               *[other] aberrations
            }
        [beast]
            { $count ->
                [one] beast
               *[other] beasts
            }
        [celestial]
            { $count ->
                [one] celestial
               *[other] celestials
            }
        [construct]
            { $count ->
                [one] construct
               *[other] constructs
            }
        [dragon]
            { $count ->
                [one] dragon
               *[other] dragons
            }
        [elemental]
            { $count ->
                [one] elemental
               *[other] elementals
            }
        [fey]
            { $count ->
                [one] fey
               *[other] fey
            }
        [fiend]
            { $count ->
                [one] fiend
               *[other] fiends
            }
        [giant]
            { $count ->
                [one] giant
               *[other] giants
            }
        [humanoid]
            { $count ->
                [one] humanoid
               *[other] humanoids
            }
        [monstrosity]
            { $count ->
                [one] monstrosity
               *[other] monstrosities
            }
        [ooze]
            { $count ->
                [one] ooze
               *[other] oozes
            }
        [plant]
            { $count ->
                [one] plant
               *[other] plants
            }
        [undead]
            { $count ->
                [one] undead
               *[other] undead
            }
       *[other]
            { $count ->
                [one] creature
               *[other] creatures
            }
    }

swarm-noun =
    { $count ->
        [one] swarm
       *[other] swarms
    }

## Phrases: word order is decided here
creature = { size } { type }
swarm = { size } { swarm-noun } of { $inner }

### Alignment
L = Legal
N = Neutral
NX = Neutral
NY = Neutral
C = Chaotic
G = Good
E = Evil
U = Unaligned
A = Any Alignment

CGNYE = Any Chaotic Alignment    	
LGNYE = Any Lawful Alignment
NXGNYE = Any Neutral Alignment
NXCGNYE = Any Non-Lawful Alignment
LNXGNYE = Any Non-Chaotic Alignment
LNXCNYE = Any Non-Good Alignment
LNXCG = Any Good Alignment
LNXCGNY = Any Non-Evil Alignment
LNXCE = Any Evil Alignment

### Speed
stype = 
   { $stype ->
      [walk] walk
      [burrow] burrow
      [climb] climb
      [fly] fly
      [swim] swim
      *[other] unknown
   }

### Misc
dc = CD
armor-class = Armor Class
hit-points = Hit Points
speed = Speed

### Ability Score
str = { $t ->
   *[short] STR
   [long] strength
}
dex = { $t ->
   *[short] dex
   [long] dexterity
}
con = { $t ->
   *[short] con
   [long] constitution
}
int = { $t ->
   *[short] int
   [long] intelligence
}
wis = { $t ->
   *[short] wis
   [long] wisdom
}
cha = { $t ->
   *[short] cha
   [long] charisma
}

### Attacks
ms = Magic Melee Attack
rs = Magic Ranged Attack
mw = Melee Weapon Attack
rw = Ranged Weapon Attack
mwrw = Melee or Ranged Weapon Attack

recharge = Recharge

### TRAITS
saving-throw = { $t ->
   [sing] Saving Thow
   *[plur] Saving Throws
}

skill = { $t ->
   *[sing] Ability
   [plur] Abilities
   [acrobatics] acrobatics
   [animal] animal handling
   [arcana] arcana
   [athletics] athletics
   [deception] deception
   [history] history
   [insight] insight
   [intimidation] intimidation
   [investigation] investigation
   [medicine] medicine
   [nature] nature
   [perception] perception
   [performance] performance
   [persuasion] persuasion
   [religion] religion
   [sleightofhand] sleight of hand
   [stealth] stealth
   [survival] survival
}

senses = { $t ->
   *[sing] Sense
   [plur] Senses
   [blindsight] blindsight
   [darkvision] darkvision
   [tremorsense] tremorsense
   [truesight] truesight
   [passive] passive perception
}

languages = { $t ->
   *[sing] Language
   [plur] Languages
   [X] Any (Choose)
   [XX] All
   [CS] Can't Speak Known Languages
   [LF] Languages Known in Life
   [TP] Telepathy
   [OTH] Other
   [AB] Abyssal
   [AQ] Aquan
   [AU] Auran
   [C] Common
   [CE] Celestial
   [CSL] Common Sign Language
   [D] Dwarvish
   [DR] Draconic
   [DS] Deep Speech
   [DU] Druidic
   [E] Elvish
   [G] Gnomish
   [GI] Giant
   [GO] Goblin
   [GTH] Gith
   [H] Halfling
   [I] Infernal
   [IG] Ignan
   [O] Orc
   [P] Primordial
   [S] Sylvan
   [T] Terran
   [TC] Thieves' cant
   [U] Undercommon
}

damage-type = { $t ->
   [acid] acid
   [bludgeoning] bludgeoning
   [cold] cold
   [fire] fire
   [force] force
   [lightning] lightning
   [necrotic] necrotic
   [piercing] piercing
   [poison] poison
   [psychic] psychic
   [radiant] radiant
   [slashing] slashing
   [thunder] thunder
   *[other] other damage
}

vulnerable = { $t ->
  *[sing] Damage Vulnerability
   [plur] Damage Vulnerability
}

resist = { $t ->
  *[sing] Damage Resistance
   [plur] Damage Resistance
} 

immune = { $t ->
   *[sing] Damage Immunity
    [plur] Damage Immunity
}

data-condition = { $t -> 
   [blinded] blinded
   [charmed] charmed 
   [deafened] deafened 
   [exhaustion] exhaustion 
   [frightened] frightened 
   [grappled] grappled 
   [incapacitated] incapacitated 
   [invisible] invisible 
   [paralyzed] paralyzed
   [petrified] petrified 
   [poisoned] poisoned 
   [prone] prone
   [restrained] restrained 
   [stunned] stunned 
   [unconscious] unconscious 
   [disease] disease
   *[other] other condition
} 

condition-immune = { $t ->
  *[sing] Condition Immunity
   [plur] Condition Immunities
}

in-lair = or {$experience} XP in Lair

# 3 XP 700, or 1800 when part of a coven
coven = or {$cr} ({$exp} XP) when part of a coven. 
xp = XP
cr = CR
proficiency-bonus = PB


################################################
#### Actions | Reactions | Bonus | Legendary
action = Actions
reaction = Reactions
bonus = Bonus Actions
legendary = Legendary Actions

legendary-header = Legendary Action Uses: {$amount}. Immediately after another creature's turn, {$shortName} can expend a use to take one of the following actions. {$shortName} regains all expended uses at the start of each of its turns.

legendary-header-lair = Legendary Action Uses: {$amount} ({$lairAmount} in Lair). Immediately after another creature's turn, {$shortName} can expend a use to take one of the following actions. {$shortName} regains all expended uses at the start of each of its turns.

attack = Attack
to-hit = to hit
hit = Hit
or = or
when = when

## Innate
innate-spellcasting = Innate Spellcasting
at-will = At will
day-each = each day
day = day

## Spellcasting
spellcasting = Spellcasting
cantrips = Cantrips (at will)

slot = { $t ->
  *[sing] slot
   [plur] slots
}

level = { $n ->
   *[other] { $n }° level
}

spell-type = { $t ->
   [constant] constant
   [will] At will
   [ritual] Ritual
   *[other] Translation Error in spell type
}

spell-frequency = { $t ->
   [rest] rest
   [restLong] restLong
   [daily] daily
   [weekly] weekly
   [monthly] monthly
   [yearly] yearly
   [charges] charges
   [recharge] recharge
   [legendary] legendary
   *[other] Translation Error in spell frequency
}

each = each

## Bonus Action
bonus-actions = Bonus Actions

## Legendary Action
legendary-actions = Legendary Actions