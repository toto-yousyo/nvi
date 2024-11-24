return {
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm", 
      transparent = true, 
      styles = {
          sidebar = "transparent",
          floats = "transparent",
      }, 
      on_colors = function(colors)
        colors.comment = "#777ea0"
        colors.bg_dark = "#161926"
      end, 
    })
  end, 
},
{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons',
  },
  opt = {},
  event = "VeryLazy",
},
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true
}, 

-- nvim-treesitter
{
  "nvim-treesitter/nvim-treesitter",
  event = { "BufRead", "BufNewFile", "InsertEnter" },
  build = ":TSUpdate",
  config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
              "awk",
              "bash",
              "comment",
              "c",
              "css",
              "csv",
              "diff",
              "gpg",
              "html",
              "htmldjango",
              "javascript",
              "json",
              "lua",
              "markdown",
              "python",
              "rust",
              "sql",
              "ssh_config",
              "tmux",
              "toml",
              "vim",
              "xml",
              "yaml",
              "regex",
              "vimdoc",
          },
          sync_install = false,
          auto_install = true,
 --         highlight = { enable = true },
          indent = { enable = true },
      })
  end,
},

    -- Diagnostics
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
  },
  opts = {
      routes = {
          {
              filter = { event = "msg_show", find = "E486: Pattern not found: .*" },
              opts = { skip = true },
          },
      },
      lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
      },
  },
},
{
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
          sources = {
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.diagnostics.eslint,
              null_ls.builtins.completion.spell,
          },
      })
    end, 
}, 
{
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.diagnostics.markdownlint_cli2,
    })
  end,
}, 
-- git
{
  "lewis6991/gitsigns.nvim",
  config = true,
  event = { "BufReadPre", "BufNewFile" },
},
{'hrsh7th/nvim-cmp', event = { 'InsertEnter', 'CmdlineEnter' }, },
{'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'}, 
{'hrsh7th/cmp-buffer', event = 'InsertEnter'},
{'hrsh7th/cmp-path', event = 'InsertEnter'},
{'hrsh7th/cmp-cmdline', event = 'ModeChanged'}, 
{'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
{'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
{'hrsh7th/cmp-calc', event = 'InsertEnter'},
{
  'onsails/lspkind.nvim', event = 'InsertEnter', 
  config = function()
    require('lspkind').init({
        symbol_map = {
          Copilot = '',
        }, 
      })
  end,
},
{'rafamadriz/friendly-snippets', event = 'InsertEnter'},

{
  'nvim-telescope/telescope.nvim', tag = '0.1.8', 
    dependencies = { 'nvim-lua/plenary.nvim' }
}, 
{
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
},
{
    'MunifTanjim/prettier.nvim', 
    config = function()
        local status, prettier = pcall(require, "prettier")
        if (not status) then return end

        prettier.setup {
          bin = 'prettierd',
          filetypes = {
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "scss",
            "less"
          }
        }
    end,
}, 
{
  "williamboman/mason.nvim", 
  opts = { ensure_installed = { "markdownlint-cli2", "markdown-toc" } }, 
}, 
{"williamboman/mason-lspconfig.nvim"},
{
  "neovim/nvim-lspconfig", 
  opts = {
      servers = {
        marksman = {}, 
      }, 
  }, 
},
{
  'nvimdev/lspsaga.nvim', 
  config = function()
    require('lspsaga').setup({})
  end, 
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  } 
}, 
{'brenoprata10/nvim-highlight-colors'}, 
{'dinhhuy258/git.nvim'}, 
{'ray-x/web-tools.nvim'}, 
{
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
}, 
{
  "vhyrro/luarocks.nvim", 
  priority = 1001, 
  opts = {
 --     rocks = { "magick" }, 
  }, 
  config = true, 
}, 

{"stevearc/dressing.nvim", opts = {}},  
 
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},
{
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},
{
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
  end
},   
{ 'echasnovski/mini.nvim', version = false },
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}, 

-- AI
{
  "github/copilot.vim", 
  lazy=false, 
    config = function()
      require("copilot").setup({
        suggestion = {enabled = false},
        panel = {enabled = false},
      })
    end,
}, 
{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      suggestion = {enabled = false},
      panel = {enabled = false},
      copilot_node_command = 'node'
    })
  end,
}, 
{
  "zbirenbaum/copilot-cmp",
  config = function ()
    require("copilot_cmp").setup({
        --for copilots
  })
  end
}, 
--{
--  "CopilotC-Nvim/CopilotChat.nvim",
--  branch = "canary",
--  dependencies = {
--    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
--    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
--  },
--  build = "make tiktoken", -- Only on MacOS or Linux
--  opts = {
--    -- See Configuration section for options
--  },
--  -- See Commands section for default commands if you want to lazy load on them
--},

--{
--  "CopilotC-Nvim/CopilotChat.nvim",
--  branch = "canary",
--  dependencies = {
--    { "github/copilot.vim" }, 
--    { "nvim-lua/plenary.nvim" }, 
--  }, 
--  build = "make tiktoken", 
--  opts = {
--    debug = true,
--    mappings = {
--      complete = {
--        detail = 'Use @<Tab> or /<Tab> for options.',
--        insert ='<C-l>',
--      },
--      reset = {
--          normal = '<C-q>', 
--          insert = '<C-q>', 
--      }, 
--    }, 
--  }, 
--}, 
{
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
      api_key_cmd= os.getenv("OPENAI_API_KEY"), 
  })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
}, 

-- orgmode
{
  "nvim-orgmode/orgmode", 
  event = "VeryLazy",
  ft = { 'org'},
  config = function()
    require('orgmode').setup({
      org_agenda_files = {'~/.config/nvim/org/*'},
      org_default_notes_file = '~/.config/nvim/org/refile.org',
      org_hide_emphasis_markers = true,
      org_todo_keywords = {'TODO', 'DOING', 'PENDING', 'DONE'},
      org_capture_templates = {
        T = { description = 'Todo', template = '* TODO %?\n  %u' },
        D = { description = 'Deadline', template = '* TODO %?\n  DEADLINE: %t' },
        E = { description = 'Event', template = '* %?\n  SCHEDULED: %t' },
        j = { description = 'journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',  target = '~/.config/nvim/org/journal.org' },
        n = { description = 'note', template = '\n* %<%Y-%m-%d> %<%A>\n\n%?',  target = '~/.config/nvim/org/note.org' },
      },
    })
  end,
}, 

-- jupyter notebook
--{
--  "GCBallesteros/NotebookNavigator.nvim",
--  keys = {
--    { "]h", function() require("notebook-navigator").move_cell "d" end },
--    { "[h", function() require("notebook-navigator").move_cell "u" end },
--    { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
--    { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
--    { "<leader>ax", "<cmd>lua require('notebook-navigator').run_all_cells()<cr>" },
--  },
--  dependencies = {
--    "echasnovski/mini.comment",
--    "anuvyklack/hydra.nvim",
----    "hkupty/iron.nvim",
--    {
--        "benlubas/molten-nvim", 
--        version = "^1.6.0", 
--        dependencies = {
--          {
--            "3rd/image.nvim", 
--            config = function()
--              require("image").setup({
--              max_width = 1000, 
--              max_height = 1000,
--              })
--            end,
--            opt = {
--              backend = "kitty", 
--              max_width = 1000, 
--              max_height = 1000,
--              max_height_window_percentage = math.huge, 
--              max_width_window_percentage = math.huge, 
--              window_overlap_clear_enabled = true, 
--              window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" }, 
--            }, 
--          },
--        }, 
--        build = ":UpdateRemotePlugins",
----        cmd = "MoltenInit", 
--        init = function()
--          package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
--          package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
--
--           vim.g.molten_image_provider = "image.nvim"
--          vim.g.molten_output_win_max_height = 1000
--        end,
--    }, 
--  },
--  event = "VeryLazy",
--  config = function()
--    local nn = require "notebook-navigator"
--    nn.setup({ activate_hydra_keys = "<leader>h" })
--  end,
--},
--{
--  "GCBallesteros/jupytext.nvim",
--  config = true,
--  lazy=false,
--}
}
