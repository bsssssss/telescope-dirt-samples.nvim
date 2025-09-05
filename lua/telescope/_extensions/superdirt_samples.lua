return require("telescope").register_extension {
    setup = function (ext_config, config) end,
    exports = {
        superdirt_samples = require("superdirt").samples,
    }
}
