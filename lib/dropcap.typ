#import "external.typ"
#import "config.typ": default-config
#import "utils.typ"

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
/// -> formatted area
///
#let dnd-dropcap(config: (:), letter, smalcap, body) = {
  let self = default-config.theme.dropcap
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  external.dropcap(
    ..self.dropcap,
  )[#letter #utils.call-if-fn(self.first-line-style, smalcap) #body]
}
