vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smartcase")
vim.cmd("set nowrap")
vim.cmd("set noswapfile")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.clipboard = "unnamedplus"

if vim.g.vscode then
  -- VSCode extension
  print("VSCode extension")
else
  -- ordinary Neovim
end

local map = vim.keymap.set

-- Navigate vim panes better
map("n", "<c-k>", ":wincmd k<CR>")
map("n", "<c-j>", ":wincmd j<CR>")
map("n", "<c-h>", ":wincmd h<CR>")
map("n", "<c-l>", ":wincmd l<CR>")

map("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

map("n", "<leader>qq", ":qa<CR>", { desc = "Quit All" })
map("n", "<leader>qw", ":wqa<CR>", { desc = "Write/Quit All" })
map("n", "<leader>qf", "<cmd>qa!<CR>", { desc = "Quit All Force" })
map("n", "<leader>wh", "<C-w>h", { desc = "Focus window left" })
map("n", "<leader>wl", "<C-w>l", { desc = "Focus window right" })
map("n", "<leader>vf", "ggVG", { desc = "Visally select entire file" })
map("n", "<leader>yf", 'ggVG"+y', { desc = "Visally select entire file" })
map("n", ";", ":", { nowait = true })
-- map("n", "<M-?>", "<cmd>Telescope help_tags<CR>", { nowait = true, silent = true })

-- Disable the S-Down and S-Up paging mappings
map("n", "<S-Down>", "<Nop>", { silent = true })
map("n", "<S-Up>", "<Nop>", { silent = true })

map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })

map("n", "<leader>yp", function()
  vim.cmd("let @+ = expand('%:p')")
end)
map("n", "<leader>yt", function()
  vim.cmd("let @+ = expand('%:t')")
end)
map("n", "<leader>yd", function()
  vim.cmd("let @+ = expand('%:p:h')")
end)

map("n", "J", "<Nop>", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Delete around C-style blocks
map("n", "dac", "da{dd", { desc = "Delete around {} and current line" })

-- Yank around C-style blocks
map("n", "yac", "?{<Enter>V$%y", { desc = "Yank around C-style block {}" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<S-A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<S-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<S-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<S-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>x", "<leader>bd", { desc = "Delete buffer", remap = true })
map("n", "<leader>X", "<leader>bd!", { desc = "Delete buffer (force)", remap = true })

-- Diagnostic
map("n", "<leader>dd", "<cmd> lua vim.diagnostic.open_float() <CR>", { desc = "Open diagnostic" })
map("n", "<leader>dn", "<cmd> lua vim.diagnostic.goto_next() <CR>", { desc = "Next diagnostic" })
map("n", "<leader>dp", "<cmd> lua vim.diagnostic.goto_prev() <CR>", { desc = "Previous diagnostic" })

-- use zz to center screen after C-o or C-i
map("n", "<C-o>", "<C-o>zz", { silent = true, remap = true })
map("n", "<C-i>", "<C-i>zz", { silent = true, remap = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Editor
-- map({ "n" }, "cw", "ciw", { desc = "Change word", remap = true })
map("n", "C", "c$", { desc = "Change to end of line", remap = true })
map("n", "<leader>rn", function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
    vim.wo.number = false
  end
end, { desc = "Toggle relative line numbers" })
-- save file
map("n", "<leader>ww", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>wa", "<cmd>wa<cr>", { desc = "Save all files" })
map("n", "<leader>wf", "<cmd>wa!<cr>", { desc = "Save all files force" })

-- Highlight Yanked
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

-- Open url with gx
function open_url()
  local open_fn = function(uri)
    -- Use the appropriate command based on the operating system
    local opener = "xdg-open" -- Default for Linux
    if vim.fn.has("macunix") == 1 then
      opener = "open"       -- For macOS
    elseif vim.fn.has("win32") == 1 then
      opener = "start"      -- For Windows
    end
    -- Execute the command to open the URL
    os.execute(opener .. " " .. vim.fn.shellescape(uri))
  end

  -- Get the url text under the cursor
  local url = vim.fn.expand("<cfile>")
  -- Check if the word is a valid URL
  if url:match("^https?://") then
    open_fn(url)
    return
  end

  -- Get the non-whitespace word under the cursor
  local ticket = vim.fn.expand("<cWORD>")

  -- If matches a Linear ticket pattern then open with browser to linear
  if
    ticket:match("^(DEVEX)%-[%d]+")
    or ticket:match("^(COR)%-[%d]+")
    or ticket:match("^(DATA)%-[%d]+")
    or ticket:match("^(AII)%-[%d]+")
    or ticket:match("^(AND)%-[%d]+")
    or ticket:match("^(ARC)%-[%d]+")
    or ticket:match("^(SEC)%-[%d]+")
    or ticket:match("^(BUGS)%-[%d]+")
    or ticket:match("^(APP)%-[%d]+") then
    local linear_url = "linear://linear.app/issue/" .. ticket
    print("linear_url", linear_url)
    open_fn(linear_url)
    return
  end

  print("No valid URL under cursor")
end

-- Map gx to the open_url function
map("n", "gx", ":lua open_url()<CR>", { noremap = true, silent = true })

function open_in_github()
  local file = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local command = "gh browse --path " .. file .. "#L" .. line
  vim.cmd("!" .. command)
end

vim.api.nvim_create_user_command("OpenGitHub", open_in_github, {})
vim.api.nvim_set_keymap("n", "<leader>gh", ":OpenGitHub<CR>", { noremap = true, silent = true })


-- Ensure the file is reloaded when it changes
vim.api.nvim_create_augroup("AutoReload", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = "AutoReload",
  callback = function()
    if vim.bo.modifiable and not vim.bo.modified then
      vim.cmd("checktime")
    end
  end,
})

