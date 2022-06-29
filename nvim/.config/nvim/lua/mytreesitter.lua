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
			-- node_incremental = "(",
			scope_incremental = "gnc",
			-- node_decremental = ")",
		},
	},
	indent = {
		enable = true,
	},
	-- nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
	-- nvim-treesitter-pairs
	pairs = {
		enable = true,
		highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
		highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
		goto_right_end = false, -- whether to go to the end of the right partner or the beginning
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
		keymaps = {
			goto_partner = "%",
		},
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
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			disable = { "dart" },
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
				["]b"] = "@block.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
				["[b"] = "@block.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
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
