-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- set cursorline/cursorcolumn on InsertEnter
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end,
})

-- set nocursorline/nocursorcolumn on InsertLeave
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("geloman/LspAttach", { clear = true }),
  callback = function(event)
    local keymap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
    end
    keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    keymap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    keymap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    keymap("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
    keymap("K", vim.lsp.buf.hover, "Hover Documentation")
    keymap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    keymap("<leader>do", vim.diagnostic.open_float, "Open Floating Diagnostic")
    keymap("<leader>dn", vim.diagnostic.goto_next, "Next Diagnostic")
    keymap("<leader>dp", vim.diagnostic.goto_prev, "Previous Diagnostic")
    keymap("<leader>fm", vim.lsp.buf.format, "Format Current Buffer")

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- rounded border for diagnostic popup
    vim.diagnostic.config({ signs = true, float = { border = "rounded", header = false } })

    -- rounded border for textDocument/hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
