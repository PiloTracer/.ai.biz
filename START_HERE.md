# START HERE — Business operator decision tree

**Purpose:** Answer one question fast: *"What do I do right now for my business?"*

**Read this file when you sit down, are interrupted, or feel lost.**

**Rule:** If something below contradicts a `skill.md` or a binding standard, the **skill / standard wins**.

**Paths:** In an project repo, prefix with `.ai.biz/`. When Business OS **is** the git root (this repository), use `START_HERE.md`, `skills/`, `standards/` with no prefix.

---

## 0. Three things to know

1. **Truth before speed.** The agent rules in `.cursorrules` (Core Principles 1–7) are non-negotiable. Never claim "good plan" without verifying the logic.
2. **Skills do the orchestration. Standards bind the decisions.** You almost never need to read all at once — pick what your task needs.
3. **.ai.biz vs .work.biz:** skills, standards (`.ai.biz/`) vs business plans, pipeline, HANDOFF (`.work.biz/`).

---

## 1. Decision tree

```text
┌──────────────────────────────────────────┐
│  Where am I right now?                    │
└──────────────────────────────────────────┘
       │
       ├── "Bootstrap / empty .work.biz"  ──► `@biz-bootstrap init` · `bash .ai.biz/templates/bootstrap.sh`
       │
       ├── "I just opened the project / lost"  ──► §2 Resume / orient
       │
       ├── "I want to plan my strategy"         ──► §3 Strategy
       │
       ├── "I want to fix my brand / online presence"  ──► §4 Brand
       │
       ├── "I want to publish content"           ──► `@biz-content publish`
       │
       ├── "I have a sales conversation"         ──► §5 Sales
       │
       ├── "I need to review my progress"        ──► `@biz-review weekly`
       │
       ├── "I'm closing for the day"             ──► §6 Close
       │
       ├── "I don't know which skill to use"     ──► `@biz-director <describe what you want>`
│
└── "I want to understand the system"     ──► §7 Reading order
```

---

## 2. Resume / orient (≤5 minutes)

| Need | Command |
|------|---------|
| **Where am I / what's next?** | `@session-biz status` + `.work.biz/context/HANDOFF.md` + `.work.biz/plans/NEXT.md` |
| One-paragraph status (no writes) | `@session-biz status` |
| Are we still in strategy or executing? | `@biz-strategy status` **or** `@biz-review status` |

---

## 3. Plan your strategy

| You need… | Run |
|-----------|-----|
| To start a brand-new business plan | `@biz-strategy greenfield` |
| Agent should ask questions until it truly understands your situation | `@biz-strategy probe` |
| To check if strategy is done | `@biz-strategy status` then `@biz-strategy certify` |
| To set pricing for an engagement | `@biz-pricing set` |
| To test if your offer/niche works | `@biz-market-validate test` |

---

## 4. Fix your brand & online presence

| You need… | Run |
|-----------|-----|
| Audit current LinkedIn, website, brand | `@biz-brand audit` |
| Overhaul LinkedIn profile | `@biz-brand overhaul` |
| Publish a LinkedIn post or article | `@biz-content publish` |
| Engage in communities | `@biz-community engage` |

---

## 5. Sales & conversion

| You need… | Run |
|-----------|-----|
| Prepare for a discovery call | `@biz-discovery prepare` |
| Run a discovery call | `@biz-discovery run` |
| Price the engagement | `@biz-pricing set` |
| Write a proposal | `@biz-proposal write` |
| Handle an objection | `@biz-objections handle` |
| Ask for referrals | `@biz-referrals ask` |
| Diagnose why nothing is moving | `@biz-pipeline-diagnosis run` |

---

## 6. Close for the day

```text
@session-biz close                      # safe default — drafts message, no commit
@session-biz close commit               # commits with drafted message
```

---

## 7. Reading order

| Step | File | Why |
|------|------|-----|
| 1 | `.cursorrules` | Identity, core principles, protected items |
| 2 | `.ai.biz/README.md` | Canonical map |
| 3 | `.work.biz/context/HANDOFF.md` | Last session state |
| 4 | `.work.biz/plans/NEXT.md` | Tactical next action |
| 5 | `.ai.biz/skills/README.md` | Registered skills |
| 6 | The specific `skill.md` you're invoking | Verbs and gates |
| 7 | The specific standard | Binding rules |

---

## 8. Anti-patterns to refuse

- Claiming PASS when analysis shows gaps
- Modifying protected files without explicit approval
- AI attribution markers in any artifact
- Logging real client data in planning docs
- Inventing a resolution for a blocker — pause and ask
