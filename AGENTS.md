# 数字逻辑 Agent 工作协议

本仓库帮助 Agent 从课程材料建立可复现的 HDL/Vivado 工程，不提供可冒充本人完成的报告、OJ 证据或实板结论。

## 开始顺序

1. 读取 `README.md` 和 `docs/COURSE-ACCESS.md`，确认课程版本与原始来源。
2. 读取 `TASKS.md`，提取本次实验的必须项、选做项、课上验收和报告证据。
3. 读取 `docs/WORKSPACE-LAYOUT.md` 和 `docs/LESSONS.md`，创建独立实验目录；保留 starter 原件。
4. Vivado 任务读取 `docs/VIVADO-RUNBOOK.md`；EGO2 引脚任务再读取 `docs/EGO2-7A50T.md`。
5. OJ 任务读取 `docs/OJ-RUNBOOK.md`；网页报告任务读取 `docs/WEB-REPORT-RUNBOOK.md`。
6. 按 `DESIGN-PLAYBOOK.md` 设计，按 `CHECKLIST.md` 验证。

## 证据门槛

- 本地编译通过只证明语法和本地测试通过，不等于 OJ Accepted。
- XSim 波形、RTL Analysis、Synthesis schematic、Implementation、Bitstream 和实板现象是六类不同证据。
- Bitstream 存在只证明生成成功；实板通过必须由使用者真实下载并确认输入与输出。
- 报告只使用本人的代码、真实截图与真实观察；状态不明时写“未验证”。
- OJ 写操作和报告最终提交都需要使用者针对当前对象再次明确确认；不因历史授权重复提交。

## 停止条件

规格冲突、板卡型号不明、XDC 与顶层不匹配、测试失败、DRC/时序错误、网页保存结果不明或登录过期时，停止写入性动作，报告观测并提出一个最小验证步骤。