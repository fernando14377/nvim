return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "http",
            "lua",
            "blade",
            "luadoc",
            "html",
            "css",
            "scss",
            "astro",
            "javascript",
            "typescript",
            "query",
            "php",
            "php_only",
            "tsx",
            "json",
            "vim",
            "vimdoc",
            "markdown",
            "c",
            "bash",
            "python",
            "sql",
            "arduino",
            "cpp",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                },
            },
        },
        selection_modes = {
            ["@function.outer"] = "V", -- linewise
            ["@function.inner"] = "V", -- linewise
            ["@conditional.outer"] = "V",
            ["@conditional.inner"] = "V",
            ["@loop.outer"] = "V",
            ["@loop.inner"] = "V",
            ["@block.outer"] = "V",
            ["@block.inner"] = "V",
        },
    },
    config = function(_, opts)
        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })

        require("nvim-treesitter.configs").setup(opts)
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }
    end,
}
