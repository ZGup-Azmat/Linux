# Lesson 14 · Bash Script 配套练习

> 环境：Ubuntu Server 24.04 LTS
> 位置：先 `cd data/`，练习数据都在本目录下（samples.txt / config.txt / fastq/ / logs/）
> 规则：**独立完成后再看 ANSWER_KEY.md**。只用本课知识 + 前面学过的命令（grep / wc / 重定向 / xargs）。

---

## ① 基础操作（Level 1）

1. 写脚本 `hello.sh`：第一行 shebang + 注释 + 输出「Hello, sequencing center」，加执行权限后用 `./hello.sh` 运行。
   - 验收：`./hello.sh` 能直接运行，不报 `Permission denied`。

2. 定义变量 `PREFIX=gse65496_` 和 `THREADS=4`，用 `echo` 打印一行「前缀是 gse65496_，线程 4」。
   - 验收：输出正确展开两个变量的值。

3. 用命令替换把当前时间存进变量 `now`，打印「现在是 HH:MM」。
   - 验收：打印真实的当前时间。

4. 用 `read -p` 读入一个样本 ID，回显「你要处理的是 XX」。
   - 验收：输入 SRR1001 后正确回显。

## ② 组合练习（Level 2）

5. 写脚本 `list_fastq.sh`：用 `for` 循环列出 `fastq/` 下所有 `*.fastq` 文件名。
   - 验收：输出 3 个文件名（SRR1001 / SRR1002 / SRR1003）。

6. 在循环里用 `wc -l` 统计每个 fastq 的 read 数（行数 ÷ 4），打印「文件名: N reads」。
   - 验收：分别输出 2 / 3 / 1 reads。

7. 用 `if [ -f ]` 检查 `samples.txt` 里每个样本对应的 fastq 是否存在。
   - 验收：SRR1001~1003 输出 OK，SRR1004 输出 MISSING。

8. 用 `source config.txt` 载入变量，打印 `PREFIX`。
   - 验收：打印 `gse65496_`。

9. 用 `for` 循环 + 变量，打印每个 fastq「加前缀后的新名字」。
   - 验收：每个文件名前都加了 `gse65496_`。

10. 用 `for` 循环统计 `logs/` 下每个 `.log` 的 `ERROR` 数。
    - 验收：run1.log 输出 2，run2.log 输出 1。

## ③ 生信实战（Level 3）

11. 写完整脚本 `run_report.sh`：遍历 fastq 统计 read 数，结果**追加**进 `report.txt`。
    - 验收：`cat report.txt` 有 3 行统计结果。

12. 给脚本加 `set -euo pipefail` 和「目录不存在就报错退出」的保护。
    - 验收：传一个不存在的目录，脚本报错并以非 0 退出（`echo $?` 非 0）。

13. 遍历 `samples.txt`，缺失的样本写入 `missing.txt`，齐全的打印 OK。
    - 验收：`missing.txt` 里只有 `SRR1004`。

## ④ 排错挑战（Level 4）

14. 脚本写 `name = value`，运行报 `name: command not found`。找出原因并修复。
    - 验收：赋值成功后 `echo $name` 能打印 value。

15. `./script.sh` 报 `Permission denied`，但 `bash script.sh` 能跑。找出原因并修复。
    - 验收：`./script.sh` 能直接运行。

16. 用 `printf` 创建一个**最后一行没有换行符**的文件，再用 `while read` 读它，观察最后一行是否丢失，然后用 `|| [ -n "$line" ]` 修复。
    - 验收：修复后循环能处理到真正的最后一行。

## ⑤ 综合任务（Level 5）

17. 写一个生产级 `run_qc.sh`：
    - 接收目录参数（默认 `fastq`），目录不存在报错退出；
    - 遍历目录下所有 `*.fastq`，统计 read 数写入 `qc_report.txt`（先清空再写）；
    - 开头有 `set -euo pipefail` 和清晰注释。
    - 验收：`cat qc_report.txt` 有 3 行；`./run_qc.sh not_exist` 报错且 `echo $?` 非 0。

---

> ✅ 全部完成后，对照 `ANSWER_KEY.md`，并把 `run_qc.sh` + 报告 push 到 GitHub。
