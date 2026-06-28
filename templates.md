# Challenge Master Output Templates

Use this file only when the discussion is converging and output documents need to be saved.

If the user asks to summarize without saving, provide the final synthesis in chat and do not write files. If the user asks to form documents, save both files. If the topic is unclear, ask for a short Chinese title before writing files.

## Save Location

Save two Markdown files under `docs/challenge-master/` in the current agent workspace root. If no workspace or project root is clear, ask the user for a target directory before saving.

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

### <角色名>｜<本卡关键词>
**判断：** ...
- 理由：...
- 风险：...
- 追问：...
- 可展开：...
- 挑战：<挑战角色名>认为...（仅当存在直接挑战时保留）

## 共识

- <完整表述已达成一致的判断及其理由，不压缩成一句话>
- <如有多个共识，逐条保留完整推理，避免只写结论>

## 分歧

- <角色A> vs <角色B>：<双方分歧点>

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

Role-card guidance: use compact briefing cards by default. If a role has no risk, write `风险：无明显风险`; if it has no follow-up question, write `追问：无`. Use `可展开` to preserve discoverable depth without making the first pass too long. Keep `挑战` only when a direct role-to-role challenge appeared in the discussion.

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
