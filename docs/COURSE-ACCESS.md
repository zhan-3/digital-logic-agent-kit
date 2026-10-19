# 课程站、OJ 与报告系统

## 入口

| 系统 | 校内入口 | 用途 |
|---|---|---|
| 数字逻辑课程站 | `http://10.245.130.67/digital/` | 实验任务、starter、XDC、Vivado 指南、板卡资料 |
| Verilog OJ | `http://10.245.130.66/oj/` | 在线题目、综合图、资源报告和提交记录 |
| 实验报告系统 | 由学校门户/WebVPN 进入 | 编辑、上传图片、暂存和最终提交 |

这些是内网地址。使用者负责通过校园网或本人获准的 WebVPN 会话访问；仓库不保存账号、密码、Cookie、HAR 或 token。

## 仓库内轻量镜像

`course-site-mirror/10.245.130.67/digital/index.html` 是一次静态抓取，适合离线查任务和图片。它是时间点快照，不替代老师当前通知。可在仓库根目录运行：

```powershell
python -m http.server 8000 --directory course-site-mirror
```

然后访问：

```text
http://localhost:8000/10.245.130.67/digital/index.html
```

为满足 GitHub 单文件上限并避免无价值二进制，镜像不含三段大于 100 MB 的 MP4、`surfer_win.zip` 和抓取日志。页面中的视频链接因此可能失效；需要视频时回到校内原站。

## 来源优先级

发生冲突时按以下顺序裁决：

1. 当次老师通知和使用者本人打开的当前页面；
2. 当前实验具体任务页、starter、Testbench、板卡原理图和 XDC；
3. 仓库镜像；
4. `TASKS.md` 摘要和通用经验。

将冲突写成“来源 A 规定什么、来源 B 规定什么、采用哪一个、如何验证”，不要静默猜测。