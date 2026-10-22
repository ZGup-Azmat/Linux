# Lesson 12 · sed

> 课程：Linux Engineer Course · 12/40
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-10-22

## 本课学了什么（核心知识点）

### 1. 替换 s/old/new/
- `sed 's/old/new/'` 替换每行第一个匹配
- `s/old/new/g` 替换所有；`s/old/new/2` 替换第二个
- ⚠️ 默认只替换每行第一个，要全换必须加 g

### 2. 地址定位 + 删除/打印
- `sed '/^#/d'` 删注释行、`sed '1,5d'` 删 1-5 行、`sed '3,5!d'` 只留 3-5 行
- `sed -n '5p'` 只打印第 5 行、`sed -n '/TP53/p'` 打印匹配行
- ⚠️ -n 和 p 必须搭配，否则匹配行出现两次

### 3. -i 原地修改 + 多命令 + 锚点
- `sed -i.bak 's/old/new/g' file` 备份后原地改
- `sed -e 's/a/b/' -e 's/c/d/'` 多条规则
- `sed 's/^/> /'` 行首加、`sed 's/$/,/'` 行尾加
- ⚠️ -i 不可逆，先备份；斜杠冲突换定界符 s|x|y|

## 费曼复述（我自己的话）

> （用你自己的比喻解释：sed 像「逐行过一遍的纠错机」，s/old/new/ 是「把错字圈出来改掉」，g 是「这一行所有错字都改」，d 是「整行划掉」，-i 是「改完直接写回本子」。说说 sed（改行内文字）和 awk（拆列算数）的分工。）

## 记忆锚点

- sed 改行内文字，awk 拆列算数（互补）
- 默认只换每行第一个，全换加 g
- /^#/d 删注释、-n '5p' 只打第5行
- -i.bak 备份再改，-i 裸用危险
- 斜杠冲突换定界符 s|x|y|

## 完成任务清单

- [x] 引导练习
- [x] Lab 1–4（Level 1 基础）
- [x] Lab 5–10（Level 2 整合）
- [x] Lab 11–15（Level 3 工程）
- [x] 5 个 Debug Challenge
- [x] 4 个 Engineering Scenarios
- [x] Boss 战：批量清洗脏文件 + 修好忘 g 的坑

## 反思

**今天最有成就感的一件事：**

**今天卡住的地方 + 怎么解决的：**

**明天第一件事：**

## 配套练习数据

本课附带一套模拟练习（虚构数据，围绕 GSE65496 T-ALL 场景）：

```
lesson12/
├── data/           # 6 个模拟生信数据（samples.txt / variants.vcf / genes.gtf / expression.tsv / sequences.fa / run.log）
└── exercises/
    ├── EXERCISES.md    # 16 道练习题（基础/组合/实战/排错/综合）
    └── ANSWER_KEY.md   # 参考答案（先做题再看）
```

**用法**：先 `cd data/`，再按 `exercises/EXERCISES.md` 做练习，独立完成后对照 `exercises/ANSWER_KEY.md`。所有练习只用本课 sed 知识。
