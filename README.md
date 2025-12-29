# Neovim Configuration

一个通用、轻量级的 Neovim 配置，支持 **Neovim** 和 **VS Code** 两种编辑器环境。

## ✨ 特性

- 🎯 **双环境支持** - 同一配置文件自动适配 Neovim 和 VS Code 编辑器
- ⚡ **快速启动** - 使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 延迟加载插件，保证快速启动
- 🔄 **模块化设计** - 按不同编辑器环境清晰地组织插件和配置
- 🎨 **人性化快捷键** - 提供便捷的快捷键绑定和交互菜单
- 📋 **自动更新检查** - 定期检查并提示插件更新

## 🚀 快速开始

### 前置要求

- **Neovim** >= 0.8（用于本地编辑）
- **VS Code** + [Neovim extension](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)（用于 VS Code 集成）
- **Git**（用于插件管理）

### 安装

```bash
# Linux/macOS
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Windows
git clone https://github.com/yourusername/nvim-config %APPDATA%\nvim
```

### 首次使用

启动 Neovim，lazy.nvim 会自动下载并安装所有配置的插件：

```bash
nvim
```

## 📦 插件列表

### 通用插件（始终加载）

| 插件 | 功能描述 |
|------|--------|
| **[flash.nvim](https://github.com/folke/flash.nvim)** | 增强的光标导航与代码块选择 |

**Flash.nvim 快捷键：**
- `s` - 快速跳转到屏幕任意位置
- `S` - 使用 Treesitter 快速选中代码块

### Neovim 专属插件

| 插件 | 功能描述 |
|------|--------|
| **[which-key.nvim](https://github.com/folke/which-key.nvim)** | 按键绑定提示菜单 |
| **[smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)** | 光标平滑过渡效果 |

### VS Code 专属配置

VS Code 中启用特定的快捷键和菜单，包括：
- `<leader>f` - 快速打开文件
- `<leader>g` - 打开 Git 面板
- `<leader>r` - 重命名符号
- `<leader>b` - 切换侧边栏
- `<leader>e` - 文件资源管理器
- `<leader>z` - 禅模式

## ⌨️ 快捷键说明

### 通用快捷键

| 快捷键 | 功能 |
|-------|------|
| Space | Leader 键（菜单激活键） |
| `\\` | Local Leader 键 |

### Flash 导航（Neovim + VS Code）

| 快捷键 | 功能 |
|-------|------|
| `s` | 快速跳转 |
| `S` | 选择代码块 |

### Neovim 专属

| 快捷键 | 功能 |
|-------|------|
| `<leader>?` | 显示本地快捷键绑定 |

## 📁 项目结构

```
nvim/
├── init.lua                 # 主配置入口
├── lazy-lock.json          # 插件版本锁定文件
├── README.md               # 本文件
└── lua/
    ├── config/
    │   └── lazy.lua        # lazy.nvim 配置与插件规范
    ├── keymap/
    │   └── vscode.lua      # VS Code 快捷键配置
    └── plugins/
        ├── common/         # 通用插件（始终加载）
        │   ├── empty.lua
        │   └── flash.lua
        └── neovim/         # Neovim 专属插件
            ├── empty.lua
            ├── smear_cursor.lua
            └── which-key.lua
```

## 🎛️ 配置说明

### 系统剪贴板集成

默认配置将 Vim 寄存器与系统剪贴板绑定：
```lua
o.clipboard = "unnamedplus"
```
这使得 `y`(复制)、`d`(删除)、`p`(粘贴) 等操作直接操作系统剪贴板。

### 双环境自动加载

配置会根据编辑环境自动加载不同的插件：
```lua
-- 始终加载
{ import = "plugins.common" },

-- 仅在 Neovim 中加载
{ import = "plugins.neovim", enabled = not vim.g.vscode },

-- 仅在 VS Code 中加载（注释状态）
-- { import = "plugins.vscode", enabled = vim.g.vscode },
```

### 超时时间设置

VS Code 模式下将菜单出现时间设为 300ms，避免延迟感：
```lua
vim.opt.timeoutlen = 300
```

## 🔧 自定义配置

### 添加新插件

1. 在 `lua/plugins/common/` 或 `lua/plugins/neovim/` 中创建新 Lua 文件
2. 返回插件规范对象（lazy.nvim 格式）
3. 重启 Neovim，lazy.nvim 自动加载

示例：
```lua
-- lua/plugins/common/example.lua
return {
  "author/plugin-name",
  opts = {
    -- 配置选项
  },
}
```

### 修改快捷键

编辑相应的文件：
- **VS Code 快捷键** - `lua/keymap/vscode.lua`
- **通用快捷键** - `init.lua`

## 📝 License

MIT License

## 🤝 贡献

欢迎提交 PR 和 Issue！

---

**保持你的编辑环境简洁高效！** ✌️
