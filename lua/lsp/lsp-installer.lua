
 local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup ()


-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	 if server.name == "jsonls" then
	 	local jsonls_opts = require("lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "pyright" then
	 	local pyright_opts = require("lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end

  lspconfig[server.name].setup (opts)
end
