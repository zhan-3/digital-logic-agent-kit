# Browser Use：报告网页与证据整理

目标是让 Agent 协助整理真实报告，不接管身份验证或替使用者做不可逆提交。

## 会话边界

1. 使用者在可见 Chrome 中自行登录课程站、OJ 或报告系统。
2. Agent 请求连接现有 Chrome 的 CDP/Browser Use；出现 `Allow remote debugging?` 时由使用者点击 Allow。
3. 连接失败时先运行诊断和重载连接；保持同一条技术路线，不用桌面坐标点击替代网页会话。
4. 不读取或保存密码、Cookie、token、HAR；登录过期时停下让使用者重新认证。

## Browser Use 基本原语

```bash
browser-use --doctor
browser-use <<'PY'
print(page_info())
print([{"title": t.get("title"), "url": t.get("url")} for t in list_tabs()])
PY
```

复用已经登录的匹配标签页，用 `switch_tab(targetId)` 后重新读取 `page_info()`。定位按钮优先过滤 `Accessibility.getFullAXTree` 的 role/name，再用 `backendDOMNodeId` 取得 box 并点击；每次点击后都读取预期状态，不把“已派发点击”当成“保存成功”。上传文件时使用 Browser Use 的上传原语和本机绝对路径，随后检查页面返回的预览/URL。

## 报告流水线

1. 从实验任务页列出报告必交项，先建立 Markdown 草稿骨架。
2. 只引用本次实际生成的代码、日志、波形、schematic 和实板记录。
3. 图片上传后保存站点返回的 URL；为每张图片写“输入/时间段/输出/结论”，避免只贴图。
4. 使用编辑器的真实键盘输入替换正文。CodeMirror 会虚拟化 DOM，`.cm-content.innerText` 可能只包含可见片段；以预览区完整文本、标题和关键段落核对内容。
5. 点击“暂存”，等待保存状态恢复，再重新加载页面。
6. 重载后检查：草稿状态、正文关键段落、图片数量、每张图片 `naturalWidth > 0`、无 TODO/占位语句。
7. 给使用者输出“可提交检查结果”。只有收到针对当前报告的明确最终确认，才允许点击“提交”。

## 推荐核对表

```text
[ ] 报告标题与网站实验编号一致
[ ] 代码段完整且与实际运行版本一致
[ ] 波形信号名和时间分析可读
[ ] RTL Analysis 与 Synthesis schematic 分开
[ ] 实板结论只写本人确认过的现象
[ ] 图片重载后仍可显示
[ ] 页面仍是草稿或已由使用者明确要求提交
```

## 故障语义

- 点击暂存后断线：保存结果未知，重新登录并读取页面，不盲目重复提交。
- 上传成功但预览为空：先检查图片 URL 和加载状态，再保存正文。
- 编辑器 DOM 看似截断：检查预览区；不要因为虚拟化误判正文丢失。
- 页面回到统一认证：本轮写操作停止，等待使用者恢复会话。