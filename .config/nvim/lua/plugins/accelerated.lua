return {
  "rainbowhxch/accelerated-jk.nvim",
  config = function()
    -- accelerated-jk.nvimの設定
    require('accelerated-jk').setup({
      mode = 'time_driven',

      -- 減速機能を有効にするかどうか
      enable_deceleration = false,

      -- 加速を適用するモーション（j/kキーを指定）
      acceleration_motions = { 'j', 'k' },

      -- 加速の上限値
      acceleration_limit = 150,

      -- 加速テーブル（数値が大きいほど移動速度が速くなる）
      acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },

      -- 減速テーブル（enable_deceleration = trueの場合に使用）
      -- 例: { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }
      deceleration_table = { { 149, 9999 } },
    })

    -- j/kキーにacceleratedプラグインのマッピングを設定
    vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
    vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})
  end,
}
