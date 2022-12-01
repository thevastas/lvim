vim.opt.relativenumber = true
-- vim.opt.foldmethod = "indent"
-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.dap.active = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black",
    filetypes = { "python" },
    extra_args = { "--line-length", "120" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8",
    filetypes = { "python" },
    extra_args = { "--max-line-length", "120", "--import_order_style", "django" },
  },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    filetypes = { "javascript", "python" },
  }
}

-- Additional Plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  { "morhetz/gruvbox" },
  { "alfredodeza/pytest.vim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "vim-scripts/taglist.vim" },
  { 'preservim/tagbar' },
}
vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
lvim.keys.normal_mode["<leader>ot"] = ":TagbarToggle<CR>"
lvim.keys.normal_mode["<leader>dd"] = "^obreakpoint()<Esc><Shift>$"
lvim.keys.normal_mode["<leader>dm"] = ":Pytest method<CR>"
lvim.keys.normal_mode["<leader>dc"] = ":Pytest class<CR>"
lvim.keys.normal_mode["<leader>db"] = ":Pytest method --pdb -n0<CR>"
lvim.keys.normal_mode["<leader>id"] = ":put =strftime('%c')<CR>"
