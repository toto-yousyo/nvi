local function esc(x)
  return (
    x:gsub("%%", "%%%%")
    :gsub("^%^", "%%^")
    :gsub("%$$", "%%$")
    :gsub("%(", "%%(")
    :gsub("%)", "%%)")
    :gsub("%.", "%%.")
    :gsub("%[", "%%[")
    :gsub("%]", "%%]")
    :gsub("%*", "%%*")
    :gsub("%+", "%%+")
    :gsub("%-", "%%-")
    :gsub("%?", "%%?")
  )
end

local function get_cwd()
  local cwd = vim.uv.cwd()
  local git_dir = require("lualine.components.branch.git_branch").find_git_dir(cwd)
  local root = vim.fs.dirname(git_dir)
  if cwd == root then
    return ""
  end
  local d, n = string.gsub(cwd, esc(root) .. "/", "")
  if n == 0 and d == nil then
    return ""
  end
  return "(" .. d .. ")"
end


return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local status, lualine = pcall(require, "lualine")
      if (not status) then return end

      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'dracula',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {}
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1      -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = {
            { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = '? ', warn = '? ', info = '? ',
              hint = '? ' } },
            'encoding',
            'filetype'
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            -- {
            -- 'filename',
            --      file_status = true, -- displays file status (readonly status, modified status)
            --      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            -- }
          },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { 'fugitive' }
      }
    end,
  },
}
