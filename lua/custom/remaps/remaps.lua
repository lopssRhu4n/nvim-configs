vim.opt.nu = true
vim.opt.relativenumber = true
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>ga", ":Gwrite<CR>");
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
vim.keymap.set("n", "<leader>gu", ":Git unstage<CR>")
vim.keymap.set("n", "<leader>y", ":NeoTreeShow<CR>")
vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = false, filter = function(client) return client.name ~= \"tsserver\" end})<CR>")


vim.api.nvim_create_user_command("NullLsInfo", function()
        require("null-ls.info").show_window()
    end, {})
