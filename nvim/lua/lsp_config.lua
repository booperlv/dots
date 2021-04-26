--Deno Language Server (Javascript)
require'lspconfig'.denols.setup{
	init_options = {
		enable = true,
		lint= false,
		unstable = false
	}
}

--Diagnostic Language Server, Eslint
require'lspconfig'.diagnosticls.setup {
    filetypes = {"javascript", "typescript"},
    init_options = {
        linters = {
            eslint = {
                command = "eslint",
                rootPatterns = {".git"},
                debounce = 100,
                args = {
                    "--stdin",
                    "--stdin-filename",
                    "%filepath",
                    "--format",
                    "json"
                },
                sourceName = "eslint",
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity"
                },
                securities = {
                    [2] = "error",
                    [1] = "warning"
                }
            },
        	filetypes = {
            	javascript = "eslint",
            	typescript = "eslint"
        	}
    	}
  	}
}

--HTML Language Server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

--CSS Language Server
require'lspconfig'.cssls.setup {}

--Vim Language Server
require'lspconfig'.vimls.setup{}

--Bash Language Server
require'lspconfig'.bashls.setup{}

--Python Language Server
require'lspconfig'.jedi_language_server.setup{}

--C Language Server
require'lspconfig'.clangd.setup{}
