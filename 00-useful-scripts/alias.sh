# find Kconfig files only one time
alias kconfig-list='find $PWD -name Kconfig -type f > ~/kconfig_abs_list.txt'
alias kconfig-grep='xargs grep -nH < ~/kconfig_abs_list.txt'
# default the cscope would do update the crosss-reference based on the updated files
# need ignore for linux code read, which built without driver directory
alias cs='cscope -d'
