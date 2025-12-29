-- 0. 基础设置
vim.opt.timeoutlen = 300

local vscode = require("vscode-neovim")
local map = vim.keymap.set

-- 1. 改造后的核心函数：支持按类型筛选
-- @param prefix_type: "leader" | "localleader"
local function get_keymaps(prefix_type)
  local maps = vim.api.nvim_get_keymap('n')
  local items = {}

  local leader = vim.g.mapleader or " "
  local local_leader = vim.g.maplocalleader or "\\"

  for _, m in ipairs(maps) do
    if m.desc then
      local lhs = m.lhs
      local is_match = false
      local display_key = lhs

      -- 根据传入的类型进行筛选
      if prefix_type == "leader" then
        -- 检查是否是 Leader 开头
        if lhs:sub(1, #leader) == leader or lhs:lower():match("^<space>") or lhs:lower():match("^<leader>") then
          is_match = true
          -- 清洗前缀
          display_key = display_key:gsub("^" .. vim.pesc(leader), ""):gsub("^<[sS]pace>", ""):gsub("^<[lL]eader>", "")
        end
      elseif prefix_type == "localleader" then
        -- 检查是否是 LocalLeader 开头
        if lhs:sub(1, #local_leader) == local_leader or lhs:lower():match("^<localleader>") then
          is_match = true
          -- 清洗前缀
          display_key = display_key:gsub("^" .. vim.pesc(local_leader), ""):gsub("^<[lL]ocal[lL]eader>", "")
        end
      end

      if is_match then
        -- 去除开头可能剩余的空白
        display_key = display_key:gsub("^%s+", "")

        table.insert(items, {
          key = display_key,
          desc = m.desc,
          lhs = m.lhs -- 完整按键序列
        })
      end
    end
  end

  -- 按键排序，让菜单更好看
  table.sort(items, function(a, b) return a.key < b.key end)

  return items
end

-- 2. 通用的菜单显示函数
local function show_menu(prefix_type, title)
  local menu_items = get_keymaps(prefix_type)

  if #menu_items == 0 then
    vscode.notify("没有找到 " .. title .. " 相关的快捷键")
    return
  end

  vim.ui.select(menu_items, {
    prompt = title,
    format_item = function(item)
      return string.format("[%s] %s", item.key, item.desc)
    end,
  }, function(choice)
    if choice then
      -- 比如发回 "<space>f"，Neovim 收到后就会触发你定义的 action。
      local keys = vim.api.nvim_replace_termcodes(choice.lhs, true, false, true)
      vim.api.nvim_feedkeys(keys, 'm', true)
    end
  end)
end

-- 3. 分别绑定两个菜单
-- Leader 菜单 (空格)
map("n", "<leader>", function()
  show_menu("leader", "Leader Actions (全局快捷键)")
end)

-- LocalLeader 菜单 (\)
map("n", "<localleader>", function()
  show_menu("localleader", "Local Actions (本地快捷键)")
end)


-- 4. 定义具体的组合快捷键 (用于盲打和填充菜单)

-- === Leader 组 (空格开头) ===
map("n", "<leader>f", function() vscode.call("workbench.action.quickOpen") end, { desc = "🔍 查找文件" })
-- map("n", "<leader>g", function() vscode.call("workbench.view.scm") end, { desc = "🌿 Git 面板" })
-- map("n", "<leader>r", function() vscode.call("editor.action.rename") end, { desc = "✏️ 重命名符号" })
-- map("n", "<leader>b", function() vscode.call("workbench.action.toggleSidebarVisibility") end, { desc = "📊 切换侧边栏" })
-- map("n", "<leader>e", function() vscode.call("workbench.view.explorer") end, { desc = "📁 资源管理器" })
-- map("n", "<leader>z", function() vscode.call("workbench.action.toggleZenMode") end, { desc = "🧘 禅模式" })

-- === LocalLeader 组 (\ 开头) ===
-- map("n", "<localleader>d", function() vscode.call("workbench.view.debug") end, { desc = "🐞 调试面板" })
-- map("n", "<localleader>r", function() vscode.call("workbench.action.debug.start") end, { desc = "▶️ 运行/调试" })
