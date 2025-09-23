local M = {}

-- get cmp_nvim_lsp capabilities
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "X" },
    { name = "DiagnosticSignWarn",  text = "!" },
    { name = "DiagnosticSignHint",  text = "I" },
    { name = "DiagnosticSignInfo",  text = "?" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config({
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

-- highlight references on CursorHold
local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- keymaps
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)

  keymap("n", "[d", function() vim.diagnostic.goto_prev({ float = { border = "rounded" } }) end, opts)
  keymap("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts)
  keymap("n", "]d", function() vim.diagnostic.goto_next({ float = { border = "rounded" } }) end, opts)

  keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
    vim.lsp.buf.format()
  end, { desc = "Format buffer with LSP" })
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client, bufnr)

  local ok, illuminate = pcall(require, "illuminate")
  if ok then
    illuminate.on_attach(client)
  end
end

return M
