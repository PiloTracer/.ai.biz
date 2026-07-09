# Directory Map

Canonical layout of the Business OS framework and project memory.

## Framework files (`.ai.biz/`)

Stored in the source Business OS. In thin-client mode they are read from `AGENT_OS_SOURCE`; in fat-client mode they are vendored inside the project.

```text
.ai.biz/
├── skills/              # Reusable agent skills (one folder per skill, each with skill.md)
├── standards/           # Binding business standards
├── concepts/            # Prompt-backed concept frameworks (e.g., BIZ-07, BIZ-08)
├── docs/                # Human-readable guides and adoption docs
├── templates/           # Bootstrap templates
│   ├── cursorrules.template
│   ├── bootstrap.sh
│   └── work/            # .work.biz/ skeleton templates
├── scripts/             # Change-safety and verification scripts
├── hooks/               # Git hooks (optional)
├── .github/             # CI workflows
├── README.md            # Framework overview
├── START_HERE.md        # Decision tree for operators
├── PROCESS_ROUTER.md    # Skill routing table
├── CONVENTIONS.md       # Framework conventions
└── CHANGELOG.md         # Framework changelog
```

## Project memory (`.work.biz/`)

Stored in the consumer project. Never copied from source; owned by the user and `biz-*` skills.

```text
.work.biz/
├── README.md                  # Project memory index
├── context/
│   └── HANDOFF.md             # Session handoff
├── plans/
│   ├── NEXT.md                # Tactical next actions
│   └── UNKNOWNS.md            # Open questions
├── strategy/                  # Strategy artifacts (canonical location per CONVENTIONS)
│   ├── certification.md
│   ├── one-pager.md
│   ├── target-buyer-profile.md
│   ├── channel-plan.md
│   └── linkedin-icp.md
├── pipeline/
│   ├── pipeline_tracker.md    # Deal flow tracker
│   └── outreach-cadence.md    # Outreach sequence and follow-up rules
├── plans/
│   ├── NEXT.md                # Tactical next actions
│   ├── UNKNOWNS.md            # Open questions
│   └── youtube-calendar.md    # YouTube publishing calendar (when YouTube is active)
├── research/
│   └── research_index.md      # Research index
├── strategy/                  # Strategy artifacts (canonical location per CONVENTIONS)
│   ├── certification.md
│   ├── one-pager.md
│   ├── target-buyer-profile.md
│   ├── channel-plan.md
│   ├── linkedin-icp.md
│   └── pricing.md             # Distilled price range
├── drafts/                    # In-progress drafts
├── reference/                 # Project reference files (PROJECTS.md, VISUAL_GUIDE.md, etc.)
└── touch-scope                # Declared change scope for current work
```

**Path rule:** `biz-strategy` writes strategy artifacts to `.work.biz/strategy/`. All other skills read from `.work.biz/strategy/`. Do not scatter strategy files under `.work.biz/plans/`.

## Protected project files

The agent must not modify these without explicit user approval:

- `package.json`
- `docker-compose*.yml`
- `Dockerfile.*`
- `.env*` (except `.env.example`)

## Resolution rule

When the source resolution section in `.cursorrules` says `AGENT_OS_SOURCE` is set, read framework assets from that path. Otherwise read them locally from the project's own `.ai.biz/`.
