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
      event = "VimEnter"
    }

    --Colors
		use {'bluz71/vim-nightfly-guicolors'}
		use {'Shatur/neovim-ayu'}
		use {'folke/tokyonight.nvim'}
		use {'mhartington/oceanic-next'}
		use {'marko-cerovac/material.nvim'}
		use {'christianchiarulli/nvcode-color-schemes.vim'}

	  use {'folke/lsp-colors.nvim'}
		use {
	    'norcalli/nvim-colorizer.lua',
	    event = "BufRead"
	  }

    --LSP Plugins
		use {
	    'neovim/nvim-lspconfig',
      event = "BufRead",
	    config = function() require('plugins.lspconfig') end
	  }
		use {
	    'hrsh7th/nvim-compe',
	    event = "InsertEnter",
	    config = function() require('plugins.completion') end
	  }
		use {
	    'windwp/nvim-autopairs',
	    after = "nvim-compe",
	    config = function() require('nvim-autopairs').setup() end
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
	    'akinsho/nvim-bufferline.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
	    config = function() require('plugins.bufferline') end
	  }
		use {
	    'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      cmd = "NvimTreeToggle"
	  }
		use {
	    'camspiers/snap',
	    config = function() require('plugins.snap') end
	  }
		use {
	    'folke/trouble.nvim',
      event = "BufRead",
      requires = {'kyazdani42/nvim-web-devicons'},
	    config = function() require('trouble').setup() end
	  }
		use {
	    'booperlv/cyclecolo.lua',
	    config = function() require('plugins.cyclecolo') end
	  }

    --Navigation or Convenient Code Manipulation :DD
		use {
	    'ggandor/lightspeed.nvim',
      event = "BufRead",
	    config = function() require('plugins.lightspeed') end
	  }
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}
	  use {'mattn/emmet-vim', event = "BufRead"}
	  use {'tpope/vim-surround', event = "BufRead"}
		use {'chaoren/vim-wordmotion', event = "BufRead"}
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
    
	end
)
