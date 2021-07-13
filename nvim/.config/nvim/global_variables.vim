" vim airline config
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
" let g:airline_theme='lucius'
let g:airline_section_a = 0
let g:airline_section_x = 0
let g:airline_section_y = 0
let g:airline_section_z = 0
let g:airline_section_error = 0
let g:airline_section_warning = 0
" turn off and disable matching parenthesis
let g:loaded_matchparen = 1
" dart / flutter plugin settings 
let g:dart_format_on_save = 1
" line indentation guide style
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '¦'
" rainbow brackets options 
" let g:rainbow_active = 1
"let g:AutoPairsShortcutToggle = '<C-j>'
let g:tex_flavor = 'latex'
" vim table mode
"let g:table_mode_corner='+'
"let g:table_mode_corner_corner='+'
" netrw
let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
" fff file manager
let g:fff#split = "20new"
let g:fff#split_direction = "nosplitright splitbelow"
let g:NERDDefaultAlign='left'
" multiple cursors mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<leader><C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:wordmotion_nomap = 1
" lsp completion
"let g:completion_confirm_key = "<CR>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_signature = 0

" nvim compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.ultisnips = v:false
let g:compe.source.luasnip = v:false
let g:compe.source.emoji = v:false
