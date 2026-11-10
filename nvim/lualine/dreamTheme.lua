-- lualine theme for dreamTheme; mirrors ~/dotfiles/vim/autoload/airline/themes/dreamtheme.vim.
-- LazyVim's lualine uses theme = "auto", which picks this file whenever colors_name is dreamTheme.
local c = {
	ink = "#14141C",
	raised = "#1F1F29",
	surface = "#2B2B32",
	dim = "#7A7A8C",
	text = "#E5E5EA",
	turquoise = "#40E0D0",
	deeppink = "#FF1493",
	amber = "#F0C840",
	blueviolet = "#8A2BE2",
	coral = "#FF7F50",
}

local function mode(fg, bg)
	return {
		a = { fg = fg, bg = bg, gui = "bold" },
		b = { fg = c.text, bg = c.surface },
		c = { fg = c.text, bg = c.raised },
	}
end

return {
	normal = mode(c.ink, c.turquoise),
	insert = mode(c.ink, c.deeppink),
	visual = mode(c.text, c.blueviolet),
	replace = mode(c.ink, c.coral),
	command = mode(c.ink, c.amber),
	terminal = mode(c.ink, c.turquoise),
	inactive = {
		a = { fg = c.dim, bg = c.raised },
		b = { fg = c.dim, bg = c.raised },
		c = { fg = c.dim, bg = c.raised },
	},
}
