-- 在 Neovim 中创建和退出自定义终端

-- 定义函数以创建终端
function create_horizon_terminal()
  -- 获取当前窗口的宽度和高度
  local width = vim.fn.winwidth(0)
  local height = vim.fn.winheight(0)

  -- 计算终端的新高度（窗口高度的一半）
  local new_height = math.floor(height / 3)

  -- 打开一个新的水平分割窗口，并设置高度为新高度
  vim.cmd('belowright split')
  vim.cmd('resize ' .. new_height)

  -- 打开一个新的终端，可以根据需要更改终端命令
  vim.cmd('term')
end

-- 定义函数以创建终端
function create_vertical_terminal()
  -- 获取当前窗口的宽度和高度
  local width = vim.fn.winwidth(0)
  local height = vim.fn.winheight(0)

  -- 计算终端的新高度（窗口高度的一半）
  local new_width = math.floor(width/ 2)

  -- 打开一个新的水平分割窗口，并设置高度为新高度
  vim.cmd('belowright vsplit')
  -- vim.cmd('vertical resize ' .. new_height)

  -- 打开一个新的终端，可以根据需要更改终端命令
  vim.cmd('term')
end


-- 定义函数以退出终端
function exit_terminal()
  -- 退出终端并关闭当前窗口
  vim.cmd('bd!')
end

vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>lua create_horizon_terminal()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ctv', '<cmd>lua create_vertical_terminal()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>et', '<cmd>lua exit_terminal()<CR>', { noremap = true, silent = true })
