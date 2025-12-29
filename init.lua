require("config.lazy")

if vim.g.vscode then
  require("keymap.vscode")
end

local o = vim.opt
-- 将 Vim 的默认寄存器与系统剪贴板("+)绑定
-- 这样 y (复制), d (删除/剪切), p (粘贴) 都会直接操作你的系统剪贴板
o.clipboard = "unnamedplus"
