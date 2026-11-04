# Lesson 14 · Bash Script 参考答案

> ⚠️ 先独立完成 `EXERCISES.md` 再看这里。答案以「命令 + 为什么」呈现，不替代你自己动手。

---

## ① 基础操作

**1. hello.sh**
```bash
cat > hello.sh <<'EOF'
#!/bin/bash
# 第一个脚本：输出问候
echo "Hello, sequencing center"
EOF
chmod +x hello.sh
./hello.sh
```
为什么：`chmod +x` 加执行权限后 `./hello.sh` 才能直接运行（否则 `Permission denied`）。shebang `#!/bin/bash` 告诉系统用 bash 执行。

**2. 变量**
```bash
PREFIX=gse65496_
THREADS=4
echo "前缀是 $PREFIX，线程 $THREADS"
```
为什么：等号两边**不能有空格**；双引号里 `$PREFIX` 会展开成值。

**3. 命令替换**
```bash
now=$(date +%H:%M)
echo "现在是 $now"
```
为什么：`$(date +%H:%M)` 把 `date` 的输出捕获成一个字符串，存进 `now`。

**4. read 输入**
```bash
read -p "输入样本 ID: " id
echo "你要处理的是 $id"
```
为什么：`read -p` 先打印提示再读入输入。

## ② 组合练习

**5. list_fastq.sh**
```bash
for f in fastq/*.fastq; do echo "$f"; done
```
为什么：`fastq/*.fastq` 是 glob，shell 展开成 3 个文件名，`for` 逐个取。

**6. read 数**
```bash
for f in fastq/*.fastq; do
  lines=$(wc -l < "$f")
  reads=$((lines / 4))
  echo "$f: $reads reads"
done
```
为什么：`wc -l < "$f"` 用重定向让 wc 只读内容、输出不带文件名；`$((...))` 做整数除法；FASTQ 每条 read 占 4 行。

**7. 样本检查**
```bash
while IFS= read -r id; do
  if [ -f "fastq/$id.fastq" ]; then echo "$id: OK"; else echo "$id: MISSING"; fi
done < samples.txt
```
为什么：`while read` 逐行读样本 ID；`[ -f ]` 判断对应 fastq 是否存在。SRR1004 无对应文件 → MISSING。

**8. source 配置**
```bash
source config.txt
echo "$PREFIX"
```
为什么：`source` 在当前 shell 执行 config.txt，其中的 `PREFIX=gse65496_` 等变量直接可用。

**9. 加前缀**
```bash
for f in fastq/*.fastq; do echo "$f → ${PREFIX}${f}"; done
```
为什么：`${PREFIX}${f}` 拼出「前缀 + 原路径」；花括号 `{}` 界定变量边界。

**10. ERROR 统计**
```bash
for f in logs/*.log; do echo "$f: $(grep -c ERROR "$f")"; done
```
为什么：`grep -c` 输出匹配行数，`$(...)` 把它嵌入到 echo 里。run1.log 有 2 处、run2.log 有 1 处。

## ③ 生信实战

**11. run_report.sh**
```bash
#!/bin/bash
OUT=report.txt
for f in fastq/*.fastq; do
  lines=$(wc -l < "$f")
  echo "$f: $((lines / 4)) reads" >> "$OUT"
done
```
为什么：`>>` 追加写入，循环 3 次得到 3 行报告。

**12. 加保护**
```bash
#!/bin/bash
set -euo pipefail
DIR="${1:-fastq}"
[ -d "$DIR" ] || { echo "目录 $DIR 不存在" >&2; exit 1; }
```
为什么：`set -e` 出错即停、`-u` 未定义变量报错、`-o pipefail` 管道失败算失败；`[ -d ]` 判断目录存在，否则报错并以非 0 退出。

**13. 缺失样本**
```bash
while IFS= read -r id; do
  if [ -f "fastq/$id.fastq" ]; then echo "$id: OK"; else echo "$id" >> missing.txt; fi
done < samples.txt
```
为什么：缺失的样本写进 `missing.txt`，最后 `cat missing.txt` 应只剩 `SRR1004`。

## ④ 排错挑战

**14. name = value 报错**
原因：等号两边有空格，shell 当成「执行命令 name」。修复：`name=value`（去掉空格）。

**15. Permission denied**
原因：`./` 运行需要执行权限。修复：`chmod +x script.sh`。

**16. while read 丢最后一行**
```bash
printf 'a\nb' > no_newline.txt   # 最后一行 b 没有换行符
while IFS= read -r line; do echo "[$line]"; done < no_newline.txt
# 只输出 [a]，丢了 [b]

while IFS= read -r line || [ -n "$line" ]; do echo "[$line]"; done < no_newline.txt
# 输出 [a] [b]，修复成功
```
原因：最后一行无换行符时，`read` 读到了内容却返回非 0，循环提前结束。`|| [ -n "$line" ]` 让「读到了内容」这一轮也算成功。

## ⑤ 综合任务

**17. run_qc.sh（生产级）**
```bash
#!/bin/bash
# run_qc.sh — 统计目录下所有 FASTQ 的 read 数，输出报告
set -euo pipefail

DIR="${1:-fastq}"              # 第一个参数是目录，默认 fastq
OUT="qc_report.txt"

[ -d "$DIR" ] || { echo "错误：目录 $DIR 不存在" >&2; exit 1; }

: > "$OUT"                     # 清空报告

for f in "$DIR"/*.fastq; do
  [ -f "$f" ] || { echo "跳过（不是文件）：$f" >&2; continue; }
  lines=$(wc -l < "$f")
  reads=$((lines / 4))
  echo "$f: $reads reads" >> "$OUT"
done

echo "报告已生成：$OUT（共 $(wc -l < "$OUT") 个文件）"
```
验证：
```bash
./run_qc.sh            # cat qc_report.txt 应有 3 行
./run_qc.sh not_exist  # 报错；echo $? 应为 1
```
为什么每个细节：
- `DIR="${1:-fastq}"`：有参数用参数，没参数用默认 `fastq`（换目录不改代码）。
- `[ -d "$DIR" ] || exit 1`：目录不存在直接报错退出，不产出半成品。
- `: > "$OUT"`：清空报告，避免上次残留。
- `[ -f "$f" ] || continue`：glob 若匹配到目录/无匹配时跳过，不让脚本崩溃。
