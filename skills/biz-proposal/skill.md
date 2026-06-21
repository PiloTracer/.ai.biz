---
name: biz-proposal
description: >-
  Write a proposal with clear deliverables, milestones, pricing, and scope
  protection. biz-proposal write, biz-proposal review, biz-proposal status.
---

# Skill: biz-proposal — Business Proposal Writing

## Purpose
Turn a discovery call into a written proposal that the buyer can say "yes" to. The proposal must be specific enough to inspire confidence, flexible enough to accommodate negotiation, and structured enough to prevent scope creep.

## Modes

### write — Full Proposal Writing Process
Write a full 5-section proposal from discovery call notes.

### review — Checklist-Based Review
Run the review checklist before sending a proposal.

### status — Proposal Pipeline Report
Report the current pipeline of sent/pending/closed proposals.

---

## write — Proposal Writing Process

### 1. Gather What You Need

From the discovery call and your notes, extract:

- **The problem** (in their words, not yours)
- **The desired outcome** (measurable — "reconcile 10k transactions/day" not "better system")
- **Constraints** (budget range, timeline, tech preferences, team capabilities)
- **Decision criteria** (who decides, what matters most to them)
- **Competitive alternatives** (what happens if they don't hire you)

### 2. Write the 5-Section Proposal

Keep it to 2-3 pages max. Each section serves a specific purpose.

#### Section 1: The Problem (Your Understanding)

"Based on our conversation, here's what I understand: [2-3 sentences summarizing their situation in their language]."

**Purpose:** Shows you listened. If they disagree with this section, the rest doesn't matter.

#### Section 2: The Approach (How You Solve It)

"The approach I recommend: [2-4 sentences on architecture, methodology, tech decisions]. This is the same approach I used for [similar project], which [outcome]."

**Do:** Name specific technologies, architecture patterns, and deliverables.
**Don't:** Over-explain. They're buying trust, not a technical spec.

#### Section 3: Scope of Work (Deliverables)

**3-column scope table:**

| Deliverable | What's Included | Acceptance Criteria |
|---|---|---|
| **Phase 1 — Foundation** | Setup, auth, database schema, CI/CD | Deployed staging environment, admin can log in |
| **Phase 2 — Core Feature** | Main business logic, API, frontend | Feature handles [specific scenario] |
| **Phase 3 — Delivery** | Testing, deployment, documentation, handoff | Production live, handoff call complete |

**Explicitly list what's NOT included (scope-creep shield):**

> **Out of scope:** Mobile apps, third-party integrations not listed, ongoing maintenance beyond 30-day warranty, content creation, SEO, branding/design beyond standard UI.

When they ask for extras later, you point here.

#### Section 4: Investment

**Pricing options table:**

| Option | Scope | Price | Timeline |
|---|---|---|---|
| **Full build** (recommended) | All 3 phases | $XX,000 | X weeks |
| **Phase 1 only** | Foundation + core feature | $XX,000 | X weeks |
| **Custom** | As discussed | TBD | TBD |

**Format:** Fixed price per phase. "50% upfront, 25% at milestone 1, 25% at delivery."
**Never list an hourly rate.** Your proposal is for outcomes, not time.

#### Section 5: Next Steps

- Sign the proposal (accept the terms)
- Pay the deposit (50% via Wise/Stripe)
- Kickoff call (schedule within 1 week)
- First milestone delivery (X weeks from kickoff)

**Include a 7-day expiration** on the proposal. Creates gentle urgency and keeps you from chasing stale deals.

### 3. Pricing Guidance

- **For a clear-scope project:** Fixed price for the full engagement
- **For a fuzzy-scope project:** Fixed price for Phase 1 only; Phase 2-3 priced after Phase 1 completes
- **If they want a discount:** Don't discount. Reduce scope. Offer Phase 1 only at a lower price point
- **Deposit:** Always 50% upfront before any work begins
- **Payment method:** Wire / Wise (preferred), Stripe (credit card, costs you ~3%)

---

## review — Checklist Before Sending

- [ ] Does it reference specific things they said in the discovery call?
- [ ] Is the problem statement in their language, not yours?
- [ ] Are out-of-scope items explicitly listed?
- [ ] Is the price clearly stated, with payment terms?
- [ ] Is there an expiration date?
- [ ] Is there a clear next step?

---

## status — Proposal Pipeline Report

| Field | Value |
|---|---|
| Proposals this month | Count |
| Sent | Count |
| In review | Count |
| Closed-won | Count |
| Closed-lost | Count |
| Total pipeline value | $ |
| Stale (no response >10 days) | Count |

---

## Ongoing Maintenance — What to Offer After Delivery

| Option | Price | What's Included |
|---|---|---|
| **Warranty period** (30 days) | Free | Bug fixes for delivered scope only. No new features. |
| **Monthly retainer** | $1k-$3k/month | Server monitoring, security patches, bug fixes, <5 hrs/month support |
| **On-call retainer** | $500/month + $150/hr | Priority email response, hourly rate for actual work |
| **Ad-hoc** | $150/hr | No commitment — they email you when something breaks |

**Recommendation:** Offer a 30-day warranty (free) then a monthly retainer if they want ongoing support.

---

## No-Go Criteria — When to Say NO

**Do not take the project if:**
- The client can't clearly describe the problem (they're "exploring" — not ready)
- The budget is less than 50% of your effort-based floor
- They refuse 50% upfront payment
- The timeline is unrealistic and they won't negotiate
- They want to own all IP but pay less than full price
- Your gut says no

**Saying no gracefully:**
> "Based on what I'm hearing, I don't think I'm the right fit for this project. Here's what I'd suggest instead: [alternative approach or referral]. If things change, feel free to reach out."

---

## Contract Review — What to Watch for in Client Contracts

If the client wants to use their contract instead of yours:

1. **Read every clause.** Don't assume it's standard. Pay special attention to:
   - Indemnification (are you liable for their business losses?)
   - IP assignment (when do they own your work? Only after payment?)
   - Termination for convenience (can they fire you with 1 day notice?)
   - Payment terms (net 90 is not acceptable)
2. **Redline and negotiate.** You can change contract terms — they're not set in stone.
3. **Protect your liability:** Never accept unlimited liability. Cap it at the contract value.
4. **If in doubt:** Get a lawyer review. One hour of legal time can save you months of pain.

---

## Non-Negotiables (in any contract)

- 50% upfront (no exceptions)
- Milestone-based payments (not monthly)
- Scope of work is fixed (changes = change order)
- Liability cap = contract value
- IP transfers only after full payment

---

## Time Budget

| Step | Time | Notes |
|---|---|---|
| Gather info from discovery call | Already done | Should have notes ready |
| Write Section 1: Problem | 10 min | In their words |
| Write Section 2: Approach | 10 min | Architecture + methodology |
| Write Section 3: Scope | 20 min | Deliverables + out-of-scope list |
| Write Section 4: Investment | 10 min | Options + payment terms |
| Write Section 5: Next Steps | 5 min | Expiration + timeline |
| Review before sending | 10 min | Checklist above |
| **Total per proposal** | **1-1.5 hrs** | Can be done in one sitting |

---

## Failure Modes

If proposals go out but never close:

1. **The problem statement is wrong.** If they don't immediately agree with Section 1, the rest doesn't matter. Check: are you using THEIR words or YOUR words?
2. **The price is too high for the perceived value.** You may be pricing off effort instead of value. Price off value, not hours.
3. **The risk is too high.** They're afraid to commit. Offer a smaller Phase 1 (lower commitment, same quality).
4. **Your proposal is too long.** 3 pages max. If it's longer, they won't read it. Cut half.
5. **You didn't address the real objection.** Ask "is there anything in the proposal that didn't make sense or felt off?"
6. **The follow-up is wrong.** Don't ask "did you have a chance to review?" Ask "is there anything that didn't make sense?"
7. **You're sending proposals to unqualified prospects.** If you've sent 5+ proposals with zero closes, the problem is pre-proposal qualification, not the proposal itself.

---

## Success Criteria

A proposal is ready to send when:
- The problem statement matches what the client told you (they'll feel heard)
- Out-of-scope items are explicitly listed (this is your scope-creep shield)
- The price is between your effort-based floor × 1.3 and value-based ceiling × 0.3
- There's a 7-day expiration date
- You'd say yes if you received this proposal
