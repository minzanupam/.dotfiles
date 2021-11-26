local function binary_mode_open()
	vim.cmd("set binary")
	vim.cmd([[
		" vim -b : edit binary using xxd-format!
		augroup Binary
		  au!
		  au BufReadPre  * let &bin=1
		  au BufReadPost * if &bin | %!xxd
		  au BufReadPost * set ft=xxd | endif
		  au BufWritePre * if &bin | %!xxd -r
		  au BufWritePre * endif
		  au BufWritePost * if &bin | %!xxd
		  au BufWritePost * set nomod | endif
		augroup END
	]])
end

local function binary_mode_close()
	vim.cmd("set nobinary")
	vim.cmd([[
		augroup Binary
			au!
		augroup END
	]])
end


return {
	binary_mode_open = binary_mode_open,
	binary_mode_close = binary_mode_close,
}
