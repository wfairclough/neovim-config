local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({"n", "v"}, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("n", "J", "<Nop>", { silent = true })
keymap("n", "K", "<Nop>", { silent = true })
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("n", "<C-d>", "<C-d>zz", { silent = true })
keymap("n", "<C-u>", "<C-u>zz", { silent = true })

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- Alt+l does Tab completion
keymap({"i"}, "<A-l>", "Tab", opts)


-- call vscode commands from neovim

-- general keymaps
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", opts)
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>", opts)
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opts)
keymap({"n", "v"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", opts)
keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", opts)
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>", opts)
keymap({"n", "v"}, "<leader>ww", "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>", opts)
keymap({"n", "v"}, "<leader>wa", "<cmd>lua require('vscode').action('workbench.action.files.saveAll')<CR>", opts)
keymap({"n", "v"}, "<leader>x", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opts)
keymap({"n", "v"}, "<leader>cr", "<cmd>lua require('vscode').action('editor.action.rename')<CR>", opts)
keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", opts)
keymap({"n", "v"}, "<leader>@", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>", opts)
keymap({"n", "v"}, "<leader>s@", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>", opts)
keymap({"n", "v"}, "<leader>fg", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>", opts)
keymap({"n", "v"}, "<leader>/", "<leader>fg", opts)
keymap({"n", "v"}, "<leader>sf", "<cmd>lua require('vscode').action('references-view.findReferences')<CR>", opts)
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>", opts)
keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>", opts)
keymap({"n", "v"}, "<leader>cf", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", opts)
keymap({"n", "v"}, "<leader>rw", "<cmd>lua require('vscode').action('workbench.action.reloadWindow')<CR>", opts)
keymap({"n", "v"}, "<leader>vf", 'ggVG', { desc = "Visally select entire file" }, opts)
keymap({"n", "v"}, "<leader>yf", 'ggVG"+y', { desc = "Visally select entire file" }, opts)

-- harpoon keymaps
keymap({"n", "v"}, "<leader>hm", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>", opts)
keymap({"n", "v"}, "<leader>hh", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>", opts)
keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>", opts)
keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>", opts)
keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>", opts)
keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>", opts)
keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>", opts)
keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>", opts)
keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>", opts)
keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>", opts)
keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>", opts)
keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>", opts)


keymap({"n", "v"}, "<leader>yp", "<cmd>lua require('vscode').action('copyRelativeFilePath')<CR>", opts)
keymap("n", "<leader>yt", function()
	vim.cmd("let @+ = expand('%:t')")
end, opts)
keymap("n", "<leader>yd", function()
	vim.cmd("let @+ = expand('%:p:h')")
end, opts)

-- Highlight Yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

