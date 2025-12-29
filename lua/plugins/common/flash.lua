return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    -- 用 s 在屏幕任意位置飞来 飞去
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    -- 用 S 快速选中函数、类等代码块。
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- 用 r 配合 y/d 进行远程复制或删除。
    -- { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    -- 用 R 配合 y/d 快速选中代码块。
    -- { "R", mode =  { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- 用 <c-s> 增强原本的搜索功能。
    -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}
