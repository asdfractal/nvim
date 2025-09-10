local opt = vim.opt

-- opt.guicursor = ""

opt.number = true
opt.relativenumber = true
opt.winborder = "rounded"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = ""

opt.listchars = {
	eol = "↲",
	tab = "» ",
	trail = "␣",
	extends = "…",
	precedes = "…",
	conceal = "┊",
	nbsp = "☠",
}
opt.list = false

opt.smartcase = true
opt.ignorecase = true
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.formatoptions:remove("o")

opt.wrap = true
opt.linebreak = true

local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end

opt.wildmenu = true
