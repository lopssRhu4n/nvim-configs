return {

	'jose-elias-alvarez/null-ls.nvim',
	lazy = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				formatting.prettierd,
				formatting.prettier,
				formatting.stylua,
				formatting.phpcsfixer
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end
}
