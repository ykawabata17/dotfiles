-- UI関連の設定

local M = {}

-- UI設定の初期化
function M.setup()
  -- 診断アイコンの設定
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- 折りたたみ設定
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldenable = false
  vim.opt.foldlevel = 99

  -- 非アクティブウィンドウの色を変更
  vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
      vim.opt_local.winhighlight = ""
    end,
  })

  vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
      vim.opt_local.winhighlight = "Normal:NormalNC"
    end,
  })

  -- カーソル行のハイライト設定
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
      vim.opt_local.cursorline = false
    end,
  })

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      vim.opt_local.cursorline = true
    end,
  })

  -- 最後に編集した場所を記憶
  vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })

  -- ハイライトヤンク
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
  })

  -- ターミナルモード設定
  vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.cmd("startinsert")
    end,
  })

  -- ファイルタイプ別設定
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
    end,
  })

  -- 自動的にquickfixを開く
  vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = { "[^l]*" },
    callback = function()
      vim.cmd("cwindow")
    end,
  })

  vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = { "l*" },
    callback = function()
      vim.cmd("lwindow")
    end,
  })

  -- 未使用のプラグインを無効化
  local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
  }

  for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

return M
