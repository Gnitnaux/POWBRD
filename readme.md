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

### 充电使能电路

<div align="center">
    <img src="https://github.com/Gnitnaux/POWBRD/blob/master/%E5%85%85%E7%94%B5%E4%BD%BF%E8%83%BD%E7%94%B5%E8%B7%AF.png?raw=true" alt="充电使能电路" width="500">
</div>

- 充电使能电路主要有两大作用：
  * 保护功率板  
  * 方便功率板的维修

- 其中核心芯片为CD4072BM96，由该芯片引脚符号即可得知其主要功能。该芯片主要进行逻辑运算：左侧“J=A+B+C+D"表示J输出为A、B、C、D四个输入的逻辑之和，右侧K同理。此外SHOOT、CHIP分别为控制板提供的平射和挑射信号的反向信号，在正常情况下为低电平，因此正常情况下K引脚，即BOOST_EN引脚为低电平，该信号传递至升压电路允许升压，同时LED灯亮表示升压正常。而当功率表某些部分出现异常或是踢球时，该芯片进行逻辑运算输出BOOST_EN为高电平，传递至升压电路阻值升压，从而起到保护电路的作用。

- 在维修功率板时，该芯片可作为检测的第一步，即用万用表测量各引脚电压，通过异常向其他部分排查，而且LED1的状态也可指示升压的正常与否，方便了功率板的维修。

- 要注意**该芯片的质量会直接影响功率板的工作状态**，在开发阶段进行测试时由于采购到了质量较差的该元件出现了种种问题，在元器件采购时需格外注意该芯片的质量。



### 水泥电阻放电电路

### 踢球电路

### 升压电路
  
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
