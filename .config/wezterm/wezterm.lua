local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- フォントサイ
config.font_size = 12.0
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.9
-- カラースキーム(https://wezterm.org/colorschemes/index.html)
-- config.color_scheme = 'Solarized Dark (Gogh)'
config.color_scheme = 'Kanagawa (Gogh)'
-- フォント設定
config.font = wezterm.font 'HackGen Console NF'

-- タイトルバーを非表示にする
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- ■ 初期サイ
config.initial_cols = 120
config.initial_rows = 40

-- キーバインド
config.keys = {

  -- ⌘ Ctrl fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'CTRL|CMD',
    action = wezterm.action.ToggleFullScreen
  },
  -- ⌘ + でフォントサイズを大きくする
  {
    key = "+",
    mods = "CMD|SHIFT",
    action = wezterm.action.IncreaseFontSize,
  },
  -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- ⌘ Ctrl ,で下方向にペイン分割
  {
    key = ",",
    mods = "CMD|CTRL",
    action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
  },
  -- ⌘ Ctrl .で右方向にペイン分割
  {
    key = ".",
    mods = "CMD|CTRL",
    action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
  },
  -- ⌘ Ctrl oでペインの中身を入れ替える
  {
    key = "o",
    mods = "CMD|CTRL",
    action = wezterm.action.RotatePanes 'Clockwise'
  },
  -- ⌘ Ctrl hjklでペインの移動
  {
    key = 'h',
    mods = 'CMD|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'CMD|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'CMD|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'CMD|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  -- ⌘ Ctrl Shift hjklでペイン境界の調整
  {
    key = 'h',
    mods = 'CMD|CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 2 },
  },
  {
    key = 'j',
    mods = 'CMD|CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 2 },
  },
  {
    key = 'k',
    mods = 'CMD|CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 2 },
  },
  {
    key = 'l',
    mods = 'CMD|CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 2 },
  },
  -- Cmd + Shift + X でコピーモード開始
  {
    key = 'X',
    mods = 'CMD|SHIFT',
    action = act.ActivateCopyMode
  },
  -- Cmd + Shift + Space でクイックセレクト開始
  {
    key = 'Space',
    mods = 'CMD|SHIFT',
    action = act.QuickSelect,
  },

}

return config
