require('fzf-lua').setup {
    files = {
        fd_opts = "--color=never --type f --type l --hidden --exclude .git --exclude '*.obj'",
    }
}

vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = "Find files" })
