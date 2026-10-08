# xargs examples
## cut related
### git checkout modified files
```
git status | grep modified| cut -d ":" -f 2 | xargs git checkout
```

