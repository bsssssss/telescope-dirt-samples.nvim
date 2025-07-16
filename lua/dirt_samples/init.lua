local dirt_samples = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local source_path = vim.fn.expand("~/livecoding/supercollider/superdirt-setup/tmp/sounds.txt")
local sample_names = vim.fn.readfile(source_path)

local names = function (opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Dirt Samples",
        finder = finders.new_table {
            results = sample_names,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({ selection[1] }, "", false, true)
            end)
            return true
        end,
    }):find()
end

names(require("telescope.themes").get_ivy({}))

-- return dirt_samples
