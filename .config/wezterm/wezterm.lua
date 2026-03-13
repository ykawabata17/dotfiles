local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- フォントサイ
config.font_size = 12.0
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.9
-- カラースキーム（Neovim と統一）
config.color_scheme = 'Catppuccin Mocha'
-- フォント設定（フォールバック付き）
config.font = wezterm.font_with_fallback({
  'HackGen Console NF',
  'JetBrains Mono',
  'Menlo',
})

-- タイトルバーを非表示にする
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
-- ステータスバー表示のため常にタブバーを表示
config.hide_tab_bar_if_only_one_tab = false

-- ■ 初期サイ
config.initial_cols = 120
config.initial_rows = 40

-- キーバインド
config.keys = {
  -- Ctrl + SHIFT + O で透過設定を切り替える
  {
    -- キー設定: Ctrl + Shift + O
    key = 'O',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      -- 現在の設定上書き（Overrides）を取得
      local overrides = window:get_config_overrides() or {}

      -- 透過率が設定されているかチェック
      if overrides.window_background_opacity == 1.0 then
        -- 1.0 (不透明) なら、設定を削除してデフォルト (0.9) に戻す
        overrides.window_background_opacity = nil
      else
        -- それ以外 (デフォルトの0.9の状態) なら、1.0 (不透明) に設定する
        overrides.window_background_opacity = 1.0
      end

      -- 新しい設定をウィンドウに適用
      window:set_config_overrides(overrides)
    end),
  },

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

  -- ■ Workspace 管理
  -- Cmd + Shift + W でワークスペース一覧を表示
  {
    key = 'W',
    mods = 'CMD|SHIFT',
    action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
  -- Cmd + Shift + N で新しいワークスペースを作成
  {
    key = 'N',
    mods = 'CMD|SHIFT',
    action = act.PromptInputLine {
      description = wezterm.format({
        { Foreground = { Color = '#cba6f7' } },
        { Text = 'Enter name for new workspace:' },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace { name = line },
            pane
          )
        end
      end),
    },
  },
}

-- ステータスバー: 現在のワークスペース名とディレクトリを表示
wezterm.on('update-right-status', function(window, pane)
  local workspace = window:active_workspace()
  local cwd = ''
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local file_path = cwd_uri.file_path
    local home = os.getenv('HOME')
    if home and file_path then
      cwd = file_path:gsub('^' .. home, '~')
    end
  end

  window:set_right_status(wezterm.format({
    { Foreground = { Color = '#7f849c' } },
    { Text = ' ' .. cwd .. '  ' },
    { Foreground = { Color = '#cba6f7' } },
    { Text = '  ' .. workspace .. ' ' },
  }))
end)

return config
