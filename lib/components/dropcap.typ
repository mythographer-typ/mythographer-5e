#import "../external.typ"
#import "../utils/core.typ"
#import "../utils/utils.typ"

/// Formats dropcap letter.
///
/// Dropcap Docs: https://typst.app/universe/package/droplet
///
/// === Usage:
/// ```typst
/// #dnd-dropcap[S][tyle and color settings can be adjusted dynamically][
/// to suit your needs. You can apply custom configurations directly
/// within functions or globally.]
/// ```
///
/// === Config structure:
/// ```
/// (
///   dropcap: (dropcap-fn-arguments):,
///   first-line-style: (text-fn-arguments): style for the first line of
///       text following the dropcap letter,
/// )
/// ```
/// - config (dict):
/// - body (content):
/// -> formatted dropcap
///
#let dnd-dropcap(config: (:), letter, smalcap, body) = core.fn-wrapper(self => {
  self = self.theme.dropcap
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  external.dropcap(
    ..self.dropcap,
  )[#letter #utils.call-if-fn(self.first-line-style, smalcap) #body]
})
