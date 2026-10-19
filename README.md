# Digital Logic Agent Kit

面向数字逻辑课程的 Agent 工程包：提供校内课程站轻量镜像、任务摘要、EGO2/Vivado 操作手册、OJ/报告网页安全工作流、通用脚本和带 TODO 的半成品接口。目标是让使用者快速建立**自己的**可复现工程，而不是共享个人报告或完整可提交答案。

## 五分钟开始

1. 阅读 [`AGENTS.md`](AGENTS.md)，让 Agent 按证据门推进。
2. 用 [`TASKS.md`](TASKS.md) 找到实验任务；需要原文时打开 [`course-site-mirror/10.245.130.67/digital/index.html`](course-site-mirror/10.245.130.67/digital/index.html)。
3. 把 [`PROMPT.md`](PROMPT.md) 交给 Agent，并提供自己的课程版本、板卡/XDC、个人数据和工作目录。
4. 从 [`starter/`](starter/README.md) 复制对应未完成接口，按 [`DESIGN-PLAYBOOK.md`](DESIGN-PLAYBOOK.md) 实现。
5. 用 [`CHECKLIST.md`](CHECKLIST.md) 核对真实证据。

## 文档导航

| 任务 | 文档 |
|---|---|
| 课程站、OJ、报告系统入口与镜像边界 | [`docs/COURSE-ACCESS.md`](docs/COURSE-ACCESS.md) |
| 推荐工程目录和状态模型 | [`docs/WORKSPACE-LAYOUT.md`](docs/WORKSPACE-LAYOUT.md) |
| 从零创建并完成 Vivado 工程 | [`docs/VIVADO-RUNBOOK.md`](docs/VIVADO-RUNBOOK.md) |
| EGO2 7A50T 时钟、开关、按键、LED 引脚 | [`docs/EGO2-7A50T.md`](docs/EGO2-7A50T.md) |
| OJ 一次性提交与结果未知处理 | [`docs/OJ-RUNBOOK.md`](docs/OJ-RUNBOOK.md) |
| Browser Use/CDP 整理并核对报告 | [`docs/WEB-REPORT-RUNBOOK.md`](docs/WEB-REPORT-RUNBOOK.md) |
| 本次端到端实践提炼出的约束 | [`docs/LESSONS.md`](docs/LESSONS.md) |
| 六次实验任务与已知冲突 | [`TASKS.md`](TASKS.md) |

## 脚本

```powershell
# Icarus 快速自检
.\scripts\run-iverilog.ps1 -Top tb_example -Files src\example.sv,sim\tb_example.sv

# Vivado 原生仿真
.\scripts\run-vivado-sim.ps1 -Top tb_example `
  -Files src\example.sv,sim\tb_example.sv `
  -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'

# 创建可打开的 Vivado 工程
.\scripts\create-vivado-project.ps1 -Name example -Top example `
  -Sources src\example.sv -SimTop tb_example -SimFiles sim\tb_example.sv `
  -Constraints constr\example.xdc -ProjectDir vivado\example `
  -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'

# 综合、实现、报告和 Bitstream
.\scripts\run-vivado-flow.ps1 -Top example -Sources src\example.sv `
  -Constraints constr\example.xdc -Part xc7a50tcsg324-1 `
  -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'

# 导出 RTL/Synthesis schematic SVG
.\scripts\export-vivado-schematics.ps1 -Top example -Sources src\example.sv `
  -OutputDir evidence -VivadoBin 'C:\Xilinx\Vivado\2023.2\bin'

# 本地浏览课程镜像
.\scripts\serve-course-mirror.ps1
```

脚本生成成功不等于实板通过。使用者仍需在 Vivado GUI 中取得课程要求的波形/原理图，并亲自确认硬件现象。

## 内容边界

仓库不包含个人学号、个人报告、个人 OJ 截图/提交记录、登录信息、Cookie/HAR 或个人完整答案。课程镜像排除了超过 GitHub 100 MB 上限的 MP4、第三方 ZIP 与抓取日志；它是时间点快照，当前老师要求和原站始终优先。