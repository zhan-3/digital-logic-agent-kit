# 六次实验任务速查（根据课程站镜像整理）

> 这份文件是**摘要，不是课程原文**。课程入口 `http://10.245.130.67/digital/` 为校内地址；打开需自行具备访问权限。课堂通知、当次实验页面和老师发放的 starter 优先于本摘要。请勿把本文件当作个人完成情况或直接写进报告。

| 实验 | 任务页（校内） | 快速自检 | 正式验收边界 |
|---|---|---|---|
| Lab 1 | `/digital/lab1/` 各任务页 | Icarus + GTKWave | 基本布线、2:1 MUX 与波形 |
| Lab 2 | `/digital/lab2/s2/`、`/digital/lab2/s3/` | Icarus + GTKWave | 四种 8:1 MUX、层次化 32 位加法器及任务页要求的 OJ 比较；**不要求 Vivado** |
| Lab 3 | `/digital/lab3/s2/`、`/digital/lab3/s3/`、`/digital/lab3/s6/`、`/digital/lab3/hw/` | Icarus 可辅检 | Vivado 波形、RTL/Synthesis、综合实现、EGO2 |
| Lab 4 | `/digital/lab4/s2/`、`/digital/lab4/s6/`、`/digital/lab4/lab2-hw/` | Icarus 可辅检 | Vivado 波形、RTL/Synthesis、EGO2 |
| Lab 5 | `/digital/lab5/s2/`、`/digital/lab5/lab3-hw/` | Icarus 可辅检 | Vivado 波形、周期测量、RTL/Synthesis、EGO2 |
| Lab 6 | `/digital/lab6/s2/`、`/digital/lab6/s3/` | Icarus 可辅检 | Vivado 波形、RTL Analysis、EGO2；本实验任务页**未要求 Synthesis schematic** |

## Lab 1 — HDL 与仿真入门

- 基本连线 `wire4`：四路输出对应输入 `a/b/b/c`；提供的 Testbench 穷举 8 种输入。
- 2:1 MUX：分别尝试逻辑表达式和条件表达式实现，观察两者结果；使用 GTKWave 查看 VCD。可选 OJ 练习按本人课堂要求执行。
- 交付：能重跑的源文件、Testbench 输出和真实波形；能解释位运算、逻辑运算和并行硬件。

## Lab 2 — 过程块、MUX 与层次化加法器

- 8:1 MUX：任务页列 `assign`、`?:`、`if...else`、`case` **四种**写法，分别保留文件，以相同 Testbench 覆盖各选择值和多组输入。
- 32 位加法器：例化四个 8 位加法器，使用名称关联法串接进位；课程 Testbench 至少包含随机测试。比较组合逻辑写法时使用自己的 OJ 实际结果，不复用别人的 OJ 图片。
- 与总览页“六种 MUX 写法”的表述不一致时，以该次具体任务页及老师通知为准。Lab 2 不把 Vivado 当必需验收链路。

## Lab 3 — 组合逻辑与完整 Vivado 流程

- 3-8 译码器：参考课程 `decoder_38.v` 与 `testbench.v`；无效使能全 1，有效使能输出低电平独热；逐时间段分析波形并完成上板。
- 8 位 ALU：`a,b` 为 8 位；加、减、按位与、按位或、逻辑左移（位数取 `b[2:0]`）；提供的 ALU starter 和 `tb_alu.sv` 使用五路操作按键**低有效**且一次只有一个有效；同页操作表却以 `10000` 等高有效形式书写，仿真应以 starter/Testbench 实际端口极性为准。输出 8 位结果、进位/借位或移出位、零标志；进位要求是否可省略以当次老师要求为准。至少展示两组输入的实际板上运算结果。
- 三人表决：**必须例化** 3-8 译码器，并按页面要求用 `assign` 构造表决输出；使用课程 Testbench，保存仿真与板级现象。
- 另有 **2 输入 4 位多路复用器**，拨码开关输入、LED 输出，完成仿真和上板。注意课程 `lab3/s3` 的**框图与真值表**：`enable=1,select=1` 时输出 4 位 `input_a-input_b`，`enable=1,select=0` 时输出 `input_a+input_b`，`enable=0` 时输出 `4'b1111`。虽然任务称“多路复用器”，这份真值表要求的是加/减结果选择，不能只看任务名称。
- 报告重点为 ALU/表决：代码、完整波形分析、RTL Analysis 和 Synthesis schematic。课后 `test1/test2/test3` 的 `if...else` 覆盖比较为选做，需仿真及两类 schematic，辨认锁存器。

## Lab 4 — DFF、寄存器文件与 SIPO

- DFF：异步高有效清零、上升沿采样和高有效使能；仿真明确覆盖写入、保持、**非时钟边沿复位**。
- 8×8 寄存器文件：`en` 写使能，`wsel/rsel` 选址；顶层须例化八个 8 位寄存器实例，而不是仅用行为数组代替。课堂重点：向两个不同编号写入不同数据，再按写入顺序读回；DFF 和寄存器文件各准备自己的 Bitstream。
- 8 位串入并出左移寄存器：`sin` 输入、**低有效同步复位**、`rd=1` 时并行读出；完成仿真和两类 schematic。
- 作业：三个并行时序块的非阻塞赋值逐拍传播。报告以寄存器文件代码、完整波形与两类 schematic 为重点；SIPO 是否并入当次报告按老师要求。

## Lab 5 — 100 MHz 精确间隔流水灯

- K4 异步复位，只亮 LED1；K5 每按一次切换启动/暂停；SW9/SW10 选择 `0.01 s / 0.1 s / 0.25 s / 1 s`；LED1–LED8 循环左移。课程页另有“LED0～8”的字样，以明确写的八灯要求和实际板卡核对。
- 在仿真中可缩短计数参数，但实板按 100 MHz 推导真实周期；波形顺序：复位 → 启动 → 暂停 → 一次间隔切换，使用 Marker/Transition 测量周期。
- 阻塞/非阻塞两组对比：组合逻辑案例观察内部 `n1`，时序案例观察内部 `B`；各自保存仿真、RTL Analysis 和 Synthesis schematic。报告须同时分析正常流水灯与这两组案例。

## Lab 6 — 学号后八位数码管

- 八位数码管从左到右显示**使用者本人**学号后八位；K4 每按一次加 1，K3 每按一次减 1，长按只计一次。按键约 10 ms 消抖并做边沿检测；数码管约每 2 ms 扫描一位。
- 分别验证一轮八位扫描、短抖动/稳定按压、至少两次有效计数边沿；完成 Vivado RTL Analysis、波形分析和真实上板。不要求 Synthesis schematic。
- 位选/段选有效电平在任务页内部有相互矛盾的文字；最终以 EGO2 原理图、当次 XDC 和实板核对。没有真实实板前不要声明显示正确。

## 全课共通冲突和判断规则

- EGO2 资料指向 `xc7a50tcsg324-1`、100 MHz `P17`；少数旧建工程/上板页面出现 `xc7a100tfgg484-1`、`Y18`，不应直接混用。优先核对自己拿到的开发板丝印和官方约束。
- 板上人类标号 SW1–SW16 与 XDC 的 SW0–SW15 容易错一位；记录“RTL 端口 → XDC 名 → FPGA PIN → 实物丝印”。
- 校内报告模板页面为占位；先覆盖**每个实验任务页**列出的提交项目。报告不能复用别人的波形、板上结论或截图。
