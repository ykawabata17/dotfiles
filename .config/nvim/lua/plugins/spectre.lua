-- 検索/置換強化（spectre）の設定

return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
  },
  opts = {
    open_cmd = "noswapfile vnew",
  },
}
