-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins using lazy.nvim
require('lazy').setup({
  -- nvim-treesitter with automatic updates
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('treesitter-configs')
    end
  },

  -- coc.nvim
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('coc-configs')
    end
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree-configs')
    end
  },

  -- Neogen for annotation generation
  {
    'danymat/neogen',
    config = function()
      require('neogen-configs')
    end
  },

  -- Lazygit
  'kdheepak/lazygit.nvim',

  -- fzf with post-install hook
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
    config = function()
      require('fzf-configs')
    end
  },

  -- toggleterm.nvim
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('term-configs')
    end
  },

  -- nvim-dap for debugging
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('dap-configs')
    end
  },
  'mfussenegger/nvim-dap-python',

  -- Telescope and dependencies
  {
    'nvim-lua/plenary.nvim',
    lazy = true
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope-configs')
    end
  },

  -- Barbar for tabline
  {
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('barbar-configs')
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup()
    end
  },

  -- Indent blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl-configs')
    end
  },

  -- Themes
  'navarasu/onedark.nvim',
  'Mofiqul/dracula.nvim',
  'folke/tokyonight.nvim'
})


