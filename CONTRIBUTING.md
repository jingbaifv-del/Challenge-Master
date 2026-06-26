# Contributing

Thanks for improving Challenge Master.

## What to contribute

Good contribution areas:

- New role suggestions with clear positioning and discussion behavior.
- Better role recommendation mappings for specific topics.
- Clearer discussion formats that improve readability.
- Better output templates for brainstorm notes or requirement cards.
- Documentation improvements and examples.

## Role proposal format

When proposing a role, include:

```markdown
### <角色名>

- Positioning: What perspective this role represents.
- Capabilities: What this role can evaluate or contribute.
- Discussion preference: How this role should speak and challenge.
- Common objections: What this role commonly pushes back on.
```

## Quality bar

Before opening a PR:

- Keep `SKILL.md` lightweight.
- Put long role definitions in `roles.md`.
- Put document templates in `templates.md`.
- Avoid making external public figure roles default unless strongly justified.
- Preserve user participation and role confirmation before debate.
- Avoid copying external skills wholesale; summarize and attribute sources when adapting.

## Local validation

After editing, verify installation locally:

```bash
./install.sh
```

Then restart Claude Code and try:

```text
来活儿了挑战大师：我想做一个用户分层功能
```
