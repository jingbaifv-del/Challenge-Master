# Challenge Master Skill

`challenge-master` 是一个 Claude Code skill，用于把一句粗糙需求变成多角色脑暴讨论。

触发口令：

```text
来活儿了挑战大师：<你的需求/想法>
```

## 能做什么

- 先澄清目标用户、核心问题、业务指标和约束。
- 内置更大的职能角色库，每次按话题自动推荐 4 个最匹配角色。
- 让你确认是否加人或换人，再开始角色讨论。
- 让角色互相挑战，而不是各说各话。
- 允许用户持续插话、补充背景、反驳角色、要求收敛。
- 结束时输出综合建议，并保存两份文档：脑暴纪要和需求卡片。

## 文件结构

```text
challenge-master/
├── SKILL.md      # 轻量主流程，默认加载
├── roles.md      # 完整角色库，需要时读取
├── templates.md  # 输出文档模板，收敛保存时读取
├── README.md
└── examples/
```

`SKILL.md` 只保留触发、流程、角色速查和质量规则；完整角色定义和模板拆到独立文件，减少首次触发时的上下文负担。

## 安装

把整个 `challenge-master` 目录复制到 Claude Code 的 skills 目录：

```bash
mkdir -p ~/.claude/skills
cp -R challenge-master ~/.claude/skills/challenge-master
```

如果你想只在某个项目里使用，也可以复制到项目本地：

```bash
mkdir -p .claude/skills
cp -R challenge-master .claude/skills/challenge-master
```

## 使用方式

在 Claude Code 里输入：

```text
来活儿了挑战大师：我想做一个用户分层功能
```

Challenge Master 会先识别话题，推荐 4 个最匹配的职能角色，并问你是否要加人或换人。确认角色后，如果想法很粗，会先追问关键问题；如果想法足够清晰，会进入多角色脑暴。

当你想结束讨论时，可以说：

```text
总结一下，形成文档
```

默认输出到：

```text
docs/challenge-master/YYYY-MM-DD-主题-brainstorm.md
docs/challenge-master/YYYY-MM-DD-主题-requirement-card.md
```

## 适合场景

- 产品需求脑暴
- 方案评审前自检
- 增长/运营策略讨论
- 向老板汇报前预演
- 粗想法变成可执行需求卡片

## 外部角色来源

可选角色中的 `张一鸣`、`马斯克`、`乔布斯`、`特朗普` 是对以下 MIT-licensed skills 的轻量改编，只保留为 Challenge Master 角色视角，不复制原技能全文：

- 张一鸣：https://github.com/alchaincyf/zhang-yiming-skill
- 马斯克：https://github.com/alchaincyf/elon-musk-skill
- 乔布斯：https://github.com/alchaincyf/steve-jobs-skill
- 特朗普：https://github.com/alchaincyf/trump-skill

## 不适合场景

- 已经明确要直接写代码的任务
- 只需要查资料或跑 SQL 的任务
- 不希望被挑战、只想要执行的任务
