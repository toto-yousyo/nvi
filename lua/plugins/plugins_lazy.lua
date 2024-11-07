return {
{
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
},
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm", 
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
  -- use opts = {} for passing setup options
  -- this is equivalent to setup({}) function
}, 
--{
--  "nvim-neo-tree/neo-tree.nvim",
--  branch = "v3.x",
--  dependencies = {
--      "nvim-lua/plenary.nvim",
--      "nvim-tree/nvim-web-devicons",
--      "MunifTanjim/nui.nvim",
--  },
--  opts = {
--      window = {
--          position = "right",
--      },
--      event_handlers = {
--          {
--              event = "file_open_requested",
--              handler = function()
--                  require("neo-tree.command").execute({ action = "close" })
--              end,
--          },
--      },
--  },
--  cmd = "Neotree",
--},
-- tabline 
-- {
--  "kdheepak/tabline.nvim",
    -- opts = {},
    -- event = "BufWinEnter",
-- },
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
{'onsails/lspkind.nvim', event = 'InsertEnter'},
{'rafamadriz/friendly-snippets', event = 'InsertEnter'},

{
  'nvim-telescope/telescope.nvim', tag = '0.1.8', 
    dependencies = { 'nvim-lua/plenary.nvim' }
}, 
{
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
},
{'MunifTanjim/prettier.nvim'}, 
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
      rocks = { "magick" }, 
  }, 
  config = true, 
}, 
--{
--  "nvim-neorg/neorg",
--  lazy = false, 
--  version = "*", 
--  config = true, 
--},
{"stevearc/dressing.nvim", opts = {}},  
 
-- margdown
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.cmd([[do FileType]])
  end,
}, 
{"markdown-preview.nvim"}, 
{
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "norg", "rmd", "org" },
    code = {
      sign = false,
      width = "block",
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
  },
},
{
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      ["markdown-toc"] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find("<!%-%- toc %-%->") then
              return true
            end
          end
        end,
      },
      ["markdownlint-cli2"] = {
        condition = function(_, ctx)
          local diag = vim.tbl_filter(function(d)
            return d.source == "markdownlint"
          end, vim.diagnostic.get(ctx.buf))
          return #diag > 0
        end,
      },
    },
    formatters_by_ft = {
      ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
    },
  },
}, 
{
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
    },
  },
},   
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
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
}, 
{
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" }, 
    { "nvim-lua/plenary.nvim" }, 
  }, 
  build = "make tiktoken", 
  opts = {
    debug = true,
    mappings = {
      complete = {
        detail = 'Use @<Tab> or /<Tab> for options.',
        insert ='<C-l>',
      },
      reset = {
          normal = '<C-q>', 
          insert = '<C-q>', 
      }, 
    }, 
  }, 
}, 
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
{ "amadeus/vim-mjml" },
{ 
  "ec965/mjml-preview.nvim",
    ft = { "mjml" }, 
    build = "cd app && npm install", 
}, 

-- jupyter notebook
{
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "]h", function() require("notebook-navigator").move_cell "d" end },
    { "[h", function() require("notebook-navigator").move_cell "u" end },
    { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    { "<leader>ax", "<cmd>lua require('notebook-navigator').run_all_cells()<cr>" },
  },
  dependencies = {
    "echasnovski/mini.comment",
    "anuvyklack/hydra.nvim",
--    "hkupty/iron.nvim",
    {
        "benlubas/molten-nvim", 
        version = "^1.6.0", 
        dependencies = {
          {
            "3rd/image.nvim", 
            config = function()
              require("image").setup({
              max_width = 1000, 
              max_height = 1000,
              })
            end,
            opt = {
              backend = "kitty", 
              max_width = 1000, 
              max_height = 1000,
              max_height_window_percentage = math.huge, 
              max_width_window_percentage = math.huge, 
              window_overlap_clear_enabled = true, 
              window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" }, 
            }, 
          },
        }, 
        build = ":UpdateRemotePlugins",
--        cmd = "MoltenInit", 
        init = function()
          package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
          package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

           vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_win_max_height = 1000
        end,
    }, 
  },
  event = "VeryLazy",
  config = function()
    local nn = require "notebook-navigator"
    nn.setup({ activate_hydra_keys = "<leader>h" })
  end,
},
{
  "GCBallesteros/jupytext.nvim",
  config = true,
  lazy=false,
}
}
