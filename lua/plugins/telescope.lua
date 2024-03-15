return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local command = function(command)
      return function()
        vim.cmd(command)
      end
    end
    return {
      -- BUFFERS, FILES, AND REGISTERS
      { "<leader>ff", command("Telescope find_files"), desc = "[F]ind [F]iles" },
      { "<leader>fr", command("Telescope registers"), desc = "[F]ind [F]iles" },
      { "<leader><space>", command("Telescope buffers"), desc = "[ ] Find existing buffers" },

      -- REGULAR EXPRESSIONS
      { "<leader>lg", command("Telescope live_grep"), desc = "[L]ive [G]rep" },
      { "<leader>fw", command("Telescope grep_string"), desc = "[F]ind [W]ord under cursor" },

      -- LSP RELATED
      { "<leader>lr", command("Telescope lsp_references"), desc = "[L]sp [R]eferences" },
      { "<leader>wd", command("Telescope diagnostics"), desc = "[W]orkspace [D]iagnostics" },

      -- COLORSCHEMES AND HIGHLIGH S
      { "<leader>hp", command("Telescope highlights"), desc = "[H]ighlights [P]review" },
      { "<leader>cc", command("Telescope colorscheme"), desc = "[C]hange [C]olorscheme" },

      -- GIT COMMANDS
      { "<leader>gs", command("Telescope git_status"), desc = "[G]it [S]tatus" },
      { "<leader>gf", command("Telescope git_files"), desc = "[G]it [F]iles" },
      { "<leader>gb", command("Telescope git_branches"), desc = "[G]it [B]ranches" },
      { "<leader>gts", command("Telescope git_stash"), desc = "Git Stash" },
      { "<leader>gtb", command("Telescope git_bcommits"), desc = "Git Current Buffer Commits" },

      -- TELESCOPE'S EASTER EGG
      { "<leader>ps", command("Telescope planets"), desc = "Love and Peace" },

      -- HELP TAGS
      { "<leader>hh", command("Telescope help_tags"), desc = "Search Help" },

      -- NEOVIM CONFIG FILES
      {
        "<leader>cn",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "neovim config files",
      },
    }
  end,
  opts = function()
    local ignore_files = {
      ".git",
      "target",
      "node_modules",
      "wwwroot/lib",
      "**/Debug",
      "**.cache",
      "**/assets",
      "**.png",
      "**.svg",
      "**.favicon.*",
      "**.gif",
      "**.jpg",
      "**.jpeg",
      "**.mp4",
      "**.mp3",
      "**.pdf",
      "go",
      "**.zip",
      "**.tar.gz",
      "**/tags",
      "**.ttf",
    }

    local actions = require("telescope.actions")
    local options = {
      pickers = {

        highlights = {
          layout_config = {
            preview_width = 0.55,
          },
        },

        help_tags = {
          layout_config = {
            preview_width = 0.55,
          },
        },

        live_grep = {
          layout_config = {
            preview_width = 0.60,
          },
        },

        lsp_references = {
          initial_mode = "normal",
          layout_config = {
            preview_width = 0.60,
          },
        },

        planets = {
          show_pluto = true,
          show_moon = true,
          initial_mode = "normal",
          layout_config = {
            preview_width = 0.55,
          },
        },

        colorscheme = {
          initial_mode = "insert",
          layout_config = {
            width = 0.40,
            height = 0.60,
          },
        },

        grep_string = {
          word_match = "-w",
          initial_mode = "normal",
          layout_config = {
            preview_width = 0.55,
          },
        },

        oldfiles = {
          initial_mode = "normal",
          layout_config = {
            preview_width = 0.55,
          },
        },

        diagnostics = {
          initial_mode = "normal",
          layout_config = {
            preview_width = 0.55,
          },
        },

        buffers = {
          initial_mode = "normal",
          mappings = {
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
          layout_config = {
            preview_width = 0.55,
          },
        },

        find_files = {
          hidden = true,
          layout_config = {
            preview_width = 0.55,
          },
        },

        git_status = {
          initial_mode = "normal",
          show_untracked = true,
          layout_config = {
            preview_width = 0.55,
          },
        },

        git_files = {
          show_untracked = true,
          layout_config = {
            preview_width = 0.55,
          },
        },
      },

      defaults = {
        dynamic_preview_title = true,
        file_ignore_patterns = ignore_files,

        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
          n = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["q"] = actions.close,
          },
        },

        layout_config = {
          height = 0.95,
          width = 0.95,
        },

        -- selection_caret = "  ",
        selection_caret = "  ",
        prompt_prefix = "   ",
      },
    }
    return options
  end,
}
