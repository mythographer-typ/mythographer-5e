part = Parte

chapter = { $t ->
  *[sing] Capítulo
   [plur] Capítulos
   [short] Cap.
}

## Spell
casting-time = Tempo de Conjuração
range = Alcance
component = { $t ->
  *[sing] Componente
   [plur] Componentes
}
duration = Duração

## Feat
prerequisite = Pré-requisito


###############################################
##### Monster

### Size
# F = Ínfimo, D = Diminuto, T = Miúdo, S = Pequeno, M = Médio, L = Grande, H = Enorme, G = Descomunal, C = Colossal, V = Variável
msize =
    { $msize ->
         [F]
            { $mtype ->
               [aberration] Ínfima
               [beast] Ínfima
               [celestial] Ínfimo
               [construct] Ínfimo
               [dragon] Ínfimo
               [elemental] Ínfimo
               [fey] Ínfimo
               [fiend] Ínfimo
               [giant] Ínfimo
               [humanoid] Ínfimo
               [monstrosity] Ínfima
               [ooze] Ínfima
               [plant] Ínfima
               [undead] Ínfimo
               *[other] Ínfimo
            }
         [D]
            { $mtype ->
               [aberration] Diminuta
               [beast] Diminuta
               [celestial] Diminuto
               [construct] Diminuto
               [dragon] Diminuto
               [elemental] Diminuto
               [fey] Diminuto
               [fiend] Diminuto
               [giant] Diminuto
               [humanoid] Diminuto
               [monstrosity] Diminuta
               [ooze] Diminuta
               [plant] Diminuta
               [undead] Diminuto
               *[other] Diminuto
            }
         [T]
            { $mtype ->
               [aberration] Miúda
               [beast] Miúda
               [celestial] Miúdo
               [construct] Miúdo
               [dragon] Miúdo
               [elemental] Miúdo
               [fey] Miúdo
               [fiend] Miúdo
               [giant] Miúdo
               [humanoid] Miúdo
               [monstrosity] Miúda
               [ooze] Miúda
               [plant] Miúda
               [undead] Miúdo
               *[other] Miúdo
            }
         [S]
            { $mtype ->
               [aberration] Pequena
               [beast] Pequena
               [celestial] Pequeno
               [construct] Pequeno
               [dragon] Pequeno
               [elemental] Pequeno
               [fey] Pequeno
               [fiend] Pequeno
               [giant] Pequeno
               [humanoid] Pequeno
               [monstrosity] Pequena
               [ooze] Pequena
               [plant] Pequena
               [undead] Pequeno
               *[other] Pequeno
            }
         [M]
            { $mtype ->
               [aberration] Média
               [beast] Média
               [celestial] Médio
               [construct] Médio
               [dragon] Médio
               [elemental] Médio
               [fey] Médio
               [fiend] Médio
               [giant] Médio
               [humanoid] Médio
               [monstrosity] Média
               [ooze] Média
               [plant] Média
               [undead] Médio
               *[other] Médio
            }
         [L]
            { $mtype ->
               [aberration] Grande
               [beast] Grande
               [celestial] Grande
               [construct] Grande
               [dragon] Grande
               [elemental] Grande
               [fey] Grande
               [fiend] Grande
               [giant] Grande
               [humanoid] Grande
               [monstrosity] Grande
               [ooze] Grande
               [plant] Grande
               [undead] Grande
               *[other] Grande
            }
         [H]
            { $mtype ->
               [aberration] Enorme
               [beast] Enorme
               [celestial] Enorme
               [construct] Enorme
               [dragon] Enorme
               [elemental] Enorme
               [fey] Enorme
               [fiend] Enorme
               [giant] Enorme
               [humanoid] Enorme
               [monstrosity] Enorme
               [ooze] Enorme
               [plant] Enorme
               [undead] Enorme
               *[other] Enorme
            }
         [G]
            { $mtype ->
               [aberration] Descomunal
               [beast] Descomunal
               [celestial] Descomunal
               [construct] Descomunal
               [dragon] Descomunal
               [elemental] Descomunal
               [fey] Descomunal
               [fiend] Descomunal
               [giant] Descomunal
               [humanoid] Descomunal
               [monstrosity] Descomunal
               [ooze] Descomunal
               [plant] Descomunal
               [undead] Descomunal
               *[other] Descomunal
            }
         [C]
            { $mtype ->
               [aberration] Colossal
               [beast] Colossal
               [celestial] Colossal
               [construct] Colossal
               [dragon] Colossal
               [elemental] Colossal
               [fey] Colossal
               [fiend] Colossal
               [giant] Colossal
               [humanoid] Colossal
               [monstrosity] Colossal
               [ooze] Colossal
               [plant] Colossal
               [undead] Colossal
               *[other] Colossal
            }
         [V]
            { $mtype ->
               [aberration] Variável
               [beast] Variável
               [celestial] Variável
               [construct] Variável
               [dragon] Variável
               [elemental] Variável
               [fey] Variável
               [fiend] Variável
               [giant] Variável
               [humanoid] Variável
               [monstrosity] Variável
               [ooze] Variável
               [plant] Variável
               [undead] Variável
               *[other] Variável
            }
       *[other] Desconhecido
    }



### type
mtype =
    { $mtype ->
         [aberration] Aberração
         [beast] Besta
         [celestial] Celestial
         [construct] Constructo
         [dragon] Dragão
         [elemental] Elemental
         [fey] Feérico
         [fiend] Corruptor
         [giant] Gigante
         [humanoid] Humanoide
         [monstrosity] Monstruosidade
         [ooze] Gosma
         [plant] Planta
         [undead] Morto-vivo
         *[other] Criatura
    }

creature-description =
     { mtype } { msize }


### Alignment
L = Leal
N = Neutro
NX = Neutro
NY = Neutro
C = Caótico
G = Bom
E = Mau
U = Sem Alinhamento
A = Qualquer Alinhamento

LNXCNYE = Qualquer Alinhamento Não-Bom
LNXCNYG = Qualquer Alinhamento Bom

### Speed
stype =
   { $stype ->
      [walk] caminhar
      [burrow] escavar
      [climb] escalar
      [fly] voar
      [swim] nadar
      *[other] desconhecido
   }



### Misc
dc = CD
armor-class = Classe de Armadura
hit-points = Pontos de Vida
speed = Deslocamento




### Ability Score
str = { $t ->
   *[short] FOR
   [long] força
}
dex = { $t ->
   *[short] DES
   [long] destreza
}
con = { $t ->
   *[short] CON
   [long] constituição
}
int = { $t ->
   *[short] INT
   [long] inteligência
}
wis = { $t ->
   *[short] SAB
   [long] sabedoria
}
cha = { $t ->
   *[short] CAR
   [long] carisma
}

### Attacks
ms = Ataque Mágico Corpo a Corpo
rs = Ataque Mágico à Distância
mw = Ataque com Arma Corpo a Corpo
rw = Ataque com Arma à Distância
mwrw = Melee or Ranged Weapon Attack

recharge = Recharge

### TRAITS
saving-throw = { $t ->
   [sing] Teste de Resistência
   *[plur] Testes de Resistência
}

skill = { $t ->
   *[sing] Perícia
   [plur] Perícias
   [acrobatics] acrobacia
   [animal] adestrar animais
   [arcana] arcanismo
   [athletics] atletismo
   [deception] enganação
   [history] história
   [insight] intuição
   [intimidation] intimidação
   [investigation] investigação
   [medicine] medicina
   [nature] natureza
   [perception] percepção
   [performance] atuação
   [persuasion] persuasão
   [religion] religião
   [sleightofhand] prestidigitação
   [stealth] furtividade
   [survival] sobrevivência
}

senses = { $t ->
   *[sing] Sentido
   [plur] Sentidos
   [blindsight] visão às cegas
   [darkvision] visão no escuro
   [tremorsense] sentido sísmico
   [truesight] visão verdadeira
   [passive] percepção passiva
}


 
languages = { $t ->
   *[sing] Idioma
   [plur] Idiomas
   [X] Qualquer (Escolha)
   [XX] Todos
   [CS] Não Fala Idiomas Conhecidos
   [LF] Idiomas Conhecidos em Vida
   [TP] Telepatia
   [OTH] Outro
   [AB] Abissal
   [AQ] Aquan
   [AU] Auran
   [C] Comum
   [CE] Celestial
   [CSL] Linguagem de Sinais Comum
   [D] Anão
   [DR] Dracônico
   [DS] Fala Profunda
   [DU] Druídico
   [E] Élfico
   [G] Gnômico
   [GI] Gigante
   [GO] Goblin
   [GTH] Gith
   [H] Halfling
   [I] Infernal
   [IG] Ignan
   [O] Orc
   [P] Primordial
   [S] Silvestre
   [T] Terran
   [TC] Gíria de Ladrão
   [U] Subcomum
}


damage-type = { $t ->
   [acid] ácido
   [bludgeoning] concussão
   [cold] frio
   [fire] fogo
   [force] energia
   [lightning] elétrico
   [necrotic] necrótico
   [piercing] perfurante
   [poison] veneno
   [psychic] psíquico
   [radiant] radiante
   [slashing] cortante
   [thunder] trovão
   *[other] outro dano
}



vulnerable = { $t ->
  *[sing] Vulnerabilidade a Dano
   [plur] Vulnerabilidades a Dano
}

resist = { $t ->
  *[sing] Resistência a Dano
   [plur] Resistências a Dano
}

immune = { $t ->
   *[sing] Imunidade a Dano
    [plur] Imunidades a Dano
}

data-condition = { $t ->
   [blinded] cego
   [charmed] enfeitiçado
   [deafened] surdo
   [exhaustion] exaustão
   [frightened] amedrontado
   [grappled] agarrado
   [incapacitated] incapacitado
   [invisible] invisível
   [paralyzed] paralisado
   [petrified] petrificado
   [poisoned] envenenado
   [prone] caído
   [restrained] contido
   [stunned] atordoado
   [unconscious] inconsciente
   [disease] doença
   *[other] outra condição
}

condition-immune = { $t ->
  *[sing] Imunidade a Condição
   [plur] Imunidades a Condições
}

in-lair = ou {$experience} XP no covil
in-laira = ou {$experience} XP no covil

xp = XP
cr = ND
proficiency-bonus = Bônus de Proficiência


################################################
#### Actions | Reactions | Bonus | Legendary
action = Ações
reaction = Reações
bonus = Ações Bônus
legendary = Ações Lendárias

legendary-header = Usos de Ação Lendária: {$amount}. Imediatamente após o turno de outra criatura, {$shortName} pode gastar um uso para realizar uma das ações a seguir. {$shortName} recupera todos os usos gastos no início de cada um de seus turnos.

legendary-header-lair = Usos de Ação Lendária: {$amount} ({$lairAmount} no Covil). Imediatamente após o turno de outra criatura, {$shortName} pode gastar um uso para realizar uma das ações a seguir. {$shortName} recupera todos os usos gastos no início de cada um de seus turnos.



attack = Ataque
to-hit = para acertar
hit = Acerto
or = ou
when = quando

## Innate
innate-spellcasting = Conjuração Inata
at-will = À vontade
day-each = por dia cada
day = por dia

## Spellcasting
spellcasting = Conjuração
cantrips = Truques (à vontade)

slot = { $t ->
  *[sing] espaço
   [plur] espaços
}

level = { $n ->
   *[other] { $n }° nível
}

## Bonus Action
bonus-actions = Ações Bônus

## Legendary Action
legendary-actions = Ações Lendárias
