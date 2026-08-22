-- 获取 lazy.nvim 的安装路径
-- vim.fn.stdpath("data") 在 Linux 上通常类似：
-- ~/.local/share/nvim
-- 所以最终路径类似：
-- ~/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 检查 lazy.nvim 是否已经存在
if not vim.uv.fs_stat(lazypath) then
	-- 如果不存在，就使用 git clone 下载 lazy.nvim
	local out = vim.fn.system({
		"git",
		"clone",

		-- 使用 Git 的 partial clone，减少不必要的下载内容
		"--filter=blob:none",

		-- 使用 lazy.nvim 的 stable 分支
		"--branch=stable",

		-- lazy.nvim 的 GitHub 仓库地址
		"https://github.com/folke/lazy.nvim.git",

		-- 下载到 lazypath 指定的目录
		lazypath,
	})

	-- vim.v.shell_error 表示上一条 shell 命令的退出状态
	-- 0 表示成功，非 0 表示失败
	if vim.v.shell_error ~= 0 then
		error("Failed to clone lazy.nvim:\n" .. out)
	end
end

-- 把 lazy.nvim 加到 Neovim 的 runtimepath 最前面
-- 这样后面的 require("lazy") 才能够找到 lazy.nvim
vim.opt.rtp:prepend(lazypath)

-- 加载 lazy.nvim，并进行配置
require("lazy").setup({
	-- 插件配置来源
	spec = {
		-- 导入 lua/plugins/ 目录中的插件配置
		{ import = "plugins" },
	},

	-- 插件更新检查
	checker = {
		-- false = 不自动检查插件是否有新版本
		enabled = false,
	},

	-- 配置文件变化检测
	change_detection = {
		-- 配置发生变化时，不弹出通知
		notify = false,
	},
})
