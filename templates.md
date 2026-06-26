# Challenge Master Output Templates

Use this file only when the discussion is converging and output documents need to be saved.

If the user asks to summarize without saving, provide the final synthesis in chat and do not write files. If the user asks to form documents, save both files. If the topic is unclear, ask for a short Chinese title before writing files.

## Save Location

Save two Markdown files under `docs/challenge-master/` in the current Claude Code workspace root. If no workspace or project root is clear, ask the user for a target directory before saving.

Use filenames:

```text
docs/challenge-master/YYYY-MM-DD-主题-brainstorm.md
docs/challenge-master/YYYY-MM-DD-主题-requirement-card.md
```

Use a short Chinese topic slug derived from the idea. If the topic is unclear, ask the user for a short title before saving.

## Brainstorm Note Template

```markdown
# <主题> 脑暴纪要

## 原始想法

<用户最初的需求/想法>

## 角色选择

- 推荐角色：...
- 用户确认/调整：...

## 关键澄清

- <问题>：<用户回答或当前假设>

## 角色观点

> **<角色名>**
> - 核心判断：...
> - 主要理由：...
> - 这条判断的风险/边界：...
>
> **其他角色对这段观点的挑战**
> - <挑战角色名>：...

如果某段观点没有被其他角色挑战，省略“其他角色对这段观点的挑战”小节，但保留角色观点卡。

## 共识

- ...

## 分歧

- ...

## 需要用户补充的信息

- <问题>（来自：<角色名>）

## 未决问题

- ...

## 综合建议

- 推荐方向：...
- 核心理由：...
- 最大风险：...
- 最小验证动作：...
- 下一步：...
```

## Requirement Card Template

```markdown
# <主题> 需求卡片

## 背景

...

## 目标用户

...

## 核心问题

...

## 目标与指标

...

## 推荐方案

...

## 不推荐方案或暂缓项

...

## 关键风险

...

## 最小验证动作

...

## 下一步行动

...
```

Before writing files, ensure the directory exists. If it does not, create it. After saving, tell the user the two file paths.
