# Lesson 04 · User & Group

> 课程：Linux Engineer Course · 04/40
> 环境：Ubuntu Server 24.04 LTS
> 日期：2026-09-15

## 本课学了什么（核心知识点）

### 1. 用户账号：whoami / id / who / getent
- `whoami` 我是谁；`id` 看 UID/GID/组；`id -un` 只看用户名
- `who` / `w` 谁登录了（w 还看正在跑的命令）
- `getent passwd user` 查用户完整信息
- `/etc/passwd` 每行 7 字段：用户名/密码占位/UID/GID/描述/家目录/shell
- ⚠️ root 是 UID 0；普通用户 UID 从 1000 起（1–999 是系统账号）

### 2. 组：主组 vs 附加组
- 主组唯一（新文件默认属组）；附加组多个（额外授权）
- `groups` 看组；`getent group` 查组
- ⚠️ `usermod -G` 不带 `-a` 会**覆盖**原附加组（经典坑）

### 3. 管理命令：useradd / passwd / usermod / groupadd / userdel + sudo
- `useradd -m -s /bin/bash` 建号（-m 建家目录）
- `passwd` 设密；`usermod -aG` 拉组
- 离职：先 `passwd -l` 锁号（可逆），交接完再 `userdel -r` 删号（不可逆）

## 费曼复述（我自己的话）

> 由于目前还没有root账号，所有这个等3个月后租了服务器之后自己再敲一遍，但命令还是基本都理解了

## 记忆锚点

- root UID=0，普通用户 UID 从 1000
- `usermod -aG` 的 `-a` 千万别漏（漏了覆盖附加组）
- `useradd` 要带 `-m` 才有家目录
- 团队权限用组管，人跟着组流动（可交接）

## 完成任务清单

- [x] 引导练习
- [x] Lab 1–4（Level 1 基础）
- [x] Lab 5–10（Level 2 整合）
- [x] Lab 11–16（Level 3 工程）
- [x] 5 个 Debug Challenge
- [x] 4 个 Engineering Scenarios
- [ ] Boss 战：搭「用户+组+权限」体系 + 修好漏 `-a` 的坑

## 反思

**今天最有成就感的一件事：**学会了一些东西，感觉挺好的，每天都能学到新东西，每天都有一点成长，这是人生最快乐的事情了

**今天卡住的地方 + 怎么解决的：**无法解决，因为没有自己的专属服务器，我目前是穷比，但未来肯定会有个万亿公司哈哈哈

**明天第一件事：**继续学习

date：2026年9月15日18:34:07

