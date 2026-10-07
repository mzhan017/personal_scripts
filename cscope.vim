"This is personal vim configuration for cscope
" exmaple of cscope commands
"  1. cs add *.out, to add database files;
"  2. cs show , to show the connections
"  3. cs kill, to kill a connection
"  4. cs reset to reinit all connections
"  5. cs help, get help page

" Could add following contents in ~/.vimrc file

" To check if the cscope is in build
"   mark@wxy:/curl$ vim --version | grep cscope
"   +cscope            +localmap          -ruby              +wildignore

" if cscope.out in current directory
if filereadable("cscope.out")
    cs add cscope.out
endif

set nocompatible        " for WSL
" As the space's function is duplicate with ghj, then make it as leader
nnoremap <SPACE> <Nop>  " make space to nop
let mapleader = " "
" timeout for 1000 ms
set timeoutlen=1000

nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR> " 

" first click space, and then click g, not at the same time
nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR> " calling function
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR> " called function
nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" ctrl+t: go back
" ctrl+]: go to the definition

" cscope has no native command to dump call stack
" find . -type f \( -name "*.c" -o -name "*.h" \) \
" ! -path "./build/*" \
" ! -path "./.git/*" \
" ! -path "./out/*" \
" ! -path "./tmp/*" > cscope.files
" cscope -bqk -i cscope.files
" cscope will load all files in memory to generate the cscope.out
" So need patient to wait ....
