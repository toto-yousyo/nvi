-- create md file, and input front matter to new md.file from template.
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.md", 
  command = "0r ~/.config/nvim/templates/markdown_frontmatter.md", 
})
