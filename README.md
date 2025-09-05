# telescope-superdirt

[Telescope](https://github.com/nvim-telescope/telescope.nvim) extension to browse samples loaded by SuperDirt.

## Installation and Configuration

Add this to the `dependencies` list of telescope.

```lua
{
  "bsssssss/telescope-superdirt.nvim",
  config = function()
    require("dirt_samples").setup({
      source_path = "path/to/file",
    })
  end,
},
```

Activate the Telescope command and the extension:

```lua
pcall(require("telescope").load_extension, "dirt_samples")
```

Restart Neovim.

## Usage

The extension parses the file defined in `source_path` and puts each line in the
finder.

Call `:Telescope dirt_samples` to browse the samples and insert the name at cursor position.

No keymaps are defined by default.

## Generate the list

This is a little supercollider script to generate a file containing the names of
samples loaded by SuperDirt. Call this after loading all your samples !

```supercollider
(
var names = ~dirt.buffers.keys.asArray.sort;
var file_path = PathName.new(thisProcess.nowExecutingPath).parentPath +/+ "tmp/sounds.txt";

File.use(file_path.standardizePath, "w", { |f|
	names.do { |name|
		f.write(format("%\n", name));
	}
})
)
```
