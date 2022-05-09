require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "bash", "c", "c_sharp", "cmake", "css", "cpp", "fennel", "fish", "help",
      "http", "html", "java", "javascript", "json", "latex", "lua", "llvm",
      "make", "ninja", "perl", "php", "python", "regex", "scss",
      "svelte", "toml", "typescript", "vim", "vue", "yaml"
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    }
}
