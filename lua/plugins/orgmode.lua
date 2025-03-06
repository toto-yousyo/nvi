return {
  -- orgmode
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { 'org' },
    config = function()
      require('orgmode').setup({
        org = {
          link = {
            -- 画像リンクを開く時にmacのプレビューを使用
            open = function(path)
              -- macのopenコマンドを使用してデフォルトアプリを開く
              vim.fn.jobstart({ 'open', path }, { detach = true })
            end,
          },
        },
        org_agenda_files = { '~/.config/nvim/org/*' },
        org_default_notes_file = '~/.config/nvim/org/refile.org',
        org_hide_emphasis_markers = true,
        org_todo_keywords = { 'TODO', 'DOING', 'PENDING', 'DONE' },
        org_capture_templates = {
          T = { description = 'Todo', template = '* TODO %?\n  %u' },
          D = { description = 'Deadline', template = '* TODO %?\n  DEADLINE: %t' },
          E = { description = 'Event', template = '* %?\n  SCHEDULED: %t' },
          j = { description = 'journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?', target = '~/.config/nvim/org/journal.org' },
          n = { description = 'note', template = '\n* %<%Y-%m-%d> %<%A>\n\n%?', target = '~/.config/nvim/org/note.org' },
        },
      })
    end,
  },
}
