local present, _ = pcall(require, "packerInit")
local packer

if present then
  packer = require "packer"
else
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
		use {'bluz71/vim-nightfly-guicolors'}
		use {'Shatur/neovim-ayu'}
		use {'folke/tokyonight.nvim'}
		use {'mhartington/oceanic-next'}
		use {'marko-cerovac/material.nvim'}
		use {'christianchiarulli/nvcode-color-schemes.vim'}
    use {'EdenEast/nightfox.nvim'}
    use {"Pocco81/Catppuccino.nvim"}

	  use {'folke/lsp-colors.nvim'}
		use {
	    'norcalli/nvim-colorizer.lua',
	    event = "BufRead",
      config = function() require('colorizer').setup() end,
	  }

    --LSP Plugins
		use {
	    'neovim/nvim-lspconfig',
	    config = function() require('plugins.lspconfig') end
	  }
    use {
      'alexaandru/nvim-lspupdate',
    }
		use {
	    'hrsh7th/nvim-compe',
	    event = "InsertEnter",
	    config = function() require('plugins.completion') end
	  }

    --Appearance helps
		use {
			'nvim-treesitter/nvim-treesitter',
      event = "BufRead",
			run = ":TSUpdate",
	    config = function() require('plugins.treesitter') end
		}
		use {'lukas-reineke/indent-blankline.nvim', event = "BufRead"}

    --UI Plugins
		use {
	    'akinsho/bufferline.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
	    config = function() require('plugins.bufferline') end
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

    --Navigation or Convenient Editing related Things
		use {
	    'windwp/nvim-autopairs',
	    after = "nvim-compe",
	    config = function() require('plugins.autopairs') end
	  }
		use {
	    'ggandor/lightspeed.nvim',
	    config = function() require('plugins.lightspeed') end
	  }
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}
	  use {'mattn/emmet-vim', event = "BufRead"}
	  use {'tpope/vim-surround', event = "BufRead"}
		-- use {'chaoren/vim-wordmotion', event = "BufRead"}
		use {
	    'b3nj5m1n/kommentary',
      event = "BufRead",
	    config = function() require('plugins.kommentary') end
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
      '~/Projects/gomove.nvim',
      config = function() require('gomove').setup({
        move_past_end_of_line = true,
        move_past_end_of_file = true,
      }) end
    }
	end
)
