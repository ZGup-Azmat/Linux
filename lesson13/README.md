# Lesson 13 · xargs

> 课程：Linux Engineer Course · 13/40
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-10-28

## 本课学了什么（核心知识点）

### 1. xargs 是什么
- xargs 从标准输入读取数据，转成**命令参数**，交给另一个命令执行
- 解决根本问题：rm/mv/mkdir/echo 这些命令**不读 stdin**，管道传不过去
- ⚠️ xargs 后面不写命令时，默认执行 echo（用来「预览」参数）

### 2. 三个核心选项 -n / -I / -0
- `-n 2` 每次取 2 个参数一批；`-I {}` 每个输入项单独执行一次（{} 占位符可插中间）
- `-0` 用 NUL 分隔，配合 `find -print0`
- ⚠️ `-I` 和 `-n` 不能混用，`-I` 会覆盖 `-n`

### 3. find + xargs 黄金组合 与 边界
- `find . -name "*.tmp" -print0 | xargs -0 -r rm` 删除（空格安全 + 空输入不跑）
- ⚠️ 文件名含空格会被默认空白切碎；空输入 xargs 仍会裸跑一次

## 费曼复述（我自己的话）

> （用你自己的比喻解释：xargs 像把喂饭的母亲——有些命令张嘴就能自己吃饭（grep），有些废物只能母亲亲自去喂（rm），xargs 就是母亲。说说 -n（一批装几个）和 -I（一个一个装、能放到任意位置）的区别，以及 -print0 -0 为什么能对付带空格的文件名。）

## 记忆锚点

- xargs = stdin → 命令参数（搭桥工人）
- 不写命令默认 echo；-t 打印命令；-p 逐个确认
- -n 批量一起传，-I {} 一个一个带占位符（不混用）
- find -print0 | xargs -0 = 空格安全黄金组合
- 空输入加 -r 防裸跑；参数过多 xargs 自动分批

## 完成任务清单

- [x] 引导练习（4 条）
- [x] Lab 1.1–1.4（Level 1 基础）
- [x] Lab 2.1–2.6（Level 2 整合）
- [x] Lab 3.1–3.4（Level 3 工程）
- [x] 5 个 Debug Challenge
- [x] 4 个 Engineering Scenarios
- [x] Boss 战：清理 messy/ 乱摊子（含空格文件名 + 空输入坑）

## 反思

**今天最有成就感的一件事：**早上六点醒来去健身，爬坡爬了30分钟，还挺不错的，回来洗澡吃饭啥的

**今天卡住的地方 + 怎么解决的：**问gpt解决

**明天第一件事：**健身

## 配套练习数据

本课附带一套模拟练习（虚构数据，围绕测序中心清理场景）：

```
lesson13/
├── data/           # 模拟生信数据（samples.txt / raw/ / reports/ / logs/ / 含空格的 .tmp）
└── exercises/
    ├── EXERCISES.md    # 14 道练习题（基础/组合/实战/排错/综合）
    └── ANSWER_KEY.md   # 参考答案（先做题再看）
```

**用法**：先 `cd data/`，再按 `exercises/EXERCISES.md` 做练习，独立完成后对照 `exercises/ANSWER_KEY.md`。所有练习只用本课 xargs 知识。
