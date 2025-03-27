-- プロジェクト管理プラグインの設定

return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Gemfile" },
      detection_methods = { "pattern" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "global",
    })
    require("telescope").load_extension("projects")
  end,
}
