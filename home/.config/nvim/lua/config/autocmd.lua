local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lsp_group = augroup("lsp", { clear = true })
local yank_group = augroup("highlight_yank", { clear = true })
local ft_group = augroup("fileType", { clear = true })
local netrw_group = augroup("netrw", { clear = true })

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "WildMenu",
			timeout = 60,
		})
	end,
})

autocmd("LspAttach", {
	group = lsp_group,
	callback = function(e)
		local opts = { buffer = e.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
		vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>ve", vim.diagnostic.setqflist, opts)
		-- vim.keymap.set("n", "[d", vim.diagnostic.jump{ count = 1, float = true }, opts)
		-- vim.keymap.set("n", "]d", vim.diagnostic.jump, opts)
		vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

		-- autocmd("BufWritePre", {
		-- 	buffer = e.buf,
		-- 	callback = function()
		-- 		vim.lsp.buf.format { async = false, id = e.data.client_id }
		-- 	end,
		-- })

		-- highlight when hover and rest
		local client = vim.lsp.get_client_by_id(e.data.client_id)
		if client ~= nil then
			if client.name == "templ" then
				vim.cmd("TSContext disable")
			end
		end
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = e.buf,
				group = lsp_group,
				callback = vim.lsp.buf.document_highlight,
			})

			autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = e.buf,
				group = lsp_group,
				callback = vim.lsp.buf.clear_references,
			})

			autocmd("LspDetach", {
				group = augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(e2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = e2.buf })
				end,
			})
		end
	end,
})

-- autocmd("filetype", {
-- 	group = ft_group,
-- 	callback = function(e)
-- 		vim.bo[e.buf].commentstring = "; %s"
-- 	end,
-- 	pattern = { "autohotkey" },
-- })

autocmd("filetype", {
	group = netrw_group,
	callback = function()
		-- vim.keymap.set("n", "<c-j>", ":wincmd j <cr>", { noremap = true })
		-- vim.keymap.set("n", "<c-h>", ":wincmd h <cr>", { noremap = true })
		-- vim.keymap.set("n", "<c-k>", ":wincmd k <cr>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<c-l>", "", {})
	end,
	pattern = { "netrw" },
})
