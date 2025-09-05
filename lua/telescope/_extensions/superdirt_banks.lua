return require("telescope").register_extension {
    setup = function (ext_config, config) end,
    exports = {
        superdirt_banks = require("superdirt").banks
    }
}
