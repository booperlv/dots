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

		use {
			'nvim-treesitter/nvim-treesitter',
      event = "BufRead",
			run = ":TSUpdate",
	    config = function() require('plugins.treesitter') end
		}

	  use {'kyazdani42/nvim-web-devicons', opt = true}
		use {
	    'akinsho/nvim-bufferline.lua',
	    config = function() require('plugins.bufferline') end
	  }
		use {
	    'kyazdani42/nvim-tree.lua',
      cmd = "NvimTreeToggle"
	  }
		use {
	    'camspiers/snap',
	    config = function() require('plugins.snap') end
	  }

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

		use {'lukas-reineke/indent-blankline.nvim', event = "BufRead"}
		use {
	    'folke/trouble.nvim',
      event = "BufRead",
	    config = function() require('trouble').setup() end
	  }
		use {
	    'booperlv/cyclecolo.lua',
	    config = function() require('plugins.cyclecolo') end
	  }
	end
)
