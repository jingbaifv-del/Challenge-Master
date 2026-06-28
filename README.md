# Challenge Master Skill

你抛一个想法、话题或方案，Challenge Master 帮你摇几个“虚拟大佬”一起脑暴：有人挑战伪需求，有人算 ROI，有人看用户动机，有人盯数据归因，最后把共识、分歧和下一步问题整理出来。

它适合用来把一句粗糙想法变成一场可追问、可反驳、可收敛的多角色讨论，而不是直接给你一份看似完整但未经挑战的方案。

触发口令：

```text
来活儿了挑战大师：<你的需求/想法>
```

例如：

```text
来活儿了挑战大师：我想做一个用户分层功能，用来提升首单后用户的复购率
```

```text
来活儿了挑战大师：我们准备做一个抽奖活动，提高省钱频道活跃，你们帮我挑战一下
```

## 它会怎么帮你

- 自动按话题推荐 4 个最匹配角色，也允许你加人或换人。
- 先澄清目标用户、核心问题、业务指标和约束，避免直接跳方案。
- 让角色互相挑战，而不是各说各话。
- 用紧凑短卡输出角色判断、理由、风险、追问和可展开方向。
- 每轮整理完整共识、结构化分歧和“需要你补充的信息”。
- 支持你随时插话、补充背景、反驳角色、要求某个角色展开。
- 收敛时输出综合建议，并可保存脑暴纪要和需求卡片。

## 输出长什么样

```markdown
### 增长负责人｜主指标
**判断：** 先定唯一主指标，否则活动会变成“热闹但不可复盘”。
- 理由：拉活跃、拉交易、小部件添加，对应三套不同任务链路。
- 风险：多目标会让预算、转化、复盘都说不清。
- 追问：第一优先级是活跃、交易，还是小部件添加？
- 可展开：指标树、AB 方案、ROI 口径。

## 本轮小结
**当前共识：**
- 活动不应该先从“加玩法、加任务、加奖品”开始，而应该先明确它服务哪个业务目标。

**当前分歧：**
- 增长负责人 vs 产品负责人：增长负责人要求先定唯一主指标，产品负责人认为还要明确产品心智沉淀。

**需要你补充：**
1. 主目标：活跃、交易，还是小部件添加？
```

## 安装

### Claude Code

适合希望在所有 Claude Code 项目里都能使用：

```bash
git clone https://github.com/jingbaifv-del/Challenge-Master.git
cd Challenge-Master
./install.sh --claude
```

不传参数时默认等价于 `./install.sh --claude`，安装到：

```text
~/.claude/skills/challenge-master
```

### Codex / Agents-style 客户端

适合支持 `~/.agents/skills/` 目录的 Codex 或 Agents-style 客户端：

```bash
git clone https://github.com/jingbaifv-del/Challenge-Master.git
cd Challenge-Master
./install.sh --codex
```

安装到：

```text
~/.agents/skills/challenge-master
```

### Claw

适合 Claw 客户端：

```bash
git clone https://github.com/jingbaifv-del/Challenge-Master.git
cd Challenge-Master
./install.sh --claw
```

安装到：

```text
~/.claw/skills/challenge-master
```

### 项目本地安装

适合只想在当前 Claude Code 项目使用：

```bash
git clone https://github.com/jingbaifv-del/Challenge-Master.git
cd Challenge-Master
./install.sh --project /path/to/your/project
```

安装到：

```text
/path/to/your/project/.claude/skills/challenge-master
```

### 自定义安装目录

如果你的客户端使用其他 skill 目录，可以直接指定目标路径：

```bash
./install.sh --target /custom/skills/challenge-master
```

### 更新已有安装

进入本仓库目录后拉取最新代码，再按原平台重新执行安装命令：

```bash
cd Challenge-Master
git pull
./install.sh --claude
```

Codex、Claw 或项目本地安装分别改用 `--codex`、`--claw`、`--project /path/to/your/project`。

### 验证是否生效

重启对应的 agent 客户端后输入：

```text
来活儿了挑战大师：我想做一个用户分层功能
```

如果生效，它会先推荐 4 个角色，并询问你是否要加人或换人。

## 使用方式

在已安装的 agent 客户端里输入：

```text
来活儿了挑战大师：我想做一个用户分层功能
```

Challenge Master 会先识别话题，推荐 4 个最匹配的职能角色，并问你是否要加人或换人。确认角色后，如果想法很粗，会先追问关键问题；如果想法足够清晰，会进入多角色脑暴。

你可以这样回应角色推荐：

```text
就这样
```

```text
加上乔布斯
```

```text
把数据分析师换成经营负责人
```

```text
先问我几个问题
```

当你想结束讨论时，可以说：

```text
总结一下，形成文档
```

默认输出到：

```text
docs/challenge-master/YYYY-MM-DD-主题-brainstorm.md
docs/challenge-master/YYYY-MM-DD-主题-requirement-card.md
```

你也可以只要求总结，不保存：

```text
先总结一下，不用保存
```

## 示例

### 产品需求脑暴

```text
来活儿了挑战大师：我想做一个用户分层功能，用来提升首单后用户的复购率
```

适合输出：目标用户、核心问题、分层是否必要、最小验证方案、运营动作和指标设计。

### 增长策略讨论

```text
来活儿了挑战大师：我们想提高小游戏频道的每日玩游戏人数，但要保证整体 ROI 为正
```

适合输出：增长断点、用户分层、成本收益、实验方案和风险边界。

### 方案评审挑战

```text
来活儿了挑战大师：我准备把首页改成任务流入口，你们帮我挑战一下这个方案
```

适合输出：支持理由、风险边界、反方挑战、待补充信息和收敛建议。

## 角色选择

Challenge Master 会默认推荐 4 个匹配角色，同时展示完整可选角色。你可以保留、加人或换人。

### 产品与体验

- `产品挑战者`：挑战伪需求、弱目标和方案先行的问题。
- `方案设计师`：把想法收敛成方案选项、MVP 和验证路径。
- `产品负责人`：判断战略匹配度、优先级、资源投入和产品方向。
- `用户研究员`：检查用户证据、真实场景、动机和可用性风险。
- `客服体验负责人`：检查服务质量、升级路径、SLA 和用户信任。

### 增长与运营

- `用户运营专家`：评估用户分层、生命周期、触达、权益和留存。
- `增长负责人`：评估转化、增长实验、指标拆解和 ROI。
- `运营效率专家`：检查流程节省、SOP 适配、采用阻力和责任人。
- `内容策略专家`：检查内容供给、叙事、分发和注意力循环。

### 商业与经营

- `经营负责人`：从业务结果、收入、成本、风险和汇报视角做判断。
- `业务负责人`：检查业务归属、验收标准、资源取舍和落地责任。
- `商业化负责人`：检查收入模型、定价、毛利、合作方和商业上限。
- `财务负责人`：检查成本、预算、ROI、回本周期和下行风险。
- `品牌市场负责人`：检查定位、传播、信任、渠道和品牌一致性。

### 技术与风险

- `数据分析师`：检查指标、基线、归因、分群和实验设计。
- `技术架构师`：检查技术可行性、系统集成、扩展性和维护风险。
- `AI 产品经理`：检查 AI 必要性、可靠性、评估方式和兜底设计。
- `风控合规专家`：检查隐私、合规、滥用、权限和审计风险。
- `一线执行代表`：检查真实执行负担、异常处理、培训和落地阻力。

### 外部名人视角

- `张一鸣`：系统、目标、数据、组织、长期主义、信息匹配。
- `马斯克`：第一性原理、成本拆解、极限效率、删需求、快速迭代。
- `乔布斯`：产品品味、聚焦、端到端体验、砍复杂度、用户感受。
- `特朗普`：谈判、杠杆、传播、注意力、强势叙事。

## 外部角色来源

可选角色中的 `张一鸣`、`马斯克`、`乔布斯`、`特朗普` 是对以下 MIT-licensed skills 的轻量改编，只保留为 Challenge Master 角色视角，不复制原技能全文：

- 张一鸣：https://github.com/alchaincyf/zhang-yiming-skill
- 马斯克：https://github.com/alchaincyf/elon-musk-skill
- 乔布斯：https://github.com/alchaincyf/steve-jobs-skill
- 特朗普：https://github.com/alchaincyf/trump-skill

## 输出文档

当你说“总结一下，形成文档”时，Challenge Master 会保存两份文件：

- `brainstorm.md`：保留原始想法、角色选择、关键澄清、角色观点、挑战、共识、分歧和综合建议。
- `requirement-card.md`：把讨论收敛成背景、目标用户、核心问题、指标、推荐方案、风险和下一步行动。

保存前如果主题不清楚，Challenge Master 会先问你要用什么短标题。

文档内容示例：

```markdown
## 综合建议

- 推荐方向：先做最小验证，不直接上完整方案。
- 核心理由：当前证据不足，但目标用户和业务指标值得验证。
- 最大风险：如果核心问题判断错，后续方案会变成无效优化。
- 最小验证动作：用一组用户和一个关键指标做小范围实验。
- 下一步：补充目标用户、现有数据和资源约束。
```

## 文件结构

```text
challenge-master/
├── SKILL.md        # 轻量主流程，默认加载
├── roles.md        # 完整角色库，需要时读取
├── templates.md    # 输出文档模板，收敛保存时读取
├── install.sh      # 多平台安装脚本
├── README.md       # 使用说明
├── CHANGELOG.md    # 版本变化
├── CONTRIBUTING.md # 贡献说明
└── examples/
```

`SKILL.md` 只保留触发、流程、角色速查和质量规则；完整角色定义和模板拆到独立文件，减少首次触发时的上下文负担。

## 适合场景

- 产品需求脑暴
- 方案评审前自检
- 增长/运营策略讨论
- 向老板汇报前预演
- 粗想法变成可执行需求卡片

## 不适合场景

- 已经明确要直接写代码的任务
- 只需要查资料或跑 SQL 的任务
- 不希望被挑战、只想要执行的任务
