local cause_error = function()
	vim.api.nvim_buf_set_text(
		0,
		10,
		5,
		14,
		10,
		{ "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", "test" }
	)
end

vim.api.nvim_create_user_command("BORK", cause_error, { range = true })
