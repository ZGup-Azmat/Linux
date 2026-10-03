# GLOSSARY.md — 术语表

> 双语定义。新术语只追加，不重复。按字母/拼音顺序。

## Lesson 01 · Filesystem

**filesystem**
文件系统。操作系统组织文件和目录的方式；Linux 用一棵以 `/` 为根的树。
The way an operating system organizes files and directories; in Linux a single tree rooted at `/`.

**root directory**
根目录 `/`。Linux 文件系统树的起点，所有路径都从它开始。
The top-level directory `/`; the starting point of the Linux filesystem tree.

**home directory**
家目录 `/home/<username>`。用户登录后的默认工作目录，通常缩写为 `~`。
The default directory a user lands in after login, usually `/home/<username>`, abbreviated `~`.

**path**
路径。指向文件或目录位置的字符串，分绝对路径和相对路径。
A string that points to a file or directory location; absolute or relative.

**absolute path**
绝对路径。从根目录 `/` 开始的完整路径，例如 `/home/azmat/data`。
A full path starting from root `/`, e.g. `/home/azmat/data`.

**relative path**
相对路径。从当前目录开始的路径，用 `.`（当前）和 `..`（上一级）表示。
A path relative to the current directory, using `.` (here) and `..` (up).

**pwd**
打印当前工作目录（print working directory）。
Print the current working directory.

**ls**
列出目录内容（list）。常用 `-l`（长格式）、`-a`（含隐藏文件）、`-h`（人类可读大小）。
List directory contents; `-l` long format, `-a` include hidden, `-h` human-readable sizes.

**cd**
切换目录（change directory）。
Change the current directory.

**mkdir**
创建目录（make directory）。`-p` 递归创建多级目录。
Create a directory; `-p` creates parent directories as needed.

**touch**
创建空文件，或更新文件的修改时间。
Create an empty file, or update a file's modification time.

**rm**
删除文件或目录（remove）。`-r` 递归删除目录，`-f` 强制。删除后不可恢复。
Remove files or directories; `-r` recursive, `-f` force. Not reversible.

**rmdir**
删除空目录（remove directory）。只能删除空目录。
Remove an empty directory only.

**cp**
复制文件或目录（copy）。`-r` 递归复制目录。
Copy files or directories; `-r` recursive for directories.

**mv**
移动或重命名文件/目录（move）。
Move or rename files and directories.

**file**
显示文件的类型。
Show the type of a file.

**FHS**
文件系统层级标准（Filesystem Hierarchy Standard）。定义 `/home`、`/etc`、`/var`、`/usr` 等标准目录用途。
Filesystem Hierarchy Standard; defines the purpose of `/home`, `/etc`, `/var`, `/usr`, etc.

## Lesson 03 · Permissions

**permission**
权限。Linux 对文件/目录的访问控制，分读、写、执行三种，作用在属主/属组/其他人三类访问者上。
Access control on files/directories: read, write, execute, applied to owner/group/others.

**owner / 属主**
文件或目录的创建者，通常是唯一能改其权限的人（root 除外）。
The file's owner; normally the only one (besides root) who can change its permissions.

**group / 属组**
文件所属的组；同组成员按「组权限」访问。
The file's group; members of that group access it with group permissions.

**others / 其他人**
除属主和属组之外的其余所有用户。
Everyone except the owner and group.

**read (r) / 读**
查看文件内容；对目录则是列出其中的文件名。
View file contents; for a directory, list the filenames inside.

**write (w) / 写**
修改文件内容；对目录则是新建/删除/重命名其中的文件。
Modify file contents; for a directory, create/delete/rename files inside.

**execute (x) / 执行**
运行文件；对目录则是进入（cd）并访问其中的文件。
Run a file; for a directory, enter it (cd) and access files inside.

**chmod**
修改文件/目录权限（change mode）。支持符号模式（u/g/o/a + +/-/= + r/w/x）和八进制模式（4/2/1）。
Change permissions; symbolic (u/g/o/a + +/-/= + r/w/x) or octal (4/2/1).

**chown**
修改属主（change owner），可同时改属组：`chown user:group file`。通常需 sudo。
Change the owner, optionally the group too: `chown user:group file`. Usually needs sudo.

**chgrp**
只修改属组（change group）。
Change only the group.

**octal mode / 八进制模式**
用 0–7 表示一组 rwx 权限：r=4、w=2、x=1，故 rwx=7。例：755、644、600、1777。
Representing rwx as a digit 0–7 (r=4, w=2, x=1); e.g. 755, 644, 600, 1777.

**symbolic mode / 符号模式**
用 u/g/o/a + +/-/= + r/w/x 表达权限变更，如 `chmod u+x`。
Expressing permission changes with u/g/o/a + +/-/= + r/w/x, e.g. `chmod u+x`.

**sticky bit**
特殊权限位（八进制前缀 1）。设于目录后，只有文件属主能删除自己的文件（`/tmp` 即 1777）。
Special bit (octal prefix 1); on a directory, only a file's owner can delete it (e.g. `/tmp` = 1777).

**umask**
新建文件/目录时被自动「屏蔽」掉的权限。默认 022 → 文件 644、目录 755。
Permissions masked off by default at creation; 022 yields files 644 and directories 755.

## Lesson 04 · User & Group

**user account / 用户账号**
能登录系统的一个身份；内核用数字 UID 识别，用户名给人看。信息存在 `/etc/passwd`。
A login identity; the kernel keys on numeric UID, the username is for humans. Stored in `/etc/passwd`.

**UID**
用户 ID。root 是 0；普通用户从 1000 起（1–999 为系统账号）。
User ID. root is 0; regular users start at 1000 (1–999 are system accounts).

**GID**
组 ID。用户主组的数字标识。
Group ID; the numeric identity of a user's primary group.

**primary group / 主组**
用户唯一的主组，新建文件默认属组。
The user's single primary group; new files default to this group.

**supplementary group / 附加组**
用户额外加入的组，用于批量授权；一个用户可有多个。
Extra groups a user joins for bulk permissions; a user may have several.

**whoami**
打印当前用户名。
Print the current username.

**id**
打印当前用户的 UID、GID 和所属组。
Print the current user's UID, GID, and groups.

**who / w**
列出当前登录的用户（w 还显示他们正在运行的命令）。
List currently logged-in users (w also shows their running commands).

**getent**
查询系统数据库（passwd/group 等）条目。
Query system databases (passwd, group, etc.).

**useradd**
创建用户账号。`-m` 建家目录，`-s` 指定 shell。需 root。
Create a user account; `-m` makes a home dir, `-s` sets the shell. Needs root.

**usermod**
修改用户。`-aG group` 追加附加组（`-a` 必加，否则覆盖）。
Modify a user; `-aG group` appends a supplementary group (`-a` required, else overwrite).

**passwd**
设置/修改用户密码；`-l` 锁账号、`-u` 解锁。
Set/change a user's password; `-l` locks, `-u` unlocks.

**groupadd**
创建组。需 root。
Create a group. Needs root.

**userdel**
删除用户；`-r` 连同家目录一起删。需 root。
Delete a user; `-r` also removes the home dir. Needs root.

**sudo**
以 root（或其他用户）权限执行单条命令。Ubuntu 用 `sudo` 组管理提权。
Run a single command as root (or another user). Ubuntu controls it via the `sudo` group.

**login shell / 登录 shell**
用户登录后启动的 shell，通常 `/bin/bash`。写在 `/etc/passwd` 最后一个字段。
The shell launched at login, usually `/bin/bash`; the last field of `/etc/passwd`.

## Lesson 05 · Vim & tmux

**vim / vi**
终端文本编辑器。模式化设计：同一按键在不同模式下行为不同。
A terminal text editor; modal — the same key acts differently per mode.

**Normal mode / 普通模式**
Vim 默认模式，用于移动、删除、复制。按 `Esc` 从其他模式返回。
Vim's default mode for moving/deleting/copying; press `Esc` to return to it.

**Insert mode / 插入模式**
Vim 里真正打字的状态，按 `i` 进入。
The state in Vim where you actually type; enter with `i`.

**Command-line mode / 命令行模式**
Vim 里以 `:` 开头的模式，用于保存、退出、查找、替换（如 `:wq`、`:%s/old/new/g`）。
Vim's `:`-prefixed mode for save/quit/search/replace (e.g. `:wq`, `:%s/old/new/g`).

**tmux**
终端复用器：一个终端开多个窗口/窗格，会话可脱离后接回，断线任务不死。
A terminal multiplexer: many windows/panes in one terminal; sessions detach/reattach, tasks survive disconnects.

**session / 会话（tmux）**
tmux 的顶层容器，脱离（detach）后仍存活，可重新接回（attach）。
tmux's top-level container; survives detach and can be reattached.

**window / 窗口（tmux）**
tmux 会话中的一个「标签页」，用 `Ctrl-b c` 新建。
A "tab" inside a tmux session; create with `Ctrl-b c`.

**pane / 窗格（tmux）**
tmux 窗口里的分屏区域，`Ctrl-b %` 左右分、`Ctrl-b "` 上下分。
A split region in a tmux window; `Ctrl-b %` vertical, `Ctrl-b "` horizontal.

**detach / attach（tmux）**
脱离（`Ctrl-b d`）让会话后台继续跑；接回（`tmux attach`）重新连接。
Detach (`Ctrl-b d`) keeps the session running in background; attach reconnects to it.

**prefix key / 前缀键**
tmux 命令的前置按键，默认 `Ctrl-b`，先按它再按功能键。
The key prefix for tmux commands, default `Ctrl-b`; press it before the command key.

## Lesson 05.5 · tmux 精通

**copy-mode / 回滚复制模式**
tmux 里翻看历史输出、复制文字的模式。`Ctrl-b [` 进入，`q` 退出，`Ctrl-b ]` 粘贴。
tmux's mode for scrolling back history and copying text; enter with `Ctrl-b [`, quit with `q`, paste with `Ctrl-b ]`.

**zoom / 窗格缩放**
`Ctrl-b z` 把当前窗格临时放大到全屏，再按一次还原，不破坏分屏布局。
`Ctrl-b z` temporarily full-screens the current pane; press again to restore.

**layout / 布局**
tmux 窗格的排列方式，`Ctrl-b space` 循环切换。
The arrangement of tmux panes; cycle with `Ctrl-b space`.

**~/.tmux.conf**
tmux 的个人配置文件，位于用户家目录，改键位/开鼠标/设历史都写这里。改完 `tmux source ~/.tmux.conf` 生效，无需 root。
tmux's per-user config file in the home dir; holds keybindings/mouse/history. Reload with `tmux source ~/.tmux.conf`, no root needed.

**mouse mode / 鼠标模式**
tmux 配置项 `set -g mouse on`，开启后鼠标滚轮可回滚历史、点击可切换窗格。
`set -g mouse on`; enables scrollback and click-to-switch-pane with the mouse.

## Lesson 06 · Find

**find**
递归遍历目录树、按条件过滤文件、对结果执行动作的查找工具。结构：`find 路径 条件 动作`。
Recursively walk a directory tree, filter files by tests, apply actions to matches: `find path test action`.

**-name / -iname**
按文件名匹配；`-name` 区分大小写、`-iname` 不区分。模式要用引号，防 shell 提前展开通配符。
Match by filename; `-name` is case-sensitive, `-iname` is not. Quote the pattern to prevent shell expansion.

**-type**
按类型过滤：`f` 文件、`d` 目录、`l` 软链接。
Filter by type: `f` file, `d` directory, `l` symlink.

**-size**
按大小过滤：`+2G` 大于 2GB、`-100k` 小于 100KB。等号是近似区间（按 512 字节块取整）。
Filter by size: `+2G` larger, `-100k` smaller; exact form is an approximate range (rounded to 512-byte blocks).

**-mtime**
按修改时间（天）过滤：`+30` 30 天前、`-7` 近 7 天。
Filter by modification time in days: `+30` older than 30 days, `-7` within 7 days.

**-exec**
对每个匹配文件执行命令，`{}` 是文件占位符，结尾用 `\;` 或 `+`。如 `-exec chmod +x {} \;`。
Run a command on each match; `{}` is the placeholder, terminated by `\;` or `+`.

**-delete**
直接删除匹配到的文件。危险，应先 `-ls` 验证。
Delete matching files directly; dangerous — verify with `-ls` first.

**stderr / 2>/dev/null**
标准错误流。`2>/dev/null` 把错误输出丢弃，用于屏蔽 find 遍历时的 Permission denied 报错。
The standard error stream; `2>/dev/null` discards it, silencing find's Permission denied messages.

## Lesson 07 · Grep

**grep**
在文件内容里按模式匹配并打印匹配行。全称 global regular expression print。
Search inside file contents and print matching lines; short for "global regular expression print".

**regular expression (regex) / 正则表达式**
用符号灵活匹配文本的模式语言：`.` 任意字符、`^` 行首、`$` 行尾、`[0-9]` 字符类、`|` 或。
A pattern language for flexible text matching: `.` any char, `^` start, `$` end, `[0-9]` class, `|` or.

**anchor / 锚点**
正则里定位位置的符号：`^` 锚定行首，`$` 锚定行尾。
Regex symbols that pin a position: `^` anchors start of line, `$` anchors end of line.

**-i（grep）**
忽略大小写匹配。
Ignore case when matching.

**-n（grep）**
在每行匹配结果前显示行号。
Show the line number before each match.

**-v（grep）**
反选，打印不含模式的行。
Invert match; print lines that do NOT contain the pattern.

**-r（grep）**
递归搜索目录及所有子目录。
Search a directory and all its subdirectories recursively.

**-c（grep）**
统计每个文件匹配的行数（注意是行数，不是出现次数）。
Count matching lines per file (lines, not occurrences).

**-l（grep）**
只列出含匹配的文件名，不输出内容。
List only filenames that contain a match, without the content.

**-o（grep）**
只输出匹配的那部分文字，配合 `wc -l` 可统计总出现次数。
Print only the matched part; with `wc -l` it counts total occurrences.

**-E（grep）**
启用扩展正则（extended regex），让 `|`、`+` 等符号生效。
Enable extended regex so symbols like `|` and `+` work.

## Lesson 08 · Compression

**gzip**
把单个文件压缩成 `.gz`（默认删除原文件）。`-k` 保留原文件、`-d` 解压。
Compress a single file into `.gz` (removes the original by default); `-k` keeps it, `-d` decompresses.

**gunzip**
解压 `.gz` 文件，还原原文件（等价 `gzip -d`）。
Decompress a `.gz` file back to the original (same as `gzip -d`).

**zcat / zgrep / zless**
不解压直接读/搜/浏览 `.gz` 文件（`zcat f.gz | head`、`zgrep pat f.gz`）。
Read/search/browse a `.gz` file without decompressing it first.

**tar**
把多个文件/目录打包成一个归档（tape archive）。只打包不压缩，`-z` 才加 gzip 压缩。
Bundle many files/directories into one archive (tape archive); only packs, `-z` adds gzip.

**tarball / .tar.gz**
tar 打包 + gzip 压缩得到的归档文件，是 Linux 分发/备份的标准格式。
An archive produced by tar + gzip; the standard Linux format for distribution/backup.

**bzip2 / bunzip2**
压缩率比 gzip 更高的压缩工具（`.bz2`），速度更慢。`-j` 用于 tar。
A compressor (`.bz2`) with a better ratio than gzip but slower; use `-j` with tar.

**xz / unxz**
压缩率最高（`.xz`）但最慢、内存占用高的压缩工具。`-J` 用于 tar。
The highest-ratio compressor (`.xz`) but slowest; use `-J` with tar.

**zip / unzip**
跨平台压缩工具（`.zip`），常用于和 Windows 交换。Ubuntu 需 `sudo apt install zip unzip` 预装。
Cross-platform compressor (`.zip`), used to exchange with Windows; needs `sudo apt install zip unzip` on Ubuntu.

**compression ratio / 压缩率**
压缩后与压缩前的大小比。FASTQ 纯文本用 gzip 通常能压掉 60–75%。
The size ratio after vs before compression; plain-text FASTQ typically shrinks 60–75% with gzip.
