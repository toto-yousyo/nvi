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
      on_highlights = function(hl, c)
        hl.DiagnosticUnnecessary = { fg = "#777ea0" }
      end, 
      on_colors = function(colors)
        colors.comment = "#777ea0"
        colors.bg_dark = "#161926"
        colors.error = "#777ea0"
      end, 
    })
  end, 
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
              "typescript", 
              "tsx", 
              "json",
              "lua",
              "markdown",
              "python",
              "sql",
              "toml",
              "vim",
              "xml",
              "yaml",
              "regex",
          },
        contenxt_commentstring = {
          enabel = true, 
          enabel_autocmd = false, 
        }, 
        sync_install = false,
        auto_install = true,
--         highlight = { enable = true },
        indent = { enable = true },
      })
  end,
},

-- {
--   'onsails/lspkind.nvim', event = 'InsertEnter', 
--   config = function()
--     require('lspkind').init({
--         symbol_map = {
--           Copilot = '',
--         }, 
--       })
--   end,
-- },

 {
   'nvim-telescope/telescope.nvim', tag = '0.1.8', 
     dependencies = { 'nvim-lua/plenary.nvim' }
 }, 
 {
   "nvim-telescope/telescope-file-browser.nvim",
   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
 },
-- {
--     'MunifTanjim/prettier.nvim', 
--     config = function()
--         local status, prettier = pcall(require, "prettier")
--         if (not status) then return end
--
--         prettier.setup {
--           bin = 'prettierd',
--           filetypes = {
--             "css",
--             "javascript",
--             "javascriptreact",
--             "typescript",
--             "typescriptreact",
--             "json",
--             "scss",
--             "python"
--           }
--         }
--     end,
-- }, 
{'brenoprata10/nvim-highlight-colors'}, 
{'dinhhuy258/git.nvim'}, 
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

-- orgmode
{
  "nvim-orgmode/orgmode", 
  event = "VeryLazy",
  ft = { 'org'},
  config = function()
    require('orgmode').setup({
      org = {
        link = {
          -- 画像リンクを開く時にmacのプレビューを使用
          open = function(path)
            -- macのopenコマンドを使用してデフォルトアプリを開く
              vim.fn.jobstart({'open', path}, {detach = true})
          end, 
        }, 
      }, 
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
{
    'akinsho/toggleterm.nvim', 
    version = "*", 
    opts = {
      size = 100,
      open_mapping = [[<c-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
    }
}, 
-- Select in visualmode, select you want replace words and 'gr'
{'vim-scripts/ReplaceWithRegister'}, 
-- For Commentout
{
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
    end, 
}
-- For Commentout on React-TypeScript
-- {
--   'JoosepAlviste/nvim-ts-context-commentstring',  
--   config = function()
--   require('Comment').setup{
--     pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
--   }
--   end, 
-- }

}
