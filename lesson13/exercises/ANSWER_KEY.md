# Lesson 13 · xargs 练习参考答案

> ⚠️ 先独立做完 EXERCISES.md 再看这里。

## 一、基础

**1.** 输出样本 ID 成一行
```bash
cat samples.txt | xargs
# PT001 PT002 PT003 PT004 PT005
```

**2.** 每 2 个一批
```bash
cat samples.txt | xargs -n 2
# PT001 PT002
# PT003 PT004
# PT005
```

**3.** 每个样本建一个目录
```bash
cat samples.txt | xargs -I {} mkdir -p {}
# 验证：ls -d PT0* 能看到 5 个目录
```

**4.** 用 -t 预览（不真删）
```bash
printf "junk1.tmp\njunk2.tmp\n" | xargs -t rm
# stderr 先打印：rm junk1.tmp junk2.tmp
# 此时 junk1.tmp junk2.tmp 会被真删——想只预览不删，把 rm 换成 echo：
printf "junk1.tmp\njunk2.tmp\n" | xargs -t echo
```

## 二、组合

**5.** 删普通 .tmp
```bash
find . -name "*.tmp" | xargs rm
# 验证：find . -name "junk*.tmp" 无输出
```

**6.** 删含空格的 .tmp（-print0 -0）
```bash
find . -name "*.tmp" -print0 | xargs -0 rm
# 验证：ls 看不到 sample 01.tmp 等；且不报 No such file
```
> 对比：若用 `find . -name "*.tmp" | xargs rm`，`sample 01.tmp` 会被切成 `sample` 和 `01.tmp`，rm 报 `cannot remove 'sample': No such file or directory`。

**7.** 移动 .bam
```bash
find . -name "*.bam" -print0 | xargs -0 -I {} mv {} aligned/
# 验证：ls aligned/ 有 patient01/02/03.bam
```

**8.** 统计 reports 总行数
```bash
find reports -name "*.txt" | xargs wc -l
# 输出每个文件行数 + 末尾 total
```

**9.** 逐个解压 fastq.gz
```bash
find raw -name "*.fastq.gz" | xargs -I {} gunzip {}
# 验证：ls raw/ 变成 SRR*.fastq（无 .gz）
```

## 三、实战

**10.** 统计每个 log 的 ERROR 数
```bash
find logs -name "*.log" -print0 | xargs -0 grep -c "ERROR"
# run1.log:1  run2.log:2  run3.log:0
```

**11.** 交互确认删除目录
```bash
ls -d PT0* | xargs -p rm -r
# 每删一个目录前提示 rm -r PT001?...，输入 y 才删
```

**12.** -r 防空输入裸跑
```bash
find . -name "*.vcf" | xargs -r rm
# 因为没有任何 .vcf，xargs 什么都不做，不报 missing operand
```

**13.** 统计行数且空格安全
```bash
find logs -name "*.log" -print0 | xargs -0 wc -l
```

## 四、排错

**14.** `find . -name "*.tmp" | xargs rm` 的坑：
- xargs 默认按**空白**切分输入，`sample 01.tmp` 被切成 `sample` 和 `01.tmp` 两个参数；
- 结果 `rm` 报 `cannot remove 'sample': No such file or directory`；
- 正确写法：`find . -name "*.tmp" -print0 | xargs -0 -r rm`（NUL 分隔 + 空输入不跑）。
