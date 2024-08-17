# 功率板

## 概述

- 功率板的主要作用：通过升压模块将 $16V$ 电压升高至 $220V$，进而给电磁铁供电，并接受控制板的踢球信号控制电磁铁踢球。
  
- 两个 $2200 \mu F$ 的大电容可以实现对能量的储存，储存的的能量在踢球时通过极短的时间释放，从而驱动电磁铁踢球。
  
## 功率板原理图及PCB设计文件

目前有老功率板与新功率板两版设计，两版原理相同，新功率板在老功率板基础上进行了一定优化和删减。两版原理图及PCB设计文件如下：

- 老功率板原理图：[交大云盘](https://jbox.sjtu.edu.cn/l/y1gkPk)
- 新功率板原理图：[交大云盘](https://jbox.sjtu.edu.cn/l/r1TiNZ)
- 老功率板PCB设计（Altium Designer）：[交大云盘](https://jbox.sjtu.edu.cn/l/D1rCPL)
- 新功率板PCB设计（嘉立创）：[交大云盘](https://jbox.sjtu.edu.cn/l/51VMpd)

## 功率板原理图解析

### 
  
## 功率板对踢球力度的控制

实现对踢球力度的控制在比赛过程中极为重要，通过控制板给与功率板不同的力度信号，并用示波器测量该信号，测试结果如下：

<div align="center">
    <img src="https://github.com/Gnitnaux/POWBRD/blob/master/%E6%8E%A7%E5%88%B6%E6%9D%BF%E8%B8%A2%E7%90%83%E4%BF%A1%E5%8F%B7%E6%B5%8B%E8%AF%95/control_board_force_40.jpg?raw=true" alt="力度40" width="200">
    <img src="https://github.com/Gnitnaux/POWBRD/blob/master/%E6%8E%A7%E5%88%B6%E6%9D%BF%E8%B8%A2%E7%90%83%E4%BF%A1%E5%8F%B7%E6%B5%8B%E8%AF%95/control_board_force_80.jpg?raw=true" alt="力度80" width="200">
    <img src="https://github.com/Gnitnaux/POWBRD/blob/master/%E6%8E%A7%E5%88%B6%E6%9D%BF%E8%B8%A2%E7%90%83%E4%BF%A1%E5%8F%B7%E6%B5%8B%E8%AF%95/control_board_force_100.jpg?raw=true" alt="力度100" width="200">
</div>

进一步定量测试，有如下结果：

| 踢球力度 | 127    | 100  | 80  | 60  | 40  |
| :---: | :---: | :---: | :---: | :---: | :---: |
| **脉冲宽度** | $12.6ms$ | $10ms$ | $8ms$ | $6ms$ | $4ms$ |

可见踢球力度是通过踢球信号的脉冲时间来控制的，且踢球力度与信号脉冲时间成正比。