require('telescope').setup {
	defaults = {
		layout_strategy = 'center',
		sorting_strategy = 'ascending',
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}
require('telescope').load_extension('fzf')
