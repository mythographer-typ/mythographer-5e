#import "config.typ": default-config
#import "utils.typ"

#import "external.typ"

// WARNING: removed `context`

/// Formats comments.
/// Usually you would use `=` once for the prerequsites and `==` for the item name. Then the rest of the text is the description of the feat. No limit on the number of `=` or `==` you can use, but it is recommended to use only one of each for clarity.
///
/// 🔤 (translation): ACTIVE
///
/// === Usage:
/// ```typst
/// #dnd-feat[
///   = Typesetting Savant
///   == Typst
///   You have acquired a package that aids in typesetting source material for one of your favorite games. You have advantage on Intelligence checks to typeset new content. On a failed check, you can seek assistance online at the package's website.
/// ]
/// ```
///
/// === Config structure:
/// ```
/// (
///   heading: (
///     level-1: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///     ),
///    level-2: (
///       text: (text-fn-arguments),
///       text-style: (text-fn-arguments),
///     ),
///   ),
///   text: (text-fn-arguments): main body text style,
///   decorative-line: (block-fn-arguments): decorative line style,
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted feature
///
#let dnd-feat(config: (:), body) = {
  let self = default-config.theme.feat
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false, numbering: none)

  show heading.where(level: 1): it => {
    set text(..self.heading.level-1.text)

    stack(
      spacing: 3pt,
      utils.call-if-fn(self.heading.level-1.text-style, [#it.body]),
      self.decorative-line,
    )
  }

  show heading.where(level: 2): it => {
    set text(..self.heading.level-2.text)
    utils.call-if-fn(
      self.heading.level-2.text-style,
      [#external.transl("prerequisite"): #it.body],
    )
    linebreak()
  }

  set text(..self.text)

  body
}
