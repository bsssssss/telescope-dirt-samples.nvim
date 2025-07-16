local dirt_samples = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local config = {
	source_path = vim.fn.expand("~/livecoding/supercollider/superdirt-setup/tmp/sounds.txt"),
}

---@param opts? {source_path?: string}
dirt_samples.setup = function(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

dirt_samples.names = function(opts)
	opts = opts or {}
	local sample_names = vim.fn.readfile(config.source_path)
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

return dirt_samples
