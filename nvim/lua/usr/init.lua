require("usr.options")
require("usr.lazy")
require("usr.lsp")
require("usr.cmp")
require("usr.code_runner")
require("usr.hydra")
require("usr.nvim-tree")
require("usr.nvim-treesitter")
require("usr.orgmode")
require("usr.telescope")
require("usr.version")
require("usr.which-key")
require("usr.colorscheme")
require("usr.bufferline")
require("usr.lualine")
require("usr.neovide")
require("usr.toggleterm")
-- require("usr.window-focus")
require("colorizer").setup({ "css", "javascript", "vim", html = { mode = "foreground" } })
require("nvim-surround").setup()
require("gitsigns").setup({ signcolumn = false, numhl = true })
require("leap").add_default_mappings()
require("flit").setup({})
require("nvim-autopairs").setup()
require("fidget").setup()
-- require("nvim-navic").setup() -- 这个插件很久没更新了，也不需要在这里配置
require("barbecue").setup()
-- require("nvim-lightbulb").update_lightbulb()
require("debugprint").setup()

-- require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
-- require("luasnip.loaders.from_vscode").load({paths = "~/.config/nvim/snippets"})

-- workaround for https://github.com/neovim/neovim/issues/21856
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 10m")
  end,
})

-- 导航栏
require("aerial").setup({
  backends = { "markdown", "man", "lsp", "treesitter" },
  layout = {
    max_width = { 30, 0.15 },
    placement = "edge",
    default_direction = "left",
  },
  attach_mode = "global",
  disable_max_lines = 20000,
})

-- 书签
require("bookmarks").setup({
  mappings_enabled = false,
  virt_pattern = { "*.lua", "*.md", "*.c", "*.h", "*.sh", "*.py" },
})

require("persisted").setup({
  autoload = true,
  should_save = function()
    -- Do not save if the alpha dashboard is the current filetype
    if vim.bo.filetype == "NvimTree" then
      return false
    end
    return true
  end,
})

-- 连按 Ecs 取消高亮
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
