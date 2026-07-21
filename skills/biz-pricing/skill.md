---
name: biz-pricing
description: >-
  Arrive at the right price for a given engagement based on value, effort,
  client budget, and competitive alternatives. biz-pricing set, biz-pricing status,
  biz-pricing revise.
---

# Skill: biz-pricing — Value-Based Pricing Decision

## Purpose

The price range "$20k–$80k" is too wide to use in a proposal. This skill helps you narrow it to the right number for a specific engagement — without leaving money on the table or pricing yourself out.

**Modes:**
- `biz-pricing set` — Run the Three-Angle Framework to arrive at a price for a new engagement.
- `biz-pricing status` — Report the current pricing strategy and last decision.
- `biz-pricing revise` — Update pricing based on market feedback, win/loss data, or changed circumstances.

---

## Core Principle

**Price is not a number. Price is a decision.** The right price balances three things:
1. **Value to the client** — what does solving this problem unlock for them?
2. **Effort to deliver** — how much of your time and attention will this take?
3. **Market alternatives** — what would the next-best option cost them?

If you only consider effort, you'll underprice. If you only consider value, you'll seem disconnected. Balance them.

---

## I0 - Gate pre-check

Before any mode executes, read `{WORK_BUSINESS_ROOT}/gates.md`.

- If the file does not exist, or `strategy-ready` is not PASS, stop and emit:

```text
BLOCKED (prerequisite): strategy-ready not certified
  Required state: {WORK_BUSINESS_ROOT}/gates.md with strategy-ready PASS
  Current state: <what was found>
  To proceed: run `@biz-strategy greenfield` then `@biz-strategy certify`
```

- Exception: `status` mode is read-only and runs without the gate.

---

## Modes

### biz-pricing set — Three-Angle Framework

Run this when you have a specific engagement to price.

#### Angle 1: Value-Based Floor

Start here. What is the problem costing them?

| Client Situation | Value Calculation | Implication |
|---|---|---|
| Platform enables $500k/year in revenue | Even $80k is 16% of first-year benefit | Price at the high end |
| Platform saves $5k/month in manual work ($60k/year) | Price up to $40k (8-month payback) | Price in the middle |
| Platform is "nice to have" (no clear ROI) | Low urgency — price is a risk | Price low or walk away |
| Compliance risk — they could be fined $100k+ without it | Price up to $50k (insurance value) | Price at the high end |

**Rule of thumb:** If your price is less than 20% of the first-year value they get, it's an easy sell.

#### Angle 2: Effort-Based Ceiling

What does it actually cost you to deliver?

| Factor | Adjustment |
|---|---|
| Clear scope, known tech | Lower risk — can price efficiently |
| Fuzzy scope, new tech | Add 20–30% buffer for unknowns |
| Tight timeline (crunch mode) | Add 25–50% for opportunity cost |
| Client will be high-touch | Add 15–25% for communication overhead |
| You want this as a case study | Can discount 10–20% for the right project |

**Floor calculation:** (Estimated weeks × your weekly minimum) + expenses.

At $3k–$5k/week minimum, a 10-week project floors at $30k–$50k. Never go below this — you'll resent the project and deliver poorly.

#### Angle 3: Market Alternatives

What would the buyer's next-best option cost?

| Alternative | Typical Cost | Your Advantage |
|---|---|---|
| Hire a full-time CTO ($180k/year + equity) | $15k/month + 1–2% equity | You're cheaper, faster, no equity |
| Hire an agency (4-person team) | $100k–$250k for same scope | You're cheaper, single POC, faster |
| Hire freelancers (3 different people) | $30k–$100k + you manage them | You're one person, no management cost |
| Build in-house with juniors | $10k/month salary + you train them | You're faster, no management overhead |

**Your unfair advantage:** You're one person who does what would take 2–3 people. Your price should be between the "cheap but risky" option and the "expensive but safe" option. You're the "safe and affordable" option.

---

### Price Tiers by Engagement Type

| Engagement Type | Price Range | When to Use |
|---|---|---|
| **Discovery / Diagnostic** | $3k–$8k | Fuzzy scope. 1–2 weeks. Deliverable: spec + architecture + fixed price for full build |
| **Phase 1 — MVP** | $10k–$25k | Core feature set only, 3–6 weeks. Clear exit point. |
| **Full platform build** | $30k–$80k | Full scope, 8–20 weeks. Your primary offer. |
| **Milestone extension** | $10k–$30k per phase | Add-on after Phase 1. Same rate, lower risk (client trusts you). |

---

### The Decision Tree

```
Does the client have a clear, quantified problem?
├── YES → Can you deliver the solution with known tech?
│   ├── YES → Price between (effort × 1.3) and (value × 0.3)
│   │         Whichever is higher. That's your number.
│   └── NO → Price a Discovery Phase first ($3k–$8k).
│             Then scope the full build.
└── NO (fuzzy problem)
    └── Price a Discovery Phase first. Never price a full build
        without understanding the problem.
```

---

### International Clients — Currency & Payment

- **Always quote in USD.** It's the global standard for cross-border services.
- **If the client asks for local currency:** Quote in USD, note the approximate equivalent, and clarify you'll invoice in USD. Exchange rate risk is theirs.
- **Payment methods by region:**
  - US/Canada: Stripe, Wise, ACH
  - Europe: Wise (EUR), Stripe
  - LatAm: Wise, Payoneer
  - Asia: Wise, Payoneer
  - Australia/NZ: Wise, Stripe
- **Payment fees:** Add 3% if the client insists on credit card (Stripe fee). Wire/Wise is 0.5–1%. Include in your pricing or pass through.
- **Tax handling:** Do not collect VAT/sales tax unless registered in the client's jurisdiction. Include: "Prices exclude applicable taxes."
- **Contract jurisdiction:** Use your own contract governed by your local law. If the client insists on theirs, read carefully — especially indemnification clauses.
- **Rule of thumb:** Price is the same regardless of where the client is. Do not discount for "cost of living" differences. You're selling judgment, not hours.

---

### What NOT to Do

- ❌ Don't name a price on the discovery call. "Let me write a proposal with a few options."
- ❌ Don't discount on the first objection. Reduce scope instead.
- ❌ Don't charge hourly. It caps your income and incentivizes you to work slow.
- ❌ Don't compete on price. You lose to $15/hour devs on Upwork.
- ❌ Don't accept less than 50% upfront.
- ❌ Don't quote in the client's local currency unless you have a local bank account in it.

---

### Price Range Evidence

The $20k–$80k range is consistent with published data on solo developer project pricing:

| Engagement Type | Industry Range (2026) | Source |
|---|---|---|
| Custom web app MVP | $15k–$75k | SideStackers, FreelanceDesk |
| SaaS MVP | $25k–$80k | FreelanceRateIQ, FreelanceDesk |
| Enterprise web app | $50k–$250k | FreelanceDesk, FullStack |
| Senior developer weekly (US) | $4k–$6.4k ($100–$160/hr) | SoloHourly, Arc.dev |

---

### Failure Modes

**Failure Mode: "I keep winning projects but barely making money"**

If you win every proposal but the work isn't worth the price:
1. You're under-pricing. Raise by 25% on the next proposal and see what happens.
2. Your effort estimates are too optimistic — add 20% buffer.
3. You're not accounting for communication overhead — add 15% for high-touch clients.
4. Re-read Angle 1 (value-based floor). If you're pricing based on effort alone, you're leaving money on the table.
5. Check: are you winning the projects you actually WANT, or the ones no one else wanted?

---

### Time Budget

| Step | Time | Notes |
|---|---|---|
| Gather information from discovery call | Already done | Use call notes |
| Angle 1: Value-based floor | 10 min | What's the problem costing them? |
| Angle 2: Effort-based ceiling | 10 min | What's your minimum viable price? |
| Angle 3: Market alternatives | 5 min | What would the next-best option cost? |
| Run decision tree | 5 min | Arrive at specific number |
| Check international/currency factors | 5 min | If applicable |
| **Total per pricing decision** | **35 min** | Do this once per proposal |

---

### Success Criteria

Your pricing decision is correct when:
- You can explain the price in 2 sentences (one for value, one for effort).
- The price is between your effort-based floor × 1.3 and value-based ceiling × 0.3.
- You're not tempted to discount before the client objects.
- You'd be happy to do the work at that price.

---

### biz-pricing status — Report Current Pricing Strategy

Output a summary of the last pricing decision including:
- Engagement type and scope
- Price quoted and tiers offered
- Angles applied (value, effort, market)
- Decision tree path taken
- Currency and payment terms
- Status (pending, quoted, won, lost, revised)

---

### biz-pricing revise — Update Pricing Based on Feedback

When market feedback, win/loss data, or changed circumstances demand a pricing revision:
1. **Review win/loss data** — Are you winning too easily (price too low)? Losing too often (price too high, or wrong segment)?
2. **Check competitive landscape** — Have market alternatives shifted? New entrants? New tools?
3. **Adjust tiers** — Raise or lower by 10–25% based on evidence, not instinct.
4. **Document the change** — Record old price, new price, and rationale.
5. **Test for 3 proposals** — Run the new pricing for at least 3 proposals before further revision.
