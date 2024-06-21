print("trying to cause E315")
-- print(getcwd()) -- need to get current path do I the test files can be accessed wherever
--
local function get_script_directory()
	-- Get the source path of the calling function
	local source = debug.getinfo(2, "S").source
	-- Remove the "@" prefix if present
	print(source)
	if source:sub(1, 1) == "@" then
		source = source:sub(2)
	end
	-- Get the directory part of the path
	local script_dir = source:match("(.*/)")
	return script_dir or "./"
end

-- Example usage:
local script_dir = get_script_directory()

vim.cmd("edit " .. script_dir .. "test.txt")
vim.cmd("edit " .. script_dir .. "test2.txt")

local buff_test
local buff_test2

for i, val in pairs(vim.api.nvim_list_bufs()) do
	if string.find(vim.api.nvim_buf_get_name(val), "test%.txt") then
		buff_test = val
	end
	if string.find(vim.api.nvim_buf_get_name(val), "test2.txt") then
		buff_test2 = val
	end
end

local cause_error = function()
	print(buff_test)
	print(type(buff_test))
	-- local lines = vim.api.nvim_buf_get_text(buff_test, 8, 2, 12, 18, {})
	local lines = vim.api.nvim_buf_get_lines(buff_test, 0, -1, false)

	vim.api.nvim_buf_set_text(buff_test2, 8, 2, 12, 18, lines)
end

vim.api.nvim_create_user_command("BORK", cause_error, { range = true })
