require('settings')
require('mappings')
require('nightfox').setup({
   options = {
     transparent = false,
  }
 })
vim.cmd("colorscheme nightfox")
require('plugin-config.plugins')
 require('plugin-config.cmp')
require('lsp')
 require('lualine').setup()
require('snippets.snips')
vim.cmd("source $VIMRUNTIME/mswin.vim") 
require('coderun')
