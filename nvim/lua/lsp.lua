vim.lsp.enable({
  "lua_ls",
  "clangd",
  "ts_ls",
  "html",
  "cssls",
  "jsonls",
  "emmet_ls",
  -- "phpactor",
  "intelephense",
  "omnisharp",
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config.ts_ls = {
  default_config = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
  },
}

vim.lsp.config.html = {
  default_config = {
    cmd = { "vscode-html-language-server", "--stdio" },
    capabilities = capabilities,
    filetypes = { "html", "templ" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    },
    root_markers = { "package.json", ".git" },
    settings = {},
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    local fname = vim.api.nvim_buf_get_name(0)
    local root = vim.fs.find({ "composer.json", ".git" }, { path = fname, upward = true })[1]
    local root_dir = root and vim.fs.dirname(root) or vim.fn.getcwd()

    vim.lsp.start({
      name = "intelephense",
      cmd = { "intelephense", "--stdio" },
      root_dir = root_dir,
    })
  end,
})

-- vim.lsp.phpactor = {
--   cmd = { "phpactor", "language-server" },
--   capabilities = capabilities,
--   filetypes = { "php" },
-- }

-- vim.lsp.intelephense = {
--   capabilities = capabilities,
--   cmd = { "intelephense", "--stdio" },
--   filetypes = { "php" },
--   root_markers = { ".git", "composer.json" },
--
--   root_dir = function(fname)
--     local root = vim.fs.find({ "composer.json", ".git" }, { path = fname, upward = true })[1]
--     if root then
--       return vim.fs.dirname(root)
--     end
--     return vim.fn.getcwd() -- fallback když není projekt
--   end,
--
--   settings = {
--     intelephense = {
--       files = {
--         maxSize = 1000000,
--       },
--     },
--   },
-- }

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

vim.lsp.jsonls = {
  cmd = { "vscode-json-language-server", "--stdio" },
  capabilities = capabilities,
}

vim.lsp.emmet_ls = {
  cmd = { "emmet-ls", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "astro",
  },
}

vim.lsp.config.omnisharp = {
  default_config = {
    cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    filetypes = { "cs" },
    root_markers = { "*.sln", "*.csproj", ".git" },
    capabilities = capabilities,
  },
}

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
  },
  init_options = {
    compilationDatabasePath = "build",
    fallbackFlags = { '--std=c++23' },
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config("lua_ls", {
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git", "init.lua" },
  
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
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
