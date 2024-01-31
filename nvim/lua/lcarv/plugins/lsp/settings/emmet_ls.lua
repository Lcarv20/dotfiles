return {
  init_options = {
    filetypes = { "html", "css", "typescriptreact", "javascriptreact", "php", "mdx" },
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
        ["jsx.enabled"] = true,
      },
    },
    autostart = true,
  },
}
