local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local config = {}

---@param opts? {source_path?: string}
M.setup = function(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

M.names = function(opts)
	local sample_names = vim.fn.readfile(config.source_path)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Dirt Samples",
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
