# 术语解释
## vimrc
rc的意思是run command，就是在vim启动的时候自动加载执行的command

# 常用变量
## mapleader
let mapleader = " "
这在用的时候，leader才是真正的变量
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
# 常用命令
## 0，“
双引号是注释前缀
## 1，f/F 命令
在命令行按f然后加一个字符，就是搜索一个字符，点分号是下一个相同的字符，点逗号是上一个；
在命令行按F是和上面一条想法的顺序
## 2，空格
前移/右移
这个功能和h/g/....等功能重复，可以改成其他的功能
nnoremap <SPACE> <Nop> " 把普通模式下空格原来的“右移”功能关掉！WSL关键一行

# 命令行命令
## syntax
**`$VIMRUNTIME/syntax/c.vim`**，这就是 C 语言语法规则本体Vim
/usr/share/vim/vim82/syntax
也不知道这个vim的default的关于C语言的这种语法是怎么设置的，一开屏，就是满屏的蓝，关键是黑背景。导致根本看不清注释。
syntax off把这个语法高亮的功能去掉就好了。

下面这个可以写到~/.vimrc里，将注释从原来的蓝变成绿，在黑背景下更显眼
" 修改C注释颜色
hi cComment ctermfg=green guifg=#88aa88
" 新增自定义关键字高亮
syntax keyword cType uint64_t size_t