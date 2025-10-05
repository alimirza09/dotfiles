vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.opt.formatoptions:remove 'r'
        vim.opt.formatoptions:remove 'o'
    end,
})
vim.opt.winborder = 'rounded'
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = true
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = false

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
local function save_current_buffer()
    if vim.api.nvim_buf_get_name(0) ~= '' then
        vim.cmd 'w'
    else
        print 'Cannot save empty buffer with no name.'
    end
end

vim.keymap.set('n', '<leader>w', save_current_buffer, { desc = 'Save current buffer' })

local function require_all_in_dir(dir_path)
  local config_path = vim.fn.stdpath("config")
  local full_path = config_path .. "/lua/" .. dir_path

  for _, file in ipairs(vim.fn.readdir(full_path, [[v:val =~ '\.lua$']])) do
    local module_name = dir_path .. "." .. file:gsub(".lua$", "")
    require(module_name)
  end
end

require_all_in_dir("plugins")


