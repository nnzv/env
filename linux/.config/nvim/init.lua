-- Options Configuration
vim.opt.nu      = true
vim.opt.nuw     = 5
vim.opt.tgc     = true
vim.opt.et      = true
vim.opt.ea      = true
vim.opt.swf     = false
vim.opt.hls     = false
vim.opt.lz      = true
vim.opt.wb      = false
vim.opt.smc     = 180
vim.opt.wig     = "*.o,*.pyc,*pycache*"
vim.opt.smd     = false
vim.opt.wrap    = false
vim.opt.vif     = "NONE"
vim.opt.ls      = 0
vim.opt.sh      = "/bin/bash"
vim.opt.bk      = false
vim.opt.ru      = false
vim.opt.bg      = "dark"
vim.opt.cb      = "unnamedplus"
vim.opt.ut      = 1000
vim.opt.so      = 10
vim.opt.shm     = "aIF"
vim.opt.ts      = 4
vim.opt.sts     = 4
vim.opt.sw      = 4
vim.opt.fcs.eob = " "
-- Syntax and Colorscheme
vim.cmd("colo pablo | syntax off")
-- Lazy setup
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
-- Keymaps Configuration
for _, map in ipairs({
    { "n", "<C-J>", "<C-W><C-J>" },
    { "n", "<C-K>", "<C-W><C-K>" },
    { "n", "<C-L>", "<C-W><C-L>" },
    { "n", "<C-H>", "<C-W><C-H>" },
}) do
    vim.api.nvim_set_keymap(map[1], map[2], map[3], { noremap = true })
end
-- Remove Arrow Keys
for _, key in ipairs({"<Down>", "<Left>", "<Right>", "<Up>"}) do
    for _, mod in ipairs({"n", "!", "v", "i", "c"}) do
        vim.api.nvim_set_keymap(mod, key, "", { silent = true })
    end
end
-- Plugin Loading
for _, p in ipairs({
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchparen",
    "netrw",
    "netrwFileHandlers",
    "netrwPlugin",
    "netrwSettings",
    "rrhelper",
    "spellfile_plugin",
    "sql_completion",
    "syntax_completion",
    "tar",
    "tarPlugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "vimsyn_embed"
}) do
    vim.g["loaded_" .. p] = 1
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "ledger/vim-ledger"
    },
    {
        "norcalli/nvim-colorizer.lua"
    },
    { 
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    }
})
