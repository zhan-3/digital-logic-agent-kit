# 数字逻辑实验：课程任务摘要 + Agent 半成品起点

这个仓库面向也使用 Agent 的同学：**复用任务拆解、接口起点和验证路线，而不是共享同一份可提交的答案**。没有个人报告、完整 RTL、学号、OJ 证据或课程镜像文件。

## 怎么用（按顺序）

1. 阅读 [`TASKS.md`](TASKS.md)：按校内课程站镜像整理 Lab 1–6 的主要任务、验收物及原文之间的冲突；每项都标出校内页面路径。**当次老师要求和本人可访问的原始页面优先。**
2. 把 [`PROMPT.md`](PROMPT.md) 发给自己的 Agent，附上自己的课程页面、板卡/XDC 与工作目录。
3. Agent 按 [`DESIGN-PLAYBOOK.md`](DESIGN-PLAYBOOK.md) 核对接口、边界与测试场景，挑选 [`starter/`](starter/README.md) 中的一份 `.sv.txt` 半成品起点；一次只做一个模块。
4. 补齐 `TODO_*`、写自己的自检 Testbench，按 [`CHECKLIST.md`](CHECKLIST.md) 逐项验证；实板与报告证据只能来自本人实际操作。

## 工具怎么选

| 场景 | 工具 | 要保留的结果 |
|---|---|---|
| Lab 1–2 快速仿真 | `iverilog -g2012` + `vvp`、GTKWave | 自检日志与 VCD 波形 |
| Lab 3–6 快速自检 | 同上（仅辅检） | 自检日志 |
| Lab 3–6 正式流程 | Vivado XSim/GUI、RTL Analysis、Synthesis、Implementation | 原生 WDB、真实 schematic、DRC/时序及 Bitstream |
| EGO2 上板 | 本人操作 Hardware Manager | 本人记录的按键、开关和实际显示 |

通用脚本位于 `scripts/`；示例（先替换为自己的**已完成**源文件、顶层名、器件和 Vivado 路径）：

```powershell
.\scripts\run-iverilog.ps1 -Top tb_example -Files src\example.sv,sim\tb_example.sv
.\scripts\run-vivado-sim.ps1 -Top tb_example -Files src\example.sv,sim\tb_example.sv -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'
.\scripts\run-vivado-flow.ps1 -Top example -Sources src\example.sv -Constraints constr\example.xdc -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin' -Part '请填本人板卡器件型号'
```

模板里保留的 `TODO_*` 故意无法编译，防止误把半成品当作已验证结果。课程站点是校内地址，本仓库不提供站点镜像或登录方式。
