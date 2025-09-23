-- local lspconfig = require("lspconfig")
-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
-- lspconfig.lua_ls.setup({ capabilities = lsp_capabilities })

-- lua/plugins/lsp.lua
local lspconfig = require("lspconfig")
local handlers = require("ttom.lsp.handlers")

-- run global diagnostic setup (signs, borders, etc.)
handlers.setup()

-- list the servers you want
local servers = {
  "lua_ls",
  "clangd",
}

-- loop through them
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  })
end
