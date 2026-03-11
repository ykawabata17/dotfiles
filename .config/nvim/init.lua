-- Neovim 設定エントリーポイント

-- コア設定の読み込み
require("core.options") -- 基本オプション
require("core.keymaps") -- キーマッピング
require("core.diagnostics").setup() -- 診断設定

-- プラグイン管理（lazy.nvim）
require("plugins")
