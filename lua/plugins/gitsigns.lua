return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>N", "<cmd>Gitsigns prev_hunk<cr>", desc = "[N] go to previous hunk" },
    { "<leader>n", "<cmd>Gitsigns next_hunk<cr>", desc = "[n] go to next hunk" },
    { "<leader>ph", "<cmd>Gitsigns preview_hunk<cr>", desc = "[p]review [h]unk" },
    { "ga", "<cmd>Gitsigns stage_hunk<cr>", desc = "[G]it [A]dd Hunk" },
    { "<leader>gaa", "<cmd>Gitsigns stage_buffer<cr>", desc = "[G]it [A]dd [A]ll Hunks" },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "[G]it [U]nstage Last Staged" },
    { "<leader>gr", "<cmd>Gitsigns reset_buffer<cr>", desc = "[G]it [R]eset Current Buffer" },
    { "<leader>lb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "[L]ine [B]lame toggle" },
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    numhl = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
    },
    preview_config = {
      border = "rounded",
    },
    attach_to_untracked = true,
  },
}
