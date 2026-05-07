-- Enable LSP servers
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

local map = vim.keymap.set

-- Navigation
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', 'gy', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover' })

-- Refactor / actions
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map({ 'n', 'x' }, '<leader>a', vim.lsp.buf.code_action, { desc = 'Code actions' })
map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format buffer' })
map('x', '<leader>f', vim.lsp.buf.format, { desc = 'Format selection' })
map('n', '<leader>cl', vim.lsp.codelens.run, { desc = 'Run code lens' })

-- Diagnostics
map('n', '[g', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']g', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Telescope LSP pickers
local ok, builtin = pcall(require, 'telescope.builtin')
if ok then
  map('n', '<space>o', builtin.lsp_document_symbols, { desc = 'Document symbols' })
  map('n', '<space>s', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
  map('n', '<space>a', builtin.diagnostics, { desc = 'Show diagnostics' })
end

-- Highlight symbol under cursor on idle
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function() vim.lsp.buf.document_highlight() end,
})
vim.api.nvim_create_autocmd('CursorMoved', {
  callback = function() vim.lsp.buf.clear_references() end,
})

-- Organize imports
vim.api.nvim_create_user_command('OR', function()
  vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
end, {})
