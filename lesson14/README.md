# Lesson 14 · Bash Script

> 课程：Linux Engineer Course · 14/40
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-11-01

## 本课学了什么（核心知识点）

### 1. 脚本是什么 + 如何运行
- 脚本 = 把一条条命令按顺序写进文本文件，交给 shell 从上到下逐行执行
- 第一行 `#!/bin/bash`（shebang）告诉系统「用哪个解释器」
- 两种运行方式：`bash script.sh`（不需要执行权限）/ `chmod +x script.sh` 后 `./script.sh`
- ⚠️ `./script.sh` 没加 x 权限会 `Permission denied`；没写 shebang 会用当前 shell 执行

### 2. 变量、引用、命令替换
- `name=value` 赋值，⚠️ 等号两边不能有空格（有空格 = command not found）
- `$name` / `${name}` 取值；`$(命令)` 把命令输出捕获成值；`read -p` 读键盘输入
- 单引号字面量不展开，双引号展开变量
- ⚠️ 变量永远加引号 `"$name"`，避免空值/空格导致词拆分出错

### 3. 控制流 if / for / while + 退出码
- `$?` = 上一条命令退出码，0 成功、非 0 失败；`&&` 成功才执行，`||` 失败才执行
- `if [ -f "$f" ]; then …; else …; fi` 做判断；`[ ]` 内侧两边都要有空格
- `for f in fastq/*.fastq; do …; done` 遍历；`while IFS= read -r line; do …; done < file` 逐行读
- ⚠️ `[ $s = yes ]` 变量为空会 `unary operator expected` → 写 `[ "$s" = yes ]`
- 进阶：`set -euo pipefail`（出错即停 / 未定义变量报错 / 管道失败算失败）

## 费曼复述（我自己的话）

> （用自己的比喻解释：脚本像一份菜谱，bash 是照做的厨师，shebang 是第一行「请谁来当厨师」的招牌。说说 `bash x.sh` 和 `./x.sh` 的区别、等号为什么不能有空格、`for` 和 `xargs` 各适合什么时候用。）

## 记忆锚点

- shebang `#!/bin/bash` 定解释器；`chmod +x` 后 `./` 才能跑
- 赋值 `name=value` 无空格；取值 `$name`；命令替换 `$(...)`
- 单引号不展开、双引号展开；变量永远 `"$var"` 加引号
- `$?` 退出码；`[ ]` 里要空格 + 变量要引号
- `for` 多步处理、`xargs` 一次喂参；`set -euo pipefail` 是生产标配

## 完成任务清单

- [x] 引导练习（4 条）
- [x] Lab 1.1–1.4（Level 1 基础）
- [x] Lab 2.1–2.6（Level 2 整合）
- [x] Lab 3.1–3.4（Level 3 工程）
- [x] 5 个 Debug Challenge
- [x] 4 个 Engineering Scenarios
- [x] Boss 战：run_qc.sh 一键质控报告（含目录检查 + 缺失跳过两个坑）

## 反思

**今天最有成就感的一件事：**

**今天卡住的地方 + 怎么解决的：**

**明天第一件事：**

## 配套练习数据

本课附带一套模拟练习（虚构数据，围绕测序中心每周质控场景）：

```
lesson14/
├── data/           # 模拟生信数据（samples.txt / config.txt / fastq/ / logs/）
└── exercises/
    ├── EXERCISES.md    # 16 道练习题（基础/组合/实战/排错/综合）
    └── ANSWER_KEY.md   # 参考答案（先做题再看）
```

**用法**：先 `cd data/`，再按 `exercises/EXERCISES.md` 做练习，独立完成后对照 `exercises/ANSWER_KEY.md`。所有练习只用本课 Bash 脚本知识（含前面学过的 grep/wc/重定向）。
