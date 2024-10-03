return {
  init_options = {
    filetypes = {
      "css",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "pug",
      "typescript",
      "typescriptreact",
      "mdx",
      "php",
      "svelte",
    },
    includeLanguages = {
      typescript = "html",
      javascript = "html",
    },
    html = {
      options = {
        -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
        ["bem.enabled"] = true,
        ["jsx.enabled"] = true,
      },
    },
    autostart = true,
  },
}
