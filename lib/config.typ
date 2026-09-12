
// use keys like text, layout (align, inset, etc,) style (font, size, fill), align, pure inset, etc.
#import "config-utils.typ": colors, font-family, font-size, font-weight
#import "utils.typ": merge-dicts

#let default-config-14 = (
  title: none,
  subtitle: none,
  author: none,
  date: none,
  lang: "en",
  show-part: true,
  show-chapter: true,
  using-parts: true,
  page: (
    paper: "us-letter",
    background: image("/assets/paper/default.jpg"),
  ),
  theme: (
    text: (
      fill: colors.darkest,
      font: font-family.main,
      size: font-size.normalsize,
      weight: font-weight.normal,
      hyphenate: true,
      tracking: -0.2pt,
    ),
    heading: (
      level-1: (
        text: (
          fill: colors.titlered,
          font: font-family.main,
          weight: font-weight.normal,
          size: font-size.Huge,
          stroke: 0pt,
        ),
        text-style: none, // smallcaps, emph, etc
        // // linespread: 0.9pt,
        to: none, // odd, even
      ),
      level-2: (
        text: (
          fill: colors.titlered,
          font: font-family.main,
          weight: font-weight.normal,
          size: font-size.huge,
          stroke: 0pt,
        ),
        // linespread: 0.9pt,
        text-style: none,
      ),
      level-3: (
        text: (
          fill: colors.titlered,
          font: font-family.main,
          weight: font-weight.normal,
          size: font-size.LARGE,
        ),
        // linespread: 0.9pt,
        text-style: smallcaps,
      ),
      level-4: (
        text: (
          fill: colors.titlered,
          font: font-family.main,
          weight: font-weight.normal,
          size: font-size.Large,
        ),
        // linespread: 0.9pt,
        text-style: smallcaps,
        decorative-line: line(stroke: (paint: colors.titlegold, thickness: 1.2pt), length: 100%),
        spacing: 3pt,
        vertical-spacing: -4pt,
      ),
      level-5: (
        text: (
          fill: colors.titlered,
          font: font-family.main,
          weight: font-weight.normal,
          size: font-size.large,
        ),
        // linespread: 0.9pt,
        text-style: smallcaps,
      ),
      level-6: (
        text: (
          font: font-family.main,
          size: font-size.normalsize,
        ),
        text-style: emph,
      ),
      level-7: (
        text: (
          font: font-family.main,
          size: font-size.normalsize,
        ),
        text-style: emph,
      ),
    ),
    outline: (
      indent: true,
      repeated-sequence: box(width: 1fr, repeat([.], gap: 0.15em, justify: true)),
      decorative-spacer: box(width: 1fr, line(stroke: (paint: colors.titlegold, thickness: 1.2pt), length: 100%)),
      heading: (
        level-1: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.LARGE,
          ),
          text-style: smallcaps,
        ),
        level-2: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.Large,
          ),
          text-style: smallcaps,
        ),
        level-3: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.large,
          ),
          text-style: none,
        ),
        level-4: (
          text: (
            fill: colors.darkest,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.normalsize,
          ),
          text-style: none,
        ),
        level-5: (
          text: (
            fill: colors.darkest,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.normalsize,
          ),
          text-style: none,
        ),
      ),
    ),
    table: (
      title: (
        text: (
          fill: colors.darkest,
          font: font-family.secondary,
          weight: font-weight.bold,
          size: font-size.large,
        ),
        text-style: smallcaps,
      ),
      header: (
        text: (
          weight: font-weight.bold,
          fill: colors.darkest,
          font: font-family.secondary,
        ),
      ),
      text: (
        fill: colors.darkest,
        font: font-family.secondary,
        size: font-size.small,
      ),
      cell: (
        primary: (
          fill: colors.PhbLightGreen,
        ),
        secondary: (
          fill: none,
        ),
      ),
    ),
    dropcap: (
      dropcap: (
        height: 4,
        justify: true,
        gap: 4pt,
        font: font-family.initial,
      ),
      first-line-style: smallcaps,
    ),
    area: (
      heading: (
        level-1: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.Large,
          ),
          text-style: smallcaps,
          numbering: "1",
        ),
        level-2: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            weight: font-weight.normal,
            size: font-size.normalsize,
          ),
          text-style: smallcaps,
          numbering: "1.a",
        ),
      ),
      text: (
        fill: colors.darkest,
        font: font-family.main,
      ),
      decorative-line: line(stroke: (paint: colors.titlegold, thickness: 1.2pt), length: 100%),
    ),
    commentbox: (
      background: (
        fill: colors.PhbLightGreen,
        inset: 3pt,
        outset: 5pt,
        width: 100%,
      ),
      heading: (
        level-1: (
          text: (
            font: font-family.secondary,
            fill: colors.darkest,
            weight: font-weight.bold,
            size: font-size.small,
          ),
          text-style: smallcaps,
        ),
      ),
      text: (
        fill: colors.darkest,
        font: font-family.secondary,
        size: font-size.small,
        weight: font-weight.normal,
      ),
    ),
    feat: (
      heading: (
        level-1: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            size: font-size.large,
            weight: font-weight.normal,
          ),
          text-style: smallcaps,
        ),
        level-2: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            size: font-size.small,
            weight: font-weight.normal,
          ),
          text-style: emph,
        ),
      ),
      text: (
        fill: colors.darkest,
        font: font-family.main,
        size: font-size.normalsize,
      ),
      decorative-line: line(stroke: (paint: colors.titlegold, thickness: 1.2pt), length: 100%),
    ),
    item: (
      heading: (
        level-1: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            size: font-size.small,
            weight: font-weight.normal,
          ),
          text-style: smallcaps,
        ),
        level-2: (
          text: (font: font-family.main, size: font-size.small, weight: font-weight.normal),
          text-style: emph,
        ),
      ),
      text: (
        font: font-family.main,
        size: font-size.small,
        fill: colors.darkest,
      ),
    ),
    readaloud: (
      block: (
        width: 100%,
        inset: 1em,
        above: 1em,
        below: 1em,
        stroke: (
          left: 1.2pt + colors.titlered,
          right: 1.2pt + colors.titlered,
        ),
        breakable: true,
        fill: colors.bgtan.transparentize(30%),
      ),
      corner: (
        dx: 1em,
        dy: 1em,
        radius: 2pt,
        draw: circle(fill: colors.titlered, radius: 2pt),
      ),
      text: (
        fill: colors.darkest,
        font: font-family.secondary,
        size: 0.82em,
      ),
    ),
    sidebar: (
      // I'm not making this as customizable as the readaloud. Open an Issue or PR if you want more customization options.
      background: (fill: colors.PhbLightGreen),
      edge: (fill: colors.darkest),
      heading: (
        level-1: (
          text: (
            font: font-family.secondary,
            fill: colors.darkest,
            weight: font-weight.bold,
            size: font-size.small,
          ),
          text-style: smallcaps,
        ),
      ),
      text: (
        font: font-family.secondary,
        size: font-size.small,
        fill: colors.darkest,
      ),
    ),
    spell: (
      title: (
        text: (
          fill: colors.titlered,
        ),
        text-style: smallcaps,
      ),
      level: (
        text: (
          style: "italic",
        ),
      ),
      text: (
        font: font-family.main,
        size: font-size.normalsize,
        fill: colors.darkest,
        weight: font-weight.normal,
      ),
    ),
    monster: (
      // Strong suggestion: if you want to customize shapes on the monster statblock do it in the template. It's relatively complex :(
      //// TODO: arrived here. TODO: restructure this shit.
      style: 2014,
      heading: (
        level-1: (
          text: (
            fill: colors.titlered,
            font: font-family.main,
            weight: font-weight.bold,
            size: font-size.Large,
          ),
          text-style: none,
        ),
        level-2: (
          text: (
            fill: colors.titlered,
            size: font-size.large,
          ),
          text-style: smallcaps,
          decorative-line: line(stroke: 0.7pt + colors.titlered, length: 100%),
        ),
        level-3: (
          text: (
            fill: colors.titlered,
            weight: font-weight.bold,
            size: font-size.small,
          ),
          text-style: none,
        ),
        level-4: (
          text: (
            fill: colors.titlered,
            weight: font-weight.bold,
            style: "italic",
            size: font-size.small,
          ),
          text-style: none,
        ),
      ),

      bar: (fill: colors.rulered),
      ribbon: (fill: colors.statblockribbon),
      background: (
        fill: colors.statblockbg.transparentize(40%),
      ),
      text: (
        font: font-family.secondary,
        size: font-size.small,
      ),
    ),
    footer: (
      image: (
        left: image("../assets/footer/default/l.png"),
        right: image("../assets/footer/default/r.png"),
        scale: 133%,
      ),
      number: (
        text: (
          fill: colors.titlegold,
          font: font-family.main,
          size: font-size.normalsize, //or normal
          weight: font-weight.medium,
        ),
        dx: -15.5%,
        dy: 77%,
        debug-circle-fill: none,
      ),
      chapter: (
        text: (
          fill: colors.titlegold,
          font: font-family.main,
          size: font-size.small,
          weight: font-weight.medium,
        ),
        text-style: smallcaps,
        dx: -6%,
        dy: 76%,
      ),
    ),
    bibliography: (),
  ),
)


// Is kind of broken, it needs quite a bit of debugging.
// The thing is that it isn't that useful as users most probably will want to customize the entire config and this won't be used much.
#let easy-colors(
  default: 2014,
  primary: red,
  secondary: red,
  tertiary: red,
  fourth: black,
  text-fill: black,
  readaloud-background: colors.bgtan,
  monster-ribbon: colors.statblockribbon,
  monster-background: colors.statblockbg,
  monster-bar: colors.rulered,
) = {
  return {
    let dc = default-config-14
    if default == 2024 {
      dc = default-config-24
    }

    merge-dicts(
      dc,
      (
        theme: (
          text: (fill: primary),
          heading: (
            level-1: (text: (fill: primary)),
            level-2: (text: (fill: primary)),
            level-3: (text: (fill: primary)),
            level-4: (
              text: (fill: primary),
              decorative-line: line(stroke: (paint: tertiary, thickness: 1.2pt), length: 100%),
            ),
            level-5: (text: (fill: primary)),
          ),
          outline: (
            decorative-spacer: box(width: 1fr, line(stroke: (paint: tertiary, thickness: 1.2pt), length: 100%)),
            heading: (
              level-1: (text: (fill: primary)),
              level-2: (text: (fill: primary)),
              level-3: (text: (fill: primary)),
            ),
          ),
          feat: (
            heading: (
              level-1: (text: (fill: primary)),
              level-2: (text: (fill: primary)),
            ),
            decorative-line: line(stroke: (paint: tertiary, thickness: 1.2pt), length: 100%),
          ),
          item: (
            heading: (
              level-1: (text: (fill: primary)),
            ),
          ),
          area: (
            heading: (
              level-1: (text: (fill: primary)),
            ),
            line: line(stroke: (paint: tertiary, thickness: 1.2pt), length: 100%),
          ),
          readaloud: (
            block: (stroke: (left: 1.2pt + primary, right: 1.2pt + primary), fill: readaloud-background),
          ),
          spell: (
            title: (text: (fill: primary)),
          ),
          monster: (
            title: (text: (fill: primary)),
            bar: (fill: monster-background),
            ribbon: (fill: monster-ribbon),
            background: (fill: monster-background),
          ),
          table: (
            cell: (primary: (fill: secondary)),
          ),
          sidebar: (
            background: (fill: secondary),
          ),
          footer: (number: (text: (fill: tertiary)), chapter: (text: (fill: tertiary))),
          commentbox: (
            background: (fill: secondary, inset: 3pt, outset: 5pt, width: 100%),
          ),
        ),
      ),
    )
  }
}
