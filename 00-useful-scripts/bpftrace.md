# 简介
bpf功能简单就简单在易用；
但是部署比较麻烦，因为依赖的包实在是太多了。
## 示例
工作中常用到的一些示例
### 打印打开某个文件的pid
迭代往上推
```
$ cat notify.bpf
#!/usr/bin/env bpftrace

#define TARGET "/etc/passwd"
#define MAX_DEPTH 64
#include <fcntl.h>

tracepoint:syscalls:sys_enter_openat
/str(args.filename) == TARGET && (args.flags & (O_WRONLY|O_RDWR|O_APPEND))/
{
	printf("\n[openat write] pid=%d comm=%s file=%s\n", pid, comm, str(args.filename));

	$t = curtask;
	for ($i : 0..MAX_DEPTH) {
		printf("  [%d] tgid=%d pid=%d comm=%s\n",
			$i, $t->tgid, $t->pid, $t->comm);
		if ($t->pid == 1) {
			break;
		}
		$t = $t->real_parent;
	}
}
```
展示结果
```
$ bpftrace notify.bpf
notify.bpf:8:31-33: WARNING: Addrspace mismatch
/str(args.filename) == TARGET && (args.flags & (O_WRONLY|O_RDWR|O_APPEND))/
Attached 1 probe

[openat write] pid=1781263 comm=adduser file=/etc/passwd
  [0] tgid=1781263 pid=1781263 comm=adduser
  [1] tgid=1781211 pid=1781211 comm=bash
  [2] tgid=1781210 pid=1781210 comm=sshd
  [3] tgid=1781206 pid=1781206 comm=sshd
  [4] tgid=795 pid=795 comm=sshd
  [5] tgid=1 pid=1 comm=systemd
```
