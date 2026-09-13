#!/usr/bin/env bash
# ============================================================
# Lesson 01 · The Linux Filesystem — 今天用到的所有命令
# 环境：Ubuntu Server 24.04 LTS
# 用法：逐段手动敲（不要一键跑完，理解每一条）
# ============================================================

# ---------- 引导练习 ----------
pwd                      # 我在哪个目录？
mkdir RNA_Project        # 建项目目录
cd RNA_Project           # 进入
touch patient001.fastq.gz
ls                       # 看到 patient001.fastq.gz
ls -l                    # 长格式：权限/属主/大小/时间

# ---------- Level 1 · 基础 ----------
cd ~                     # 回家目录
pwd                      # 确认 /home/user
mkdir sequencing_center  # Lab 2
ls -a                    # Lab 3：看到 . 和 ..
touch sample1.txt sample2.txt sample3.txt   # Lab 4

# ---------- Level 2 · 整合 ----------
mkdir -p data/raw/2026                    # Lab 5：递归建多级目录
cd data/raw/2026 && cd ../..              # Lab 6：进两层再回两层
cd /home/user/data                       # Lab 7：绝对路径（换成你的用户名）
cd ~/data                                 # Lab 7：相对路径
cp sample1.txt sample1_backup.txt         # Lab 8
mv sample3.txt sample3_final.txt          # Lab 9
file sample1.txt                          # Lab 10：输出 empty

# ---------- Level 3 · 工程 ----------
mkdir raw_data trimmed aligned results    # Lab 11：一条命令建四个目录
mkdir raw_data/patient{01..08}            # Lab 12：花括号展开建 8 个目录
cd raw_data/patient01 && touch tumor.fastq.gz   # Lab 13
mkdir empty_dir && rmdir empty_dir        # Lab 14：删空目录
mkdir -p tmp_dir/sub && touch tmp_dir/sub/f && rm -r tmp_dir   # Lab 15：删非空目录
mkdir -p RNA_Project/raw_data/patient01 && cd RNA_Project/raw_data/patient01   # Lab 16

# ---------- Boss 战 ----------
mkdir -p RNA_Pipeline/{raw_data,trimmed,aligned,results,logs}   # 花括号一次建五个目录
mkdir RNA_Pipeline/raw_data/patient{01..08}                     # 8 位患者
touch RNA_Pipeline/raw_data/patient01/{tumor.fastq.gz,normal.fastq.gz}
pwd                                                             # 定位到 patient01 并截图
ls -R RNA_Pipeline                                              # 递归列出整棵树并截图



  724  ll
  725  ls
  726  ls -a
  727  mkdri sequencing_center
  728  mkdir sequencing_center
  729  ll
  730  conda -list
  731  conda -envs list
  732  ll
  733  cd s
  734  cd sequencing_center/
  735  ll
  736  ls
  737  touch a.txt b.txt c.txt
  738  ls
  739  ll
  740  ls -a
  741  mkdir -p data/raw
  742  ll
  743  tree
  744  pwd
  745  ls
  746  kk
  747  l
  748  ll
  749  cp a.txt data/a_move.txt
  750  ll
  751  tree
  752  mv a.txt data/MV_a.txt
  753  ll
  754  tree
  755  ll
  756  mkdir raw_data trimmed aligned results
  757  ll
  758  mkdir raw_data/patient{01..08}
  759  ll
  760  tree
  761  lls
  762  ls
  763  cd raw_data/
  764  ll
  765  ls -a
  766  mkdir ../pppp
  767  ll
  768  cd ..
  769  ll
  770  tree
  771  cd pppp/
  772  ll
  773  touch a.txt b.txt Python.gz
  774  ll
  775  cd ..
  776  ll
  777  tree
  778  rm -r pppp/
  779  ll
  780  cd d`
`
  781  cd data/
  782  lll
  783  ll
  784  cd raw/
  785  ll
  786  cd..
  787  cd ..
  788  ll
  789  cd ..
  790  tree
  791  cd r
  792  cd raw_data/ll
  793  cd raw_data/
  794  ll
  795  cd patient0
  796  cd patient01
  797  pwd
  798  touch 2.xtxt
  799  ll
  800  touch 23.txt
  801  touch hhh.gz
  802  ll
  803  mkdir kkk{1..10}
  804  ll
  805  cd ..
  806  ll
  807  cd ..
  808  tree
  809  cd /public/workspace/student_id/sequencing_center/raw_data/patient01
  810  ll
  811  ln 2.xtxt hhh.gz 
  812  ls -s ./
  813  ll
  814  pwd
  815  cd /public/workspace/student_id/sequencing_center/
  816  ll
  817  cd ..
  818  ll
  819  cd sequencing_center/
  820  ll
  821  rm *
  822  rm -r *
  823  ll
  824  mkdir -p RNA_Pipeline/{raw_data/ trimmed/ aligned/ results/ logs/}
  825  ll
  826  tre
  827  tree
  828  rm -r *
  829  ll
  830  mkdir -p RNA_Pipeline/raw_data trimmed aligned results logs
  831  ll
  832  tree
  833  ll
  834  rm -r *
  835  ll
  836  mkdir -p RNA_Pipeline/{raw_data/,trimmed/,aligned/,results/,logs/}
  837  ll
  838  mkdir -p RNA_Pipeline/raw_data/patient{01..08}
  839  ll
  840  tree
  841  touch RNA_Pipeline/raw_data/patient01/tumor.fastq.gz normal.fastq.gz
  842  cd RNA_Pipeline/raw_data/patient01/
  843  pwd
  844  ll
  845  cd ..
  846  ll
  847  cd ..
  848  l
  849  ll
  850  tree
  851  cd 
  852  cd /public/workspace/student_id/sequencing_center/RNA_Pipeline/raw_data/patient01
  853  ll
  854  touch normal.fastq.gz
  855  ll
  856  cd ~
  857  ll
  858  cd sequencing_center/
  859  ls -R
  860  history > ~/my_commands_$(date +%Y%m%d).txt
