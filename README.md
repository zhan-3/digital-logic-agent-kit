# 数字逻辑实验 Agent 工作包

**目标：复用做实验的方法，不复用某个人的答案。** 这里提供 Agent 指令、Lab 1–6 的设计检查点、可运行的工具入口和空模板；不含个人 RTL、Testbench、报告、学号、OJ 证据或课程网站镜像。

## 3 分钟开始

1. 把 [`PROMPT.md`](PROMPT.md) 完整发给你的 Agent；附上你自己有权访问的实验要求、EGO2 板卡/XDC 资料和当前项目目录。
2. 让 Agent 先按 [`DESIGN-PLAYBOOK.md`](DESIGN-PLAYBOOK.md) **核对任务版本和接口**，输出验收清单，不要立即贴代码。
3. 一次只做一个模块：规格/真值表 → RTL → 自检 Testbench → 运行 → Vivado（适用时）→ 人工上板 → 报告。每一步失败先定位再继续。
4. 完成项按 [`CHECKLIST.md`](CHECKLIST.md) 打钩；没有真实波形/板上现象就保持待验证。

## Agent 该调用什么

| 环节 | 首选工具/操作 | 通过标志 |
|---|---|---|
| 查要求 | 读取本人课程页面、下载的 XDC/模板；有登录态时优先授权 Chrome CDP | 列出来源、冲突、端口表 |
| 阅读/修改工程 | Agent 的文件读取、精确编辑、命令执行工具；先 `git status` | 改动可审阅，不覆盖原始 starter |
| 快速自检 | Icarus `iverilog -g2012` + `vvp`；可用 `scripts/run-iverilog.ps1` | 自检程序非零退出即失败 |
| 正式仿真 | Vivado `xvlog` → `xelab` → `xsim`，或 GUI；可用 `scripts/run-vivado-sim.ps1` | 实际 XSim 日志和 WDB |
| 综合/实现 | Vivado GUI 或 `scripts/run-vivado-flow.ps1` | RTL/Synthesis、DRC、时序、Bitstream 分别核对 |
| 波形/原理图 | Vivado GUI；Lab 1–2 可用 GTKWave | 真实导出，信号名和时刻可读 |
| 上板 | 本人使用 Vivado Hardware Manager 操作 EGO2 | 人工记录输入与实际输出 |
| 报告 | 本人的代码、日志、波形和实物现象 | 未做的项明确标待验证 |

上表是工具顺序，不代表全部工具已经安装。Windows PowerShell 示例（按自己的文件名替换）：

```powershell
.\scripts\run-iverilog.ps1 -Top tb_example -Files src\example.sv,sim\tb_example.sv
.\scripts\run-vivado-sim.ps1 -Top tb_example -Files src\example.sv,sim\tb_example.sv -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'
.\scripts\run-vivado-flow.ps1 -Top example -Sources src\example.sv -Constraints constr\example.xdc -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin' -Part '请填本人板卡器件型号'
```

也可以在 Vivado GUI 创建工程、添加 RTL/仿真源/XDC，然后依次 **Run Simulation → Open Elaborated Design → Run Synthesis → Run Implementation → Generate Bitstream**。脚本输出不等于 GUI 截图，更不等于实物验收。

模板文件为 `.txt`，需按自己的任务填写接口和逻辑后再改名。课程版本、器件、引脚和有效电平以你手上的指导书及实板为准，不以本工作包替代课程要求。
