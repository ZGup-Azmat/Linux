# Lesson 01 · Answers · 参考答案

> 先独立完成 Lab，卡住再看这里。

| Lab | 答案命令 |
|-----|----------|
| 1 | `pwd` |
| 2 | `cd ~ && mkdir sequencing_center` |
| 3 | `ls -a` |
| 4 | `touch sample1.txt sample2.txt sample3.txt` |
| 5 | `mkdir -p data/raw/2026` |
| 6 | `cd data/raw/2026 && cd ../..` |
| 7 | 绝对 `cd /home/user/data`；相对 `cd ~/data` |
| 8 | `cp sample1.txt sample1_backup.txt` |
| 9 | `mv sample3.txt sample3_final.txt` |
| 10 | `file sample1.txt` |
| 11 | `mkdir raw_data trimmed aligned results` |
| 12 | `mkdir raw_data/patient{01..08}` |
| 13 | `cd raw_data/patient01 && touch tumor.fastq.gz` |
| 14 | `mkdir empty_dir && rmdir empty_dir` |
| 15 | `mkdir -p tmp_dir/sub && touch tmp_dir/sub/f && rm -r tmp_dir` |
| 16 | `mkdir -p RNA_Project/raw_data/patient01 && cd RNA_Project/raw_data/patient01` |

## Boss 战参考

```bash
mkdir -p RNA_Pipeline/{raw_data,trimmed,aligned,results,logs}
mkdir RNA_Pipeline/raw_data/patient{01..08}
touch RNA_Pipeline/raw_data/patient01/{tumor.fastq.gz,normal.fastq.gz}
pwd
ls -R RNA_Pipeline
```

## 调试挑战答案（简）

1. Permission denied → 别在 `/root` 操作，回自己的 `~/`
2. command not found → `lss` 拼错，应为 `ls`
3. No such file → `/data` 不存在，可能想进 `~/data`
4. No space left → `df -h` 查磁盘，清理 `/tmp`
5. `mkdir a/b/c` 报错 → 用 `mkdir -p a/b/c`
