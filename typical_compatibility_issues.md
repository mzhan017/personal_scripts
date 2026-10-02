# Overview
## 1, Linux vs Windows
### a, newline
One Linux content, after "mkdocs serve", ending with ^M
https://github.com/mkdocs/mkdocs/issues/4220

One workaround:
find site -type f -exec sed -i 's/\r$//' {} \;