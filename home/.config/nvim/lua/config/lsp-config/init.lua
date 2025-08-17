local nvim_lsp = require("lspconfig")

require("mason-tool-installer").setup({
	ensure_installed = {
		"gopls",
		"goimports",
		"lua_ls",
		"stylua",
	},
	auto_update = true,
})

local capabilities_with_completion =
	require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"bashls",
	"vimls",
	"gopls",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities_with_completion,
		root_dir = nvim_lsp.util.root_pattern(".git"),
	})
end

vim.lsp.config.lua_ls = {
	capabilities = capabilities_with_completion,
	init_options = { documentFormatting = false },
	cmd = { "lua-language-server", "--stdio" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			-- format = { enable = false },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
}

-- vim.lsp.config.gopls = {
--     capabilities
-- }
