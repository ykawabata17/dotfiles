-- これをいれとくだけで Neovim が高速になるらしい
vim.loader.enable()

---------------------------------------------------
-- VERSION CHECK!
-------------------------------------------------
local version = vim.version
local expected_ver = "0.9.5"
local ev = version.parse(expected_ver)
local actual_ver = version()
-- バージョンが想定と異なればエラーを出力して知らせるようにする
if version.cmp(ev, actual_ver) ~= 0 then
  local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
  local msg = string.format("Expect nvim %s, but got %s instead. Use at your own risk!", expected_ver, _ver)
  vim.api.nvim_err_writeln(msg)
end


-------------------------------------------------
-- 設定ファイルを読み込む
-------------------------------------------------
local core_conf_files = {
  "options.lua",
  "keybinds.lua", 
  "plugins.lua",
}

for _, file_name in ipairs(core_conf_files) do
  local module_name, _ = string.gsub(file_name, "%.lua", "")
  require(module_name)
end

