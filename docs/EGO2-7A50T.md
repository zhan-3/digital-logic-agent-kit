# EGO2 7A50T 板级速查

适用前提：板卡和 Hardware Manager 均确认器件为 `xc7a50t`，工程 Part 使用 `xc7a50tcsg324-1`。若丝印或器件不同，停止套用本表。

## 时钟与输入

100 MHz 时钟：`P17`，应在时序设计 XDC 中加入：

```tcl
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]
```

| 实物 | XDC 常用名 | PIN | 实物 | XDC 常用名 | PIN |
|---|---|---|---|---|---|
| SW1 | SW0 | R2 | SW9 | SW8 | J4 |
| SW2 | SW1 | R3 | SW10 | SW9 | T3 |
| SW3 | SW2 | M4 | SW11 | SW10 | T4 |
| SW4 | SW3 | M3 | SW12 | SW11 | U3 |
| SW5 | SW4 | P2 | SW13 | SW12 | U4 |
| SW6 | SW5 | N4 | SW14 | SW13 | T5 |
| SW7 | SW6 | N6 | SW15 | SW14 | J2 |
| SW8 | SW7 | L4 | SW16 | SW15 | J5 |

拨码开关向上/ON 观察为逻辑 1。注意实物 SW1–SW16 与课程 XDC 的 SW0–SW15 相差 1。

| 按键 | 旧资料名 | PIN | 常见观察 |
|---|---|---|---|
| K1 | S0/button_0 | M2 | 未按 1、按下 0 |
| K2 | S1/button_1 | N2 | 未按 1、按下 0 |
| K3 | S2/button_2 | M1 | 未按 1、按下 0 |
| K4 | S3/button_3 | L1 | 未按 1、按下 0 |
| K5 | S4/button_4 | N1 | 未按 1、按下 0 |
| K6 | — | K3 | 具体用途和极性按本实验验证 |

## LED

| LED | PIN | LED | PIN |
|---|---|---|---|
| LED1 | D4 | LED9 | G1 |
| LED2 | C5 | LED10 | F2 |
| LED3 | A4 | LED11 | E1 |
| LED4 | A3 | LED12 | G3 |
| LED5 | B1 | LED13 | H3 |
| LED6 | A1 | LED14 | J3 |
| LED7 | B2 | LED15 | K2 |
| LED8 | B3 | LED16 | H4 |

当前板上观察为输出 1 时 LED 亮。约束只建立端口与引脚关系；端口可以叫 `a[7]`、`vote` 或其他名称，只要 `[get_ports ...]` 与顶层端口完全一致。

## ALU 实例的映射思路

若 SW1–SW8 表示 `a[7:0]`，SW9–SW16 表示 `b[7:0]`，则两组权值都是 `128,64,32,16,8,4,2,1`。常见展示将 `result[7:0]` 接 LED9–LED16，进位/借位/移出位接 LED1，零标志接 LED2；五个低有效操作键使用 K1–K5。这个映射是示例，不是所有实验的固定接口。

## 上板验证记录

每次记录四列：输入动作、预期输出、实际输出、结论。首次程序下载至少验证全 0、单比特、边界/溢出和按键松开状态；数码管还需核对左右位序、段选和位选极性。