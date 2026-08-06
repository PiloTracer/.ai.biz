# START HERE — Business operator decision tree

**Purpose:** Answer one question fast: *"What do I do right now for my business?"*

**Read this file when you sit down, are interrupted, or feel lost.**

**Rule:** If something below contradicts a `skill.md` or a binding standard, the **skill / standard wins**.

**Paths:** In a project repo, prefix with `.ai.biz/`. When Business OS **is** the git root (this repository), use `START_HERE.md`, `skills/`, `standards/` with no prefix.

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
        ├── "I want to publish content"           ──► `@biz-content publish` · `@biz-youtube publish`
        │
        ├── "I want social content for Reddit, LinkedIn (posts / carousels / native video), Instagram, X, Facebook, YouTube"  ──► `@biz-social write - <platform>`
        │
        ├── "I want to write an article / post / case study / email"  ──► `@biz-writing write - <topic>`
       │
       ├── "I want business / venture / pivot ideas"  ──► `@biz-ideas generate - <domain>`
       │
       ├── "I want product / service / SaaS concepts"  ──► `@biz-products generate - <space>`
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
| **Where am I / what's next?** | `@biz-session status` + `.work.biz/gates.md` + `.work.biz/context/HANDOFF.md` + `.work.biz/plans/NEXT.md` |
| Which gates have I passed? | Read `.work.biz/gates.md`, or run `@biz-review status` to reconcile it |
| One-paragraph status (no writes) | `@biz-session status` |
| Free-text request / don't know skill | `@biz-director - <describe what you want>` · `@x-director - <describe what you want>` (cross-framework) |
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
| Publish / plan YouTube videos | `@biz-youtube publish` · `@biz-youtube plan` |
| Audit YouTube channel branding | `@biz-brand audit` (YouTube section) |
| Engage in communities | `@biz-community engage` |

---

## 4b. Generate & write (no gate required)

These project-aware generative skills run any time — even before bootstrap. They load the host project's own context automatically; output improves once strategy/brand are defined.

| You need… | Run |
|-----------|-----|
| Write an article, post, case study, landing page, email, thread | `@biz-writing write - <topic>` |
| Build a content calendar / topic plan | `@biz-writing plan - <30 days>` |
| Repurpose one piece into multiple formats | `@biz-writing repurpose - <source>` |
| Critique a draft | `@biz-writing audit - <draft or path>` |
| Research trending topics/gaps on a social platform | `@biz-social research - <platform>` |
| Write platform-native social content (incl. LinkedIn video / YouTube scripts / Shorts) | `@biz-social write - <platform>` |
| Repurpose one asset into multiple platform formats | `@biz-social repurpose - <source>` |
| Plan a cross-platform social content calendar | `@biz-social plan - <30 days>` |
| Build a YouTube publishing calendar / 30-day challenge | `@biz-youtube plan` · `@biz-youtube challenge` |
| Business / venture / pivot ideas | `@biz-ideas generate - <domain>` |
| Stress-test one idea (try to kill it) | `@biz-ideas stress - <idea>` |
| Pivot directions from current business | `@biz-ideas pivot - <situation>` |
| Product / service / SaaS / add-on concepts | `@biz-products generate - <space>` |
| Extension concepts for an existing product | `@biz-products extend - <product>` |
| Scope a minimal MVP for one concept | `@biz-products scope - <concept>` |
| Evaluate one concept (Go/Refine/Kill) | `@biz-products audit - <concept>` |

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
@biz-session close                      # safe default — writes HANDOFF/NEXT/UNKNOWNS to .work.biz/, no git
@biz-session close commit               # + scoped git commit of .work.biz/ (incl. new untracked files)
@biz-session close push                 # + scoped commit, then git push
@biz-session close commit push          # all three: write state, scoped commit, push
```

---

## 7. Reading order

| Step | File | Why |
|------|------|-----|
| 1 | `.cursorrules` | Identity, core principles, protected items |
| 2 | `README.md` | Canonical map |
| 3 | `.work.biz/gates.md` | Which readiness gates are PASS |
| 4 | `.work.biz/context/HANDOFF.md` | Last session state |
| 5 | `.work.biz/plans/NEXT.md` | Tactical next action |
| 6 | `skills/README.md` | Registered skills |
| 7 | The specific `skill.md` you're invoking | Verbs and gates |
| 8 | The specific standard | Binding rules |

---

## 8. FAQ

| Question | Answer |
|----------|--------|
| Free-text business request / don't know the skill? | `@biz-director - <describe what you want>` · `@x-director - <describe what you want>` (cross-framework) |

---

## 9. Anti-patterns to refuse

- Claiming PASS when analysis shows gaps
- Hand-editing a gate to PASS in `.work.biz/gates.md` instead of running the promoting skill
- Leaving a gate at PASS after its evidence changed (amend or re-audit demotes it)
- Modifying protected files without explicit approval
- AI attribution markers in any artifact
- Logging real client data in planning docs
- Inventing a resolution for a blocker — pause and ask
