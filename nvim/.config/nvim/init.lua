require("init")

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/catppuccin/nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/karb94/neoscroll.nvim',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/jiaoshijie/undotree',
  'https://github.com/NMAC427/guess-indent.nvim',
  'https://github.com/folke/flash.nvim',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
})

-- Telescope
require('telescope').setup {}
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

require('bufferline').setup {}

-- Neoscroll
require('neoscroll').setup {}

-- Comment
require('Comment').setup {}

-- Gitsigns
require('gitsigns').setup {}

-- Which-key
require('which-key').setup {}

-- Todo-comments
require('todo-comments').setup {}

-- Undotree
require('undotree').setup {}

-- Conform (formatter)
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
  },
}

vim.keymap.set('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment line' })

vim.keymap.set('v', '<leader>/', function()
  require('Comment.api').toggle.linewise.visual()
end, { desc = 'Toggle comment block' })

vim.keymap.set('n', '<leader>l', '<Cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>h', '<Cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>c', '<Cmd>bdelete<CR>', { desc = 'Close buffer' })

