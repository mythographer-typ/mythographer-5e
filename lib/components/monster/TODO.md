- config: make it more granular so that the user can better customize each section of the monster statblock. Maybe make it with "compartments" like how the renderer does it. This allows for flexibility while maintaining a consistent structure that can be understood while developing this repo.

- resistance, immunity (and another) are ~the same. Merge the code into one fn.

#### Specs

1. [UTIL](https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/util.json)
1. [BESTIARY](https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/bestiary/bestiary.json)

#### Needs to be checked as now i'm actually comparing everything to the specs.

- ability-modifiers
- alignment
- armor-class
- hit-points
- name
- size-type
- specs
- speed
- traits

- ability-modifier
- challenge-rating
- condition-immunity
- immunity
- language
- proficiency-bonus
- resistance
- save-throw
- senses
- skill
- speed
- spellcasting
- trait-action-entry
- vulnerability
