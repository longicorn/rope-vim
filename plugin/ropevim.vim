" do not load if python is not available
if exists("g:loaded_rope")
	finish " only load once
endif

if has("python")

function! s:Is_Import()
	let s:is_import = 0
python << EOF
try:
	import ropevim
	vim.command("let s:is_import = 1")
except:
	pass
EOF
endfunction


function! s:LoadRope()
	call s:Is_Import()
	if s:is_import == 1
python << EOF
import ropevim
EOF
		let ropevim_codeassist_maxfixes=10
		let ropevim_vim_completion=1
		let ropevim_guess_project=1
		let ropevim_enable_autoimport=1
		let ropevim_enable_shortcuts=1
		let ropevim_extended_complete=1

		let g:loaded_rope = 1
	endif
endfunction

call s:LoadRope()

endif
