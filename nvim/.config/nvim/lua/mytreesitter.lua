require("nvim-treesitter.configs").setup({
	-- base
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ensure_installed = { "rust", "bash", "typescript", "tsx", "javascript", "lua", "python", "c", "cpp",
	-- "css", "bibtex", "gdscript", "glsl", "go", "haskell", "html", "java", "jsdoc", "json",
	-- "julia", "kotlin", "dockerfile", "latex", "make", "llvm", "nix", "scss", "svelte", "vim", "vue",
	-- "zig"
	-- },
	ensure_installed = {},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {"org"}, -- list of language that will be disabled
		additional_vim_regex_highlighting = {'org'},
	},
	ignore_install = { "phpdoc", "godot_resource" },
	incremental_selection = {
		enable = true,
		disable = { "dart" },
		keymaps = {
			init_selection = "gnn",
			node_incremental = "gna",
			scope_incremental = "gnc",
			node_decremental = "gnd",
		},
	},
	indent = {
		enable = true,
	},
	-- nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
	-- nvim treesitter textobjects
	textobjects = {
		select = {
			enable = true,
			disable = { "dart" },
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@block.outer",
				["ic"] = "@block.inner",
			},
		},
		move = {
			enable = true,
			disable = { "dart" },
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				-- ["]]"] = "@class.outer",
				["]b"] = "@block.outer",
			},
			goto_next_end = {
				-- ["]M"] = "@function.outer",
				-- ["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				-- ["[["] = "@class.outer",
				["[b"] = "@block.outer",
				["[["] = "@block.inner",
			},
			goto_previous_end = {
				-- ["[M"] = "@function.outer",
				-- ["[]"] = "@class.outer",
			},
		},
	},
	-- nvim ts rainbow
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
