local present, packer = pcall(require, "packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup(
	function()
		use {
      'wbthomason/packer.nvim',
      event = 'VimEnter',
    }
    --Fennel :)
    use {
      'rktjmp/hotpot.nvim',
      after = 'packer.nvim',
      config = function() require('hotpot') end
    }

    --Colors
		use {'Shatur/neovim-ayu'}
		use {'folke/tokyonight.nvim'}
    use {'ful1e5/onedark.nvim'}
    use {'EdenEast/nightfox.nvim'}
    use {"catppuccin/nvim"}
    use {"projekt0n/github-nvim-theme"}

		use {
	    'norcalli/nvim-colorizer.lua',
	    event = "BufRead",
      config = function() require('colorizer').setup() end,
	  }

    --LSP Plugins
		use {
	    'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-cmdline',
      },
	    config = function() require('plugins.cmp') end
	  }
		use {
	    'neovim/nvim-lspconfig',
	    config = function() require('plugins.lspconfig') end
	  }

    --Appearance helps
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ":TSUpdate",
	    config = function() require('plugins.treesitter') end
		}
		use {'lukas-reineke/indent-blankline.nvim', event = "BufRead"}
    use {
      'folke/zen-mode.nvim',
      config = function() require('plugins.zen-mode') end
    }

    --UI Plugins
    use {
      'noib3/nvim-cokeline',
      requires = {'kyazdani42/nvim-web-devicons'},
	    config = function() require('plugins.cokeline') end
    }
		use {
	    'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      cmd = "NvimTreeToggle",
      config = function() require('plugins.nvimtree') end
	  }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
      },
      config = function() require('plugins.telescope') end
    }
    use {
      "folke/which-key.nvim",
      config = function() require("which-key").setup {} end
    }

    --Navigation or Convenient Editing related Things
    use {
      'ggandor/lightspeed.nvim',
      config = function() require('plugins.lightspeed') end
    }
		use {
	    'windwp/nvim-autopairs',
	    config = function() require('plugins.autopairs') end
	  }
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}
	  use {'mattn/emmet-vim', event = "BufRead"}
	  use {'tpope/vim-surround', event = "BufRead"}
		use {'chaoren/vim-wordmotion', event = "BufRead"}
		use {
	    'numToStr/Comment.nvim',
      event = "BufRead",
	    config = function() require('Comment').setup() end
	  }

    --Others
    use {
      'lewis6991/gitsigns.nvim',
      event = "BufRead",
      requires = {'nvim-lua/plenary.nvim'},
      config = function() require('gitsigns').setup() end
    }

    --Development
    use {
      '~/Projects/nvim-gomove',
      -- 'booperlv/nvim-gomove',
      config = function() require('plugins.gomove') end
    }
	end
)
