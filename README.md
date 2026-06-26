# Challenge Master Skill

你抛一个想法/方案,我帮你摇来一群大佬脑暴完善。
不提高思考效率，只提升思考深度。

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

## 自有角色简介

Challenge Master 内置一组职能角色，用于覆盖产品、增长、运营、技术、商业化和执行视角：

- `产品挑战者`：挑战伪需求、弱目标和方案先行的问题。
- `方案设计师`：把想法收敛成方案选项、MVP 和验证路径。
- `产品负责人`：判断战略匹配度、优先级、资源投入和产品方向。
- `用户运营`：评估用户分层、生命周期、触达、权益和留存。
- `增长运营`：评估转化、增长实验、指标拆解和 ROI。
- `经营负责人`：从业务结果、收入、成本、风险和汇报视角做判断。
- `用户研究`：检查用户证据、真实场景、动机和可用性风险。
- `数据分析`：检查指标、基线、归因、分群和实验设计。
- `技术架构`：检查技术可行性、系统集成、扩展性和维护风险。
- `业务负责人`：检查业务归属、验收标准、资源取舍和落地责任。
- `AI 产品`：检查 AI 必要性、可靠性、评估方式和兜底设计。
- `风控合规`：检查隐私、合规、滥用、权限和审计风险。
- `客服体验`：检查服务质量、升级路径、SLA 和用户信任。
- `运营提效`：检查流程节省、SOP 适配、采用阻力和责任人。
- `商业化`：检查收入模型、定价、毛利、合作方和商业上限。
- `财务视角`：检查成本、预算、ROI、回本周期和下行风险。
- `品牌市场`：检查定位、传播、信任、渠道和品牌一致性。
- `内容策略`：检查内容供给、叙事、分发和注意力循环。
- `一线执行`：检查真实执行负担、异常处理、培训和落地阻力。

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
