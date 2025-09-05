local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local config = {}

---@param opts? {source_dir?: string}
M.setup = function(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

M.samples = function(opts)
	local sample_names = vim.fn.readfile(config.source_dir .. "/sounds.txt")
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "SuperDirt Samples",
			finder = finders.new_table({
				results = sample_names,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.api.nvim_put({ selection[1] }, "", false, true)
				end)
				return true
			end,
		})
		:find()
end

M.banks = function(opts)
	local sample_names = vim.fn.readfile(config.source_dir .. "/banks.txt")
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "SuperDirt Banks",
			finder = finders.new_table({
				results = sample_names,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.api.nvim_put({ selection[1] }, "", false, true)
				end)
				return true
			end,
		})
		:find()
end

return M
