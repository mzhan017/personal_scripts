"This is personal vim configuration for cscope

" To check if the cscope is in build
"   mark@wxy:/curl$ vim --version | grep cscope
"   +cscope            +localmap          -ruby              +wildignore

" if cscope.out in current directory
if filereadable("cscope.out")
    cs add cscope.out
endif

set nocompatible        " for WSL
nnoremap <SPACE> <Nop>  " make space to nop
let mapleader = " "
" timeout for 1000 ms
set timeoutlen=1000

nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR> " calling function
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR> " called function
nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" ctrl+t: go back
" ctrl+]: go to the definition