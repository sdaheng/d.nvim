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

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require('neo-tree-configs')
    end
  },
  -- nvim-tree
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('nvim-tree-configs')
  --   end
  -- },

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
  'folke/tokyonight.nvim',

  { 
      "vim-scripts/bufexplorer.zip"
  },

  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require('leap-configs')
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
     -- use opts = {} for passing setup options
     -- this is equivalent to setup({}) function
  },

  {
      'tpope/vim-fugitive'
  },
  {
      'neovim/nvim-lspconfig',
      config = function()
          require('lspconfig-configs')
      end
  },

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'onsails/lspkind-nvim',
  'hrsh7th/vim-vsnip',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('cmp-configs')
    end
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require('mason-configs')
    end
  },
-- lazy.nvim
{
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	opts = {}, -- needed even when using default config

	-- recommended: disable vim's auto-folding
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
},
  'mileszs/ack.vim',
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('codecompanion-configs')
    end
  },
  -- 'github/copilot.vim'

--   {
--   'saghen/blink.cmp',
--   -- optional: provides snippets for the snippet source
--   dependencies = 'rafamadriz/friendly-snippets',
--
--   -- use a release tag to download pre-built binaries
--   version = '*',
--   -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
--   -- build = 'cargo build --release',
--   -- If you use nix, you can build from source using latest nightly rust with:
--   -- build = 'nix run .#build-plugin',
--
--   ---@module 'blink.cmp'
--   ---@type blink.cmp.Config
--   opts = {
--     -- 'default' for mappings similar to built-in completion
--     -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
--     -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
--     -- See the full "keymap" documentation for information on defining your own keymap.
--     keymap = { preset = 'enter' },
--
--     appearance = {
--       -- Sets the fallback highlight groups to nvim-cmp's highlight groups
--       -- Useful for when your theme doesn't support blink.cmp
--       -- Will be removed in a future release
--       use_nvim_cmp_as_default = true,
--       -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--       -- Adjusts spacing to ensure icons are aligned
--       nerd_font_variant = 'mono'
--     },
--
--     -- Default list of enabled providers defined so that you can extend it
--     -- elsewhere in your config, without redefining it, due to `opts_extend`
--     sources = {
--       default = { 'lsp', 'path', 'snippets', 'buffer' },
--     },
--   },
--   opts_extend = { "sources.default" },
--   config = function()
--     local capabilities = require('blink.cmp').get_lsp_capabilities()
--     local lspconfig = require('lspconfig')
--
--     lspconfig['clangd'].setup({ capabilities = capabilities })
--
--       -- require('blink.cmp-configs')
--   end
-- }
  
})


