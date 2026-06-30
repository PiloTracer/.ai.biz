# UNKNOWNS — Open Questions & Blocked Decisions

| # | Question | Impact | Owner | Status |
|---|----------|--------|-------|--------|
| 1 | Should the `.tmp/*.skill` portable archives be replaced by a generator script (e.g., a `scripts/pack-skill.sh`) so they can't drift from `skills/`? | Low | framework | Open |
| 2 | Are the new generative skills' "technology tilt" gates too strict for non-tech-host projects (e.g., a pure marketing repo)? | Medium | framework | Open — to revisit after first non-tech adoption |
| 3 | Should `content-writing` carry its own SEO keyword research mode, or always source keywords from `.work.biz/strategy/*`? | Low | framework | Open |
| 4 | Should `content-social` platform research require live web fetch capability (Reddit API, Instagram), or is pattern-based research sufficient? | Medium | framework | Open — currently uses pattern-based research with explicit "unable to perform live research" fallback |
| 5 | Should `biz-community` split into platform-specific sub-skills if it keeps growing (currently ~280 lines covering 6+ platforms)? | Low | framework | Open — monitor as platform-specific engagement rules grow |
