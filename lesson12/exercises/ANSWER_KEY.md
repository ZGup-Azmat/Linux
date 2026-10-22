# Lesson 12 · sed 练习答案

> ⚠️ 先独立完成 `EXERCISES.md` 再翻这里。
> 所有命令在 `../data/` 目录下执行（先 `cd ../data/`）。
> 命令基于 GNU sed（Ubuntu 24.04）。

---

## 一、基础操作

### 练习 1 · 删除注释行
```bash
sed '/^#/d' variants.vcf
```
**解释**：`/^#/` 是地址（匹配 # 开头的行），`d` 删除。预期输出恰好 5 行变异记录。

### 练习 2 · 去掉前缀
```bash
sed 's/Sample_//g' samples.txt
```
**解释**：`s/Sample_//g` 把 `Sample_` 替换为空（删除）。加 `g` 保险（本数据每行一个，但不加 g 也不影响）。

### 练习 3 · 按模式打印
```bash
sed -n '/ERROR/p' run.log
```
**解释**：`-n` 抑制默认输出，`/ERROR/p` 只打印含 ERROR 的行。预期 2 行。

### 练习 4 · 替换异常值
```bash
sed 's/NA/NotAvailable/' expression.tsv
```
**解释**：把 `NA` 替换成 `NotAvailable`。注意本数据里 `NA` 单独成列，不会误伤其他词。

---

## 二、组合练习

### 练习 5 · 一条命令做两件事
```bash
sed -e '/^#/d' -e 's/^chr//' variants.vcf
```
**解释**：`-e` 连接两条规则——先删注释行，再去行首的 `chr` 前缀。

### 练习 6 · sed 进管道
```bash
sed -n '/ERROR/p' run.log | wc -l
```
**解释**：sed 打印 ERROR 行 → 管道给 `wc -l` 计数。结果 `2`。

### 练习 7 · 多规则组合
```bash
sed -e 's/Sample_//g' -e 's/anti-CD3/CD3/' samples.txt
```
**解释**：两条替换顺序执行，先去前缀，再把 anti-CD3 改成 CD3。

### 练习 8 · 保留指定行
```bash
sed '2,5!d' genes.gtf
```
**解释**：`2,5!d` 表示「除 2-5 行外都删」，即只保留第 2-5 行。

---

## 三、生信实战

### 练习 9 · 清洗 VCF 变异表
```bash
sed -e '/^#/d' -e 's/^chr//' variants.vcf
```
**解释**：同练习 5。删注释头（`##` 和 `#`），去 `chr` 前缀，得到染色体为 `1/2/X` 的干净表格。

### 练习 10 · 规范化样本名
```bash
sed 's/Sample_0/SRR000/' samples.txt
```
**解释**：`Sample_0` → `SRR000`，保留后面的编号，于是 `Sample_01` → `SRR0001`、`Sample_08` → `SRR0008`。注意 old 是 `Sample_0`（含后面的 0），这样 Sample_03 等也能正确匹配。

### 练习 11 · 清洗表达矩阵
```bash
sed -e '/NA/d' -e 's/up/UP/' -e 's/down/DOWN/' expression.tsv
```
**解释**：`/NA/d` 删掉异常行，两条替换把 status 的 up/down 统一大写。

---

## 四、排错挑战

### 练习 12 · 只替换了一个
- **原因**：`sed 's/N//'` 默认只替换每行**第一个**匹配。
- **修复**：加 `g`：`sed 's/N//g' sequences.fa`（删掉每行所有 N）。

### 练习 13 · 斜杠冲突
- **原因**：`s` 命令的 `/` 是定界符，old/new 里的 `/`（路径）和定界符冲突，sed 解析乱掉。
- **修复**：换定界符：`sed 's|/data/raw|/data/clean|'`。

### 练习 14 · 打印了整份文件
- **原因**：sed 默认每行都输出，`3p` 又额外打印第 3 行一次。
- **修复**：加 `-n` 抑制默认输出：`sed -n '3p' run.log`。

### 练习 15 · 改错找不回
- **教训**：`-i` 原地覆盖不可逆，改错了没备份就找不回。
- **修复**：以后用 `sed -i.bak 's/up/high/' expression.tsv`，先备份成 `.bak` 再改，改错从 `.bak` 恢复。

---

## 五、综合任务

### 练习 16 · 交付前数据清洗
```bash
cd ../data/

# 1. 清洗 VCF：删注释 + 去 chr，原地修改 + 备份
sed -i.bak -e '/^#/d' -e 's/^chr//' variants.vcf

# 2. 清洗样本表：去前缀 + 改 treatment，原地修改 + 备份
sed -i.bak -e 's/Sample_//g' -e 's/anti-CD3/CD3/' samples.txt

# 3. 日志只留 ERROR/WARNING（删掉 INFO 行）
sed -e '/INFO/d' run.log

# 4. 验证
cat variants.vcf        # 确认无 # 无 chr
ls *.bak               # 确认有 variants.vcf.bak 和 samples.txt.bak
sed -n '/ERROR/p' run.log | wc -l   # 确认 ERROR 还在
```
**解释**：每一步都用到本课知识点——`-i.bak`（备份原地改）、`/^#/d`（删注释）、`s/^chr//`（去前缀锚点）、`-e`（多规则）、`/INFO/d`（删行）。

---

## 答案速查表

| 练习 | 核心命令 |
|------|---------|
| 1 | `sed '/^#/d' variants.vcf` |
| 2 | `sed 's/Sample_//g' samples.txt` |
| 3 | `sed -n '/ERROR/p' run.log` |
| 4 | `sed 's/NA/NotAvailable/' expression.tsv` |
| 5 | `sed -e '/^#/d' -e 's/^chr//' variants.vcf` |
| 6 | `sed -n '/ERROR/p' run.log \| wc -l` |
| 7 | `sed -e 's/Sample_//g' -e 's/anti-CD3/CD3/' samples.txt` |
| 8 | `sed '2,5!d' genes.gtf` |
| 9 | 同练习 5 |
| 10 | `sed 's/Sample_0/SRR000/' samples.txt` |
| 11 | `sed -e '/NA/d' -e 's/up/UP/' -e 's/down/DOWN/' expression.tsv` |
| 12 | 加 `g`：`sed 's/N//g'` |
| 13 | 换定界符：`sed 's\|/data/raw\|/data/clean\|'` |
| 14 | 加 `-n`：`sed -n '3p'` |
| 15 | 用 `-i.bak` 留备份 |
| 16 | `sed -i.bak -e '/^#/d' -e 's/^chr//' variants.vcf` 等 |
