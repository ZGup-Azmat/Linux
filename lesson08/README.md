# Lesson 08 · Compression

> 课程：Linux Engineer Course · 08/40
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-10-03

## 本课学了什么（核心知识点）

### 1. gzip / gunzip 单文件压缩
- `gzip sample.fastq` 压成 `.gz`（默认删除原文件）
- `gunzip` / `gzip -d` 解压；`-k` 保留原文件；`-c` 输出到 stdout
- `zcat` / `zgrep` / `zless` 不解压直接读/搜
- ⚠️ gzip 只能压单个文件，不能压目录；已压缩格式（.bam/.jpg/.png）再压无效

### 2. tar 打包 + 压缩（.tar.gz）
- `tar -czf project.tar.gz project/` 打包并压缩（c=create z=gzip f=file）
- `tar -tzf` 只列内容；`tar -xzf` 解压；`-C dir` 指定解压目标
- ⚠️ 忘记 -f 报 Refusing to read；创建漏 -z 会生成未压缩的假 .tar.gz

### 3. 压缩工具选择
- gzip 快、bzip2 更小、xz 最小最慢；zip 跨平台（Windows）
- ⚠️ zip/unzip 可能没预装（需 sudo）；已压缩格式别再压

## 费曼复述（我自己的话）

> （用你自己的比喻解释：gzip 是「压扁一个纸团」，tar 是「先把一堆文件装进一个箱子再压」，.tar.gz 就是「装箱后压缩」。以及为什么 .bam 不用再压。）

## 记忆锚点

- gzip 压单文件，tar 打包多文件/目录，合体 = .tar.gz
- gzip 默认删原文件，想保留用 -k
- tar 三兄弟：-c 创建、-x 解压、-t 列表（都配 -z -f）
- 已压缩的 .bam/.jpg/.png/.gz 别再压，纯浪费 CPU

## 完成任务清单

- [x] 引导练习
- [x] Lab 1–4（Level 1 基础）
- [x] Lab 5–10（Level 2 整合）
- [x] Lab 11–15（Level 3 工程）
- [x] 5 个 Debug Challenge
- [x] 4 个 Engineering Scenarios
- [x] Boss 战：迷你测序项目压缩打包 + 修好漏 -z 的坑

## 反思

**今天最有成就感的一件事：**

**今天卡住的地方 + 怎么解决的：**

**明天第一件事：**
