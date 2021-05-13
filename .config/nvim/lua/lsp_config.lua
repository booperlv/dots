--Deno Language Server (Javascript)
--require'lspconfig'.denols.setup{
--	init_options = {
--		enable = true,
--		lint= false,
--		unstable = false
--	}
--}

--Typescript Language Server (Javascript, Typescript)
require'lspconfig'.tsserver.setup{}

--HTML Language Server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
    capabilities = capabilities,
}

--CSS Language Server
require'lspconfig'.cssls.setup {
    capabilities=capabilities,
}

--Vim Language Server
require'lspconfig'.vimls.setup{}

--Bash Language Server
require'lspconfig'.bashls.setup{}

--Python Language Server
require'lspconfig'.jedi_language_server.setup{}

--C Language Server
require'lspconfig'.clangd.setup{}
