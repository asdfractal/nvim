vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.omni_sql_default_compl_type = "syntax"
vim.g.ftplugin_sql_omni_key = "<C-s>"
vim.g.python3_host_prog = "/usr/local/bin/python3.11"

vim.g.fzf_vim = {}
vim.g.have_nerd_font = true

vim.diagnostic.config({
	jump = { float = true },
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
