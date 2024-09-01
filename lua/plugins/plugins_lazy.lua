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
   -- file browser
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
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
},
    -- noice
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
-- {'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
{'hrsh7th/cmp-cmdline', event = 'ModeChanged'}, 
{'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
{'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
{'hrsh7th/cmp-calc', event = 'InsertEnter'},
{'onsails/lspkind.nvim', event = 'InsertEnter'},
-- {'hrsh7th/vim-vsnip', event = 'InsertEnter'},
-- {'hrsh7th/vim-vsnip-integ', event = 'InsertEnter'},
{'rafamadriz/friendly-snippets', event = 'InsertEnter'},
{'nvim-telescope/telescope.nvim', tag = '0.1.8', 
      dependencies = { 'nvim-lua/plenary.nvim' }
    }, 
{
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
},
{'jose-elias-alvarez/null-ls.nvim'}, 
{'MunifTanjim/prettier.nvim'}, 
{"williamboman/mason.nvim"}, 
{"williamboman/mason-lspconfig.nvim"},
{"neovim/nvim-lspconfig"},
{'brenoprata10/nvim-highlight-colors'}, 
{'dinhhuy258/git.nvim'}, 
{'ray-x/web-tools.nvim'}, 
{"lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}, 
{'anuvyklack/pretty-fold.nvim'}, 
{
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
}, 
}
