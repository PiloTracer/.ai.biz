# BIZ-08: LinkedIn ICP (Ideal Client Profile on LinkedIn)

## Purpose

`target-buyer-profile.md` defines who you sell to. This concept defines **how that buyer shows up on LinkedIn** — so hooks, formats, and posting cadence match the people who actually engage, comment, and inbound.

Run when LinkedIn is a primary channel, before a content challenge, or when posts get reach but not from the right audience.

**Invocation:** `@content-social icp` runs this analysis and saves the output.

## Questions to explore

1. **Job titles** — Who comments on posts like yours? (Founder, CTO, VP Eng, solo consultant, recruiter — recruiters = wrong signal)
2. **Feed language** — What phrases do they use in their own posts? (Mirror in hooks, not buzzwords)
3. **Engagement type** — What do they save vs like? (Frameworks/checklists → carousels; hot takes → text posts)
4. **Search behavior** — What would they search on LinkedIn? (Keywords for headline alignment via `@biz-brand`)
5. **Trust triggers** — Named tech, timelines, tradeoffs, or peer validation?
6. **Rejection triggers** — Buzzword bingo, vague thought leadership, obvious pitching?

## Output

Save to `.work.biz/strategy/linkedin-icp.md`:

```markdown
# LinkedIn ICP

## Target titles (comment, don't just lurk)
- Primary: ...
- Secondary: ...

## Vocabulary (use in hooks)
- Phrases they use: ...
- Phrases to avoid: ...

## Format preference
- Saves: carousel / checklist / framework
- Comments: story + specific lesson / contrarian take
- Ignores: generic motivation, engagement bait

## Hook calibration
- Example hook that would stop them: ...
- Example hook that attracts wrong audience: ...

## Profile alignment check
- Headline keyword overlap: yes/no
- Recent 3 posts match ICP: yes/no
```

## Reference

- Profile: `@biz-brand audit` / `overhaul`
- Content ops: `@biz-content challenge` / `plan` / `status`
- Drafts: `@content-social write linkedin` / `write linkedin carousel`
- Algorithm rules: `standards/20260701-PLATFORM-ALGORITHM-STANDARD.md` § LinkedIn
- Channel choice: BIZ-03 Channel Strategy (`concepts/channel-strategy/prompt.md`)
