-- 0. 关键设置：将等待时间缩短为 300ms
-- 这样按下空格后，如果 0.3秒 内没按 f/b/e，菜单就会立刻弹出，不再感觉卡顿
vim.opt.timeoutlen = 300

local vscode = require("vscode-neovim")
local map = vim.keymap.set

-- 1. 定义菜单逻辑
map("n", "<leader>", function()
  local menu_items = {
    -- 修正：让菜单的 key 与下方的快捷键保持一致，避免混淆
    { key = "f", txt = "查找文件 (Quick Open)", cmd = "workbench.action.quickOpen" },
    { key = "g", txt = "Git 面板", cmd = "workbench.view.scm" },
    { key = "r", txt = "重命名符号", cmd = "editor.action.rename" },
    { key = "b", txt = "切换侧边栏 (Bar)", cmd = "workbench.action.toggleSidebarVisibility" },
    { key = "e", txt = "文件资源管理器 (Explorer)", cmd = "workbench.view.explorer" },
    { key = "z", txt = "禅模式 (Zen Mode)", cmd = "workbench.action.toggleZenMode" },
  }

  vim.ui.select(menu_items, {
    prompt = "Actions (快捷菜单)",
    format_item = function(item)
      return string.format("[%s] %s", item.key, item.txt)
    end,
  }, function(choice)
    if choice then
      vscode.call(choice.cmd)
    end
  end)
end)

-- 2. 定义具体的组合快捷键 (用于盲打)
-- [空格 + f] 查找文件
map("n", "<leader>f", function() vscode.call("workbench.action.quickOpen") end)

-- [空格 + g] Git 面板
map("n", "<leader>g", function() vscode.call("workbench.view.scm") end)

-- [空格 + r] 重命名
map("n", "<leader>r", function() vscode.call("editor.action.rename") end)

-- [空格 + b] 切换侧边栏 (Bar)
map("n", "<leader>b", function() vscode.call("workbench.action.toggleSidebarVisibility") end)

-- [空格 + e] 聚焦资源管理器 (Explorer)
map("n", "<leader>e", function() vscode.call("workbench.view.explorer") end)

-- [空格 + z] 禅模式
map("n", "<leader>z", function() vscode.call("workbench.action.toggleZenMode") end)
