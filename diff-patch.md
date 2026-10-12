# diff
## diff as patch
```
diff -Naur openssl-1.1.1d/Configurations/unix-Makefile.tmpl.orig openssl-1.1.1d/Configurations/unix-Makefile.tmpl >> openssl-1.1.1d.patch
```

## diff directory
```
diff -r linux-4.18.0-348.20.1.el8_5/net linux-4.18.0-372.9.1.el8/net > /root/diff
对比目录
```

# patch
## patch
```
patch -pnum <patchfile 、、、 经常用的是这种格式
```

## revert
```
patch -p1 -R < diff
将之前的diff文件revert回去。
```
