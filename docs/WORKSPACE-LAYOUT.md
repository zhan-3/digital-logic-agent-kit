# 推荐项目目录

每次实验使用独立目录，生成物与源文件分离：

```text
workspace/
├─ AGENTS.md                 # 可选：指向本仓库工作协议
├─ STATUS.md                 # 软件、Vivado、实板、报告分别记录
├─ labN/
│  ├─ README.md              # 本实验入口、命令和完成边界
│  ├─ Makefile               # Icarus 快速回归入口
│  ├─ starter/               # 课程原件，只读保留
│  ├─ src/                   # 自己实现的 RTL
│  ├─ sim/                   # 自检 Testbench、波形配置
│  ├─ constr/                # 每个板级顶层对应的 XDC
│  ├─ evidence/              # 真实截图、导出的 schematic、记录
│  ├─ report/                # 报告草稿；不放账号信息
│  ├─ build/                 # 可重建的仿真/综合产物，通常忽略
│  └─ vivado/                # `.xpr` 工程，通常忽略或按需保留
└─ scripts/                  # 通用自动化，不嵌入个人数据
```

## 文件边界

- `starter/` 保存原始接口，用于比较课程版本；实际代码放 `src/`。
- Testbench 顶层名、DUT module 名、脚本 `-Top` 必须一致。
- 一个独立板级顶层对应一份 XDC 和一份 Bitstream，避免多个模块争用同一引脚。
- `build/` 产物可重建；`evidence/` 只放人为选取并核对过的真实证据。
- 报告引用 `evidence/`，不要引用临时目录或他人的截图。

## STATUS 最小状态机

每个模块分别记录：

```text
RTL → 本地自检 → XSim → RTL Analysis → Synthesis
    → Implementation/DRC/Timing → Bitstream → 实板 → 报告暂存 → 最终提交
```

状态只向前推进到已观察的事实。例如 `Bitstream=通过` 与 `实板=待验证` 可以同时成立。