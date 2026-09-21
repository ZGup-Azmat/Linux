# Lesson 05.5 · tmux 精通（延伸加强课）

> 课程：Linux Engineer Course · 05.5/40（延伸课，不占正式编号）
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-09-15

## 本课学了什么（核心知识点）

### 1. 窗口（Window）：一个会话里的多个「标签页」
- `Ctrl-b c` 新建、`Ctrl-b ,` 重命名、`Ctrl-b 0-9` 跳转、`Ctrl-b n/p` 循环
- `Ctrl-b w` 列窗口、`Ctrl-b f` 按名查找、`Ctrl-b &` 关闭
- ⚠️ 窗口编号从 0 开始；忘了起名全变成 bash 分不清

### 2. 窗格进阶
- `Ctrl-b z` 放大/还原（临时全屏，最常用）
- `Ctrl-b space` 切布局、`Ctrl-b {`/`}` 交换位置
- `Ctrl-b [` 进入 copy-mode 回滚看历史、`q` 退出、`Ctrl-b ]` 粘贴
- ⚠️ 鼠标滚轮要开 `mouse on` 才有反应

### 3. 配置 ~/.tmux.conf（无需 root）
- `set -g mouse on` 开鼠标、`set -g history-limit 10000` 加大回滚
- 改 prefix：`set -g prefix C-a` + `unbind C-b`（别忘了 unbind！）
- 改完 `tmux source ~/.tmux.conf` 立即生效

## 费曼复述（我自己的话）

> （用你自己的比喻写下 window / pane / copy-mode / 配置文件的理解）

## 记忆锚点

- 三层：session（会话）→ window（标签页）→ pane（分屏）
- `Ctrl-b z` = 临时全屏，`Ctrl-b [` = 回滚看历史
- 配置在 ~/.tmux.conf，改完要 source
- 改 prefix 必须 unbind 旧的，否则新旧并存乱套

## 完成任务清单

- [ ] 引导练习
- [ ] Lab 1–4（Level 1 基础）
- [ ] Lab 5–10（Level 2 整合）
- [ ] Lab 11–16（Level 3 工程）
- [ ] 5 个 Debug Challenge
- [ ] 4 个 Engineering Scenarios
- [ ] Boss 战：tmux 多窗格工作流 + 修好 prefix 埋坑

## 截图占位

> 把下面截图贴进这个仓库：

- [ ] tmux 状态栏（含窗口命名 qc/align/viz）
- [ ] 分屏 + `Ctrl-b z` 放大 + copy-mode 回滚的截图
- [ ] 埋坑修复过程（发现 prefix 失灵 → 补 unbind C-b → 修复）

## 反思

**今天最有成就感的一件事：**

**今天卡住的地方 + 怎么解决的：**

**明天第一件事：**
