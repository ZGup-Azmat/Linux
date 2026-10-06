# Lesson 09 · Pipe

> 课程：Linux Engineer Course · 09/40
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-10-03

## 本课学了什么（核心知识点）

### 1. 管道 `|`：stdout → stdin
- `cmd1 | cmd2` 把左边命令的标准输出喂给右边命令的标准输入
- 可无限串联：`cat x | grep y | wc -l`
- ⚠️ 管道只传 stdout，不传 stderr（报错直接上屏）

### 2. 管道过滤器
- grep 过滤、`wc -l` 数行、head/tail 截头尾、sort 排序、uniq 去重、cut -f 取列
- `zcat file.fastq.gz | grep "^@" | wc -l` 数 read（不解压）
- `grep -v "^#" sample.vcf | wc -l` 数变异（跳过 # 头）
- ⚠️ uniq 只去「相邻」重复，去重前必须先 sort；FASTQ 每 read 4 行

### 3. 管道 vs 重定向 + tee
- `|` 接命令，`>`/`>>` 写文件；`tee` 边存文件边继续传
- ⚠️ `>` 会静默覆盖，`>>` 追加，`tee -a` 追加

## 费曼复述（我自己的话）

> （用你自己的比喻解释：管道像流水线/传送带，一个命令的产物直接送到下一个工序；uniq 像「只合并站在一起的相同快递单」，所以要先 sort 把相同的排在一起。）
>
> 只有左边能传东西给右边才能使用 | 并且右边也得能接受，比如如果右边为一个生产者比如说ls，那么就只能ls文件夹中的内容了
>
> 并且在这里可以很方便的在tmux中使用tail -f 这个命令来监控生成的东西，并且可以把这个生成存进一个results文件中，在这一节课你必须熟悉并且熟练在高通的基础知识，不然有些的一个read有几行你不知道，并且不知道为啥是4行，这是生信基础

## 记忆锚点

- 管道 `|` = 传送带，stdout→stdin，数据从左流向右
- 过滤器六件套：grep 滤、wc 数、head/tail 截、sort 排、uniq 去、cut 取列
- uniq 前必 sort（只去相邻）
- FASTQ 4 行/read；数 read 用 `grep -c "^@"`，数行要 ÷4
- tee = 边存边传；`>` 覆盖、`>>` 追加

## 完成任务清单

- [x] 引导练习
- [x] Lab 1–4（Level 1 基础）
- [x] Lab 5–10（Level 2 整合）
- [x] Lab 11–15（Level 3 工程）
- [x] 5 个 Debug Challenge
- [x] 4 个 Engineering Scenarios
- [x] Boss 战：测序数据体检 + 修好漏 sort 的坑

## 反思

**今天最有成就感的一件事：**终于从假期中解脱出来，开始学习了，我还是比较喜欢学习的，比起假期毫无节制我还是更喜欢规律一些

**今天卡住的地方 + 怎么解决的：**AI、查文档、查教学资料进行复习

**明天第一件事：**刷对应Anki卡
