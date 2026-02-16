vim.g.mapleader = ' '
vim.o.history = 10000
vim.o.timeout = true
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10
vim.o.updatetime = 2000

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8'
vim.o.fileformats = 'unix,dos,mac'

vim.cmd.syntax('enable')

vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmatch = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
  end
})

vim.filetype.add({
  extension = {
    tf = 'terraform',
    tfvars = 'terraform',
  },
})

vim.o.list = true
vim.o.listchars = 'tab:>>-,trail:-,nbsp:%'

vim.o.backspace = 'indent,eol,start'

if vim.env.SHELL then
  vim.o.shell = vim.env.SHELL
else
  vim.o.shell = '/bin/sh'
end

vim.o.wildmenu = true
vim.o.wildmode = 'longest,list,full'

vim.o.autoread = true
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false

vim.o.clipboard = 'unnamedplus,unnamed'

vim.o.errorbells = false
vim.o.visualbell = false

vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.o.termguicolors = true

vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

vim.o.laststatus = 3

vim.o.title = true
vim.o.titlestring = '%F'

vim.opt.signcolumn = 'yes'
