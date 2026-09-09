#import "external.typ"

#let supported-langs = ("en", "it", "pt")

#let setup-transl-lang(lang) = {
  if lang in supported-langs {
    // external.transl(data: read("l10n/it.ftl"), lang: "it")
    let filename = "l10n/" + lang + ".ftl"
    external.transl(data: read(filename), lang: lang)
  } else {
    error("Unsupported language: {lang}. Supported languages are: {supported-langs}")
  }
}
