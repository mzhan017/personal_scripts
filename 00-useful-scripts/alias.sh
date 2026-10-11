# find Kconfig files only one time
alias kconfig-list='find $PWD -name Kconfig -type f > ~/kconfig_abs_list.txt'
alias kconfig-grep='xargs grep -nH < ~/kconfig_abs_list.txt'
