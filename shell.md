# 简介
## shell下命令的分类
Linux里shell下的命令也分很多种：
- shell里自带的一类，没有实质的二进制文件；
- alias的一类；
- 在$PATH里，具有二进制文件的一类；
- 自定义function一类；
- 自定义的shell脚本的是一类；
- ....

所以像sudo这类命令，后面跟着的命令，也是有规定条件需要是一个二进制文件或者是脚本文件，
但是不能是shell自带的command，如 cd，echo，之类的
