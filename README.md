# telescope-dirt-samples.nvim

Telescope extension to fuzzy-find samples loaded by SuperDirt

## Requirements

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- A file containing the samples list.

## Installation and Configuration

Using lazy.nvim

```lua
{
  "bsssssss/telescope-dirt-samples.nvim",
  config = function()
    require("dirt_samples").setup({
      source_path = "path/to/samples_list",
    })
  end,
},
```

## Generate a list from loaded samples in SuperDirt

See below for a little supercollider script to generate the list from buffers
loaded by Superdirt.

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
