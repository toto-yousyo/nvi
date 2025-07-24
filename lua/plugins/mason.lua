return {
  "williamboman/mason.nvim",
  version = "^1.0.0",
  lazy = false,
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end,
}
