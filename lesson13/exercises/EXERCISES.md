# Lesson 13 · xargs 练习

> 环境：Ubuntu Server 24.04 LTS ｜ 目录：先 `cd data/` 再做题
> 规则：独立完成，做完再看 `ANSWER_KEY.md`。只用本课 xargs + 之前的知识。

## 一、基础（Foundation）

**1.** 用 xargs 把 `samples.txt` 里的 5 个样本 ID 输出成一行。

**2.** 用 `-n 2` 把 `samples.txt` 每 2 个一批输出。

**3.** 用 `-I {}` 给 `samples.txt` 里每个样本建一个同名目录（建在当前目录下）。

**4.** 用 `-t` 预览「删除 junk1.tmp junk2.tmp」这条命令实际拼成了什么（先不真删）。

## 二、组合（Integration）

**5.** 用 find + xargs 删除所有普通 `.tmp` 文件（junk1.tmp、junk2.tmp）。

**6.** 用 `-print0 | xargs -0` 删除所有**含空格**的 `.tmp` 文件（sample 01.tmp 等），确认不报 No such file。

**7.** 用 find + xargs 把所有 `.bam` 移动到 `aligned/` 目录。

**8.** 统计 `reports/` 下所有 `.txt` 的总行数（要出现 total）。

**9.** 用 `-I {}` 逐个解压 `raw/` 下的所有 `.fastq.gz`（解压后 `ls raw/` 应看到 `.fastq`）。

## 三、实战（Engineering）

**10.** 统计 `logs/` 下每个 `.log` 里 `ERROR` 出现的次数（输出「文件名:数字」）。

**11.** 用 `-p` 交互确认，逐个删除你刚才建的样本目录（体会确认提示）。

**12.** 用 `-r` 执行「删除不存在的 *.vcf」（find 结果为空），确认它不会裸跑报错。

**13.** 一条命令完成：统计 `logs/` 里每个文件的行数，且文件名含空格也安全。

## 四、排错（Debug，先想为什么再看答案）

**14.** 下面命令哪里错了？为什么？

```bash
find . -name "*.tmp" | xargs rm
```

如果 `data/` 里还有 `sample 01.tmp` 这类含空格的文件，这条命令会报什么？正确写法是什么？
