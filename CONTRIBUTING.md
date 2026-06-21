# Contributing to Business OS

## Scope of contributions

| Welcome | Out of scope |
|---------|--------------|
| New or improved **business skills** under `skills/<id>/skill.md` | Project-specific business artifacts |
| **Business standards** templates under `standards/` | Tool-specific lock-in |
| **Concept** prompts under `concepts/<id>/` | Generated content |
| Bug fixes / typo fixes anywhere | Adding `AGENTS.md` |

## Adding a new skill

```text
skills/<skill-id>/
├── skill.md       # required — YAML frontmatter + protocol
└── reference.md   # optional — extended examples
```

Register the skill in:
- `skills/README.md` § Registered skills
- `skills/SKILL_DEPENDENCIES.md` (prerequisite gate)
- `README.md` § Skills at a glance
- `.cursorrules` § Skills table
- `PROCESS_ROUTER.md` routing table
- `START_HERE.md` decision tree (if user-facing)

## License

By contributing you agree your contribution is licensed under the [MIT License](LICENSE).
