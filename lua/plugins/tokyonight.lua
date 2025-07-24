
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
}
