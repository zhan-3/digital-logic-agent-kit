# 从零完成 Vivado 工程

适用于 Lab 3–6 的正式流程。Icarus 是快速反馈，不能代替课程要求的 Vivado 证据。

## 0. 锁定规格

先写一张表：顶层名、源文件、Testbench 顶层、器件 Part、时钟与周期、复位/按键极性、XDC 来源、必须截图。EGO2 7A50T 通常使用 `xc7a50tcsg324-1`；旧材料中的 `xc7a100tfgg484-1` 或 `Y18` 不能直接混用。

完成标准：顶层所有端口均能在 RTL 和 XDC 中逐一对上，所有冲突已有裁决依据。

## 1. 先跑两个仿真环

```powershell
# 快速自检
.\scripts\run-iverilog.ps1 -Top tb_example -Files src\example.sv,sim\tb_example.sv

# Vivado 原生 XSim
.\scripts\run-vivado-sim.ps1 `
  -Top tb_example `
  -Files src\example.sv,sim\tb_example.sv `
  -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'
```

Testbench 用 `$fatal` 表示失败，并覆盖功能、边界、复位、保持和适用的按键场景。XSim 应产生 WDB，GUI 中添加实际信号并运行到完整场景；周期任务使用 Marker/Transition 测量，不凭肉眼估算。

完成标准：两种仿真均有实际通过日志，波形可解释每个关键时间段。

## 2. 创建可打开的 `.xpr`

```powershell
.\scripts\create-vivado-project.ps1 `
  -Name example `
  -Top example `
  -Sources src\example.sv `
  -SimTop tb_example `
  -SimFiles sim\tb_example.sv `
  -Constraints constr\example.xdc `
  -ProjectDir vivado\example `
  -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'
```

打开生成的 `.xpr` 后依次运行：Behavioral Simulation、Open Elaborated Design/RTL Analysis、Run Synthesis、Run Implementation、Generate Bitstream。

## 3. 批处理实现

```powershell
.\scripts\run-vivado-flow.ps1 `
  -Top example `
  -Sources src\example.sv `
  -Constraints constr\example.xdc `
  -Part xc7a50tcsg324-1 `
  -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'
```

读取 `drc.rpt`、`timing_summary.rpt` 和 `utilization.rpt`，不要只看 `.bit` 是否存在。纯组合顶层没有用户时钟路径时 WNS/TNS 可能为 `NA`；这不是“100 MHz 时序通过”。`CFGBVS-1` 等警告应记录含义，不把 warning 写成 error，也不静默忽略。

完成标准：综合、布局布线和 DRC 没有阻塞错误；时序结论与设计类型相符；Bitstream 路径明确。

## 4. 原理图与截图

- RTL Analysis：说明 RTL 层级、MUX/译码/寄存器结构。
- Synthesis schematic：说明综合优化后的硬件映射。
- 两者不是同一张图，不能互相替代。
- 截图前 Fit/Zoom，保留能辨认的端口和关键单元；超宽图优先导出 SVG，而不是截一张不可读全屏图。

## 5. Hardware Manager

1. 连接板卡并 Open Target → Auto Connect。
2. 核对发现的器件与工程 Part；例如应看到 `xc7a50t_0`。
3. Program Device，选择当前模块的 `.bit`。
4. 按测试表逐项操作开关/按键并观察输出。
5. 记录实际现象；重新上电或下载其他 Bitstream 会覆盖当前配置。

完成标准：使用者确认至少一组正常、一组边界以及适用的复位/松开行为。Bitstream 生成与 Program 成功仍不等于功能验收。