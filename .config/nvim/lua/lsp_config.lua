-- General Settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    --'additionalTextEdits',
  }
}

--Deno Language Server (Javascript)
--require'lspconfig'.denols.setup{
--	init_options = {
--		enable = true,
--		lint= true,
--		unstable = false
--	}
--}

--Typescript Language Server (Javascript, Typescript)
require'lspconfig'.tsserver.setup{}

--HTML Language Server
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

--Lua Language Server
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/usr'
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
