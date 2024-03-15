return {
    'folke/trouble.nvim',
    keys = {
        { '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Toggle Workspace Diagnostics' },
        { '<leader>tl', '<cmd>TroubleToggle lsp_references<cr>',        desc = 'Toggle Lsp References' },
    },
}
