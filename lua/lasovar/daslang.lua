vim.filetype.add({ extension = { das = 'daslang' } })

require('nvim-treesitter.parsers').get_parser_configs().daslang = {
  install_info = {
    url = 'https://github.com/GaijinEntertainment/tree-sitter-daslang',
    files = { 'src/parser.c', 'src/scanner.c' },
    branch = 'main',
  },
  filetype = 'daslang',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'daslang',
  callback = function(args)
    vim.bo[args.buf].commentstring = '// %s'
    vim.treesitter.start(args.buf)
  end,
})

