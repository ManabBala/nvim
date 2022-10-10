local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- nightfox colorscheme
    use 'EdenEast/nightfox.nvim'
    use {'kyazdani42/nvim-web-devicons',
        event = "VimEnter",
        config = function() require "nvim-web-devicons" end}
    use {'nvim-neo-tree/neo-tree.nvim',
        cmd = 'NeoTreeFocusToggle',
        config = function() require "nvim-tree-config" end,}
    use 'nvim-lua/plenary.nvim'
    use {'MunifTanjim/nui.nvim',
        event = "BufEnter"}
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lualine/lualine.nvim'
    use {'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
        config = function () require "plugin-config.toggleterm" end}
    use {'lewis6991/gitsigns.nvim',
        event = "BufEnter",
        config = function() require "plugin-config.gitsigns" end,}
    use 'p00f/cphelper.nvim'
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "ThePrimeagen/vim-be-good"
    -- comments --
    use {'numToStr/Comment.nvim',
        keys = { "gc", "gb", "g<", "g>" },
        config = function() require('Comment').setup() end}
    -- auto pairs
     use {"windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function() require "plugin-config.autopairs" end,}
    -- tabs / buffers
    use {'akinsho/bufferline.nvim',
        after = "nvim-web-devicons",
        config = function() require "plugin-config.bufferline" end,}
    -- LSP servers
    use 'neovim/nvim-lspconfig'
--    use 'williamboman/mason.nvim'
    use "williamboman/nvim-lsp-installer"
      -- Treesitter
    use {
    "nvim-treesitter/nvim-treesitter",
     config = function() require "plugin-config.treesitter" end,
    }
    -- Telescope
    use {"nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function() require "plugin-config.telescope" end,}
    -- snippets
    use {"L3MON4D3/LuaSnip",
        config= function () require("luasnip.loaders.from_vscode").lazy_load() end,}
    --snippet engine
    use "rafamadriz/friendly-snippets"
    -- markdown-preview
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
