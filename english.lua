local lang = 'en'

return {
  {
    Code = function(el)
      return pandoc.Span(el, pandoc.Attr("", {}, {lang = lang}))
    end,

    CodeBlock = function(el)
      return pandoc.Div(el, pandoc.Attr("", {}, {lang = lang}))
    end,
  }
}
