vim.lsp.enable({
  "lua_ls",
<<<<<<< HEAD
})
=======
  "clangd",
  "vscode-html-language-server",
  "vscode-css-language-server",
})

-- vim.lsp.config('vscode-html-language-server')
-- vim.lsp.config('vscode-css-language-server')

require'lspconfig'.texlab.setup{}

-- HTML
vim.lsp.config.html = {
  default_config = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    init_options = {
      provideFormatter = true
    },
  },
}

-- CSS / SCSS / LESS
vim.lsp.config.cssls = {
  default_config = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    settings = {
      css = { validate = true },
      scss = { validate = true },
      less = { validate = true },
    },
  },
}


vim.lsp.config("lua_ls",
  {
    settings = {
      Lua = {
       -- diagnostics = {
       --   globals = {},
       -- },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  })

-- Auto complete
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd("set completeopt+=noselect")
>>>>>>> 5d1a6ea (Backup)
