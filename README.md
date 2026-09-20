# Linux Engineer Course 🐧

---

## 这是什么

一套**自学 Linux 工程课程**，40 课从文件系统一路学到 Docker / HPC / Nextflow，所有案例默认发生在「医院测序中心 / 科研实验室」——契合生物信息学的真实工作场景。

每节课产出：

- 📖 **HTML 课件**（深色/浅色主题、SVG 图解、可打印成 PDF）
- 📝 **学习笔记**（费曼复述 + 记忆锚点 + 每日反思）
- 🎴 **Anki 卡组**（本地仓库内，可导入 Anki 间隔复习）

---

## 学习目标

> 完成全部 40 课后，对 **Junior Linux Engineer** 的核心技能达到**完全熟练掌握**，并具备向 **Intermediate Linux Engineer** 过渡的能力。

核心技能覆盖：

- 文件系统、权限、进程、网络、systemd、Docker 基础
- Bash 脚本、Git、常见调试
- 生信工具工程化使用（samtools / bedtools / bcftools / FASTQ / VCF / MultiQC）

---

## 课程进度

**✅ 已完成 7 课 / 40 课**

### Part I · Linux Foundations（基础）

| # | 主题 | 状态 |
|---|------|------|
| 01 | Filesystem 文件系统 | ✅ 完成 |
| 02 | Path 路径与通配符 | ✅ 完成 |
| 03 | Permissions 权限 | ✅ 完成 |
| 04 | User & Group 用户与组 | ✅ 完成 |
| 05 | Vim & tmux 编辑器与终端复用 | ✅ 完成 |
| 05.5 | tmux 精通（延伸课） | ✅ 完成 |
| 06 | Find 按条件查找 | ✅ 完成 |
| 07 | Grep 内容检索 | ⏳ 待学 |
| 08 | Compression 压缩 | ⏳ 待学 |

### Part II · Shell Engineering（Shell 工程）

| # | 主题 | 状态 |
|---|------|------|
| 09 | Pipe 管道 | ⏳ 待学 |
| 10 | Redirection 重定向（Boss 战） | ⏳ 待学 |
| 11 | awk | ⏳ 待学 |
| 12 | sed | ⏳ 待学 |
| 13 | xargs | ⏳ 待学 |
| 14 | Bash Script 脚本 | ⏳ 待学 |
| 15 | Cron 定时任务（Boss 战） | ⏳ 待学 |
| 16 | Environment Variables 环境变量 | ⏳ 待学 |

### Part III · Ubuntu Engineering（Ubuntu 工程）

| # | 主题 | 状态 |
|---|------|------|
| 17 | Process 进程 | ⏳ 待学 |
| 18 | Memory 内存 | ⏳ 待学 |
| 19 | Disk 磁盘 | ⏳ 待学 |
| 20 | Log 日志（Boss 战） | ⏳ 待学 |
| 21 | systemctl 服务管理 | ⏳ 待学 |
| 22 | Network 网络 | ⏳ 待学 |
| 23 | apt 包管理 | ⏳ 待学 |
| 24 | tmux（深入） | ⏳ 待学 |

### Part IV · Bioinformatics Linux（生信 Linux）

| # | 主题 | 状态 |
|---|------|------|
| 25 | FASTQ（Boss 战） | ⏳ 待学 |
| 26 | samtools | ⏳ 待学 |
| 27 | bedtools | ⏳ 待学 |
| 28 | bcftools | ⏳ 待学 |
| 29 | GTF & BED | ⏳ 待学 |
| 30 | MultiQC（Boss 战） | ⏳ 待学 |
| 31 | RNA Pipeline | ⏳ 待学 |
| 32 | Automation 自动化 | ⏳ 待学 |

### Part V · Professional Linux Engineer（专业工程）

| # | 主题 | 状态 |
|---|------|------|
| 33 | Git Workflow | ⏳ 待学 |
| 34 | Docker | ⏳ 待学 |
| 35 | Conda & Mamba（Boss 战） | ⏳ 待学 |
| 36 | HPC Fundamentals | ⏳ 待学 |
| 37 | SLURM Scheduler | ⏳ 待学 |
| 38 | Nextflow | ⏳ 待学 |
| 39 | Junior Linux Engineer Assessment | ⏳ 待学 |
| 40 | Final Capstone Project | ⏳ 待学 |

---

## 目录结构

```
Linux/
├── README.md              # 本文件（课程总览）
├── lesson01/              # 第 1 课
│   ├── 0001-filesystem.html   # 主课件
│   ├── README.md              # 学习笔记（费曼复述 + 反思）
│   ├── notes.md               # 知识点笔记
│   ├── answers.md             # 练习参考答案
│   └── commands.sh            # 当天用到的所有命令
├── lesson02/
│   ├── 0002-path.html
│   └── README.md
└── ...
```

---

## 学习方法

1. **费曼复述**：每课读完，用「自己的比喻」把核心概念讲一遍，写进 README——讲不出来就是没真懂。
2. **tmux 贯穿**：从 Lesson 05 起，练习尽量在 tmux 里做（分屏看日志、detach/attach），练成远程工作的肌肉记忆。
3. **Anki 间隔复习**：每课配一张可导入 Anki 的 TSV 卡组，命令靠「提取练习」而非死记。

---

## 环境

- **系统**：Ubuntu Server 24.04 LTS（所有命令、输出、权限与它一致，零幻觉）
- **场景**：医院测序中心 / 大学科研实验室
- **练习环境**：学校服务器（普通用户，无 root 权限）——root 类命令的知识照学，实践待租服务器后补

---

## 作者

- GitHub：[@ZGup-Azmat](https://github.com/ZGup-Azmat)
- 最后更新：2026-09-20

> 「不是因为看到希望才坚持，而是坚持了才会看到希望。」—— 加油
