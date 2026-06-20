return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
    require'nvim-treesitter'.install { 
        'python', 'c', 'lua',  
        'dockerfile', 
        'html',
        'css',
        'cpp',
        'bash',
    }
  end,
}

