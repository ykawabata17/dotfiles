-- 移動強化（leap）の設定

return {
  "ggandor/leap.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "tpope/vim-repeat" },
  config = function()
    require("leap").add_default_mappings()
  end,
}
