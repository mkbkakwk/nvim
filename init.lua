vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = -1

vim.diagnostic.config({
	virtual_text = true, -- 在代码行末尾直接显示诊断信息
	signs = true, -- 在左侧 sign column 显示错误/警告图标
	underline = true, -- 给有问题的代码加下划线
	severity_sort = true, -- 按严重程度排序：Error > Warn > Info > Hint
})
