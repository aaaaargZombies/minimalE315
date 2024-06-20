local cause_error = function()
	vim.api.nvim_buf_set_text(0, 2, 2, 8, 8, { "test", "test", "test", "test", "test", "test" })
end

vim.api.nvim_create_user_command("BORK", cause_error, { range = true })
