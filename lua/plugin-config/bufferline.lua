local bline = require("bufferline")
bline.setup{
    options = {
        numbers = "ordinal",
        offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
    }
}
