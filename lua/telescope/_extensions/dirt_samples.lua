return require("telescope").register_extension {
    setup = function (ext_config, config) end,
    exports = {
        dirt_samples = require("dirt_samples").names
    }
}
