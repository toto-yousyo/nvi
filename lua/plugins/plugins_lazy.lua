return {
{
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
        })
    end
},
-- {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
-- },
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
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        window = {
            position = "right",
        },
        event_handlers = {
            {
                event = "file_open_requested",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        },
    },
    cmd = "Neotree",
},
-- tabline 
{
 "kdheepak/tabline.nvim",
     opts = {},
     event = "BufWinEnter",
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
                "bash",
                "comment",
                "css",
                "csv",
                "diff",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "rust",
                "sql",
                "ssh_config",
                "toml",
                "vim",
                "xml",
                "yaml",
                "vimdoc",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
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
    priority = 1000, 
    config = true, 
  }, 
{"stevearc/dressing.nvim", opts = {}},  
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
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      require("mason-null-ls").setup({
        ensure_installed = {
          "prettier",
          "eslint_d",
          "stylua",
        },
        automatic_installation = false,
      })

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.formatting.stylua,
        },
      })
    end,
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
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
}
