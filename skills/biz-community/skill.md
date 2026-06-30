---
name: biz-community
description: >-
  Find and evaluate communities across Reddit, Instagram, LinkedIn, Facebook,
  Indie Hackers, and niche platforms. Engage without selling. Convert
  relationships into pipeline. For generating platform-specific content FOR
  those communities, use @content-social write. biz-community find,
  biz-community engage, biz-community status.
---

# biz-community

**Canonical path:** `.ai.biz/skills/biz-community/skill.md`

**Purpose:** Find the right communities, engage with genuine value, and build relationships that convert into pipeline — no cold outreach, no pitching strangers.

**Content generation:** This skill covers community *discovery and engagement*. For creating posts, captions, and content calibrated FOR these communities, use `@content-social write <platform> - <topic>`. The two skills compose: `biz-community find` finds where to post, `content-social write` produces what to post.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@biz-community find reddit - <topic/keyword>` | Find subreddits relevant to the topic |
| `@biz-community find instagram - <topic/keyword>` | Find Instagram accounts, hashtags, and communities to follow/engage |
| `@biz-community find linkedin - <topic/keyword>` | Find LinkedIn creators, groups, and hashtags in the space |
| `@biz-community find facebook - <topic/keyword>` | Find Facebook Groups and pages relevant to the niche |
| `@biz-community find` | Find communities across all platforms based on project strategy |
| `@biz-community engage` | Guide for daily engagement — what to do, where, how to track |
| `@biz-community status` | Read-only: report which communities are being engaged and pipeline status |

**Default:** `find` if no verb matches.

---

## I0 — Find the right communities

Load project context first: read `.work.biz/strategy/target-buyer-profile.md` and `.cursorrules` to understand who you're trying to reach and what they care about. Community fit is only as good as your understanding of the buyer.

---

### I0-R — Reddit: Subreddit Discovery

#### Subreddit search strategy

| Method | How to execute | What you learn |
|--------|---------------|----------------|
| **Direct search** | Search `reddit.com/search?q=<keyword>` and browse the "Communities" tab | Subreddit name, member count, description, activity level |
| **Related subreddits** | Check the sidebar of any found subreddit for "Related Communities" | Adjacent communities with overlapping audiences |
| **Crosspost analysis** | In a found subreddit, note where top posts are crossposted from/to | Which other subs share this audience |
| **User overlap mapping** | Check top contributors' post history to see what other subs they're active in | Where the community's power users spend time |
| **Subreddit directory** | Browse r/findareddit and r/ListOfSubreddits | Curated lists organized by topic |
| **Google site search** | `site:reddit.com <topic> "subreddit"` | Subreddits that don't appear in Reddit's own search |

#### Subreddit evaluation criteria

For each candidate subreddit, evaluate:

| Criteria | What to check | Green flag | Red flag |
|----------|---------------|------------|----------|
| **Active membership** | Posts per day, comments per post | 10+ posts/day with 5+ comments each | < 3 posts/day or 0-comment posts dominating |
| **Community health** | Tone of comments, moderator activity | Constructive discussion, active mods removing spam | Toxic comments, unmoderated spam, memes dominating |
| **Buyer presence** | Do posts reflect the target buyer's problems? | 5+ posts in the past month that match buyer pain points | Zero posts relevant to the target buyer |
| **Self-promotion tolerance** | Subreddit rules + behavior when people self-promote | Clear rules, consistent enforcement | Ban-on-sight for any self-reference; or spam pit with no moderation |
| **Post type compatibility** | What formats get upvoted? | Self-posts (text) welcomed; discussion-driven | Link-only; images/videos only; meme culture incompatible with professional content |
| **Size-quality balance** | Member count vs engagement quality | 5k-500k members with active discussion | Under 1k (too small); over 2M (too noisy, hard to get visibility without being a power user) |

#### Subreddit classification

| Category | Description | Examples (illustrative) | Strategy |
|----------|-------------|------------------------|----------|
| **Primary niche sub** | Directly about the target buyer's domain | r/SaaS, r/webdev, r/startups | Daily engagement; post 1x/week after 2 weeks of comment-only presence |
| **Adjacent interest sub** | Related field where buyer spends time but not explicitly about their work | r/productivity, r/digitalnomad, r/Entrepreneur | Weekly engagement; post only after 4+ weeks of commenting |
| **Practice sub** | Low-stakes community to build Reddit posting muscle | r/casualconversation, smaller niche subs | Post and comment freely to learn Reddit culture without risking main communities |
| **Research sub** | Where buyer vents, asks naive questions, reveals unfiltered pain | r/smallbusiness, r/freelance, industry-specific | Read-only or comment-only. Never post. Pure intelligence gathering. |

---

### I0-I — Instagram: Account & Community Discovery

#### Instagram discovery methods

| Method | How to execute | What you learn |
|--------|---------------|----------------|
| **Hashtag exploration** | Search key hashtags in the project's niche. Browse "Top" and "Recent" tabs. | Which accounts dominate the space. What content formats perform. |
| **Competitor follower analysis** | On a competitor's profile, check "Suggested for you" accounts. Browse their followers. | Who the audience already trusts. Adjacent accounts to engage with. |
| **Explore page training** | Search and engage with niche content. Instagram's algorithm will surface more. | Emerging creators, trending formats, what the algorithm favors. |
| **Comment section mapping** | Read comments on top posts in niche hashtags. Note who comments — check their profiles. | Active community members. People looking for solutions (engagement targets). |
| **Similar account suggestions** | Instagram's native "Similar Accounts" feature on any profile page. | Horizontal discovery without manual searching. |
| **Collaboration detection** | Note which accounts tag each other, appear in each other's stories, co-host lives. | Community clusters. Who influences whom. |

#### Instagram community evaluation criteria

| Criteria | What to check | Green flag | Red flag |
|----------|---------------|------------|----------|
| **Audience overlap** | Do the account's followers match the target buyer profile? | Content comments reflect buyer language and pain points | Engagement is from wrong demographic or bots |
| **Engagement rate** | Likes + comments relative to follower count | 2-5% engagement rate on posts | < 1% (dead audience) or > 10% (likely fake engagement) |
| **Content quality** | Is the content something the project could credibly match or exceed? | Well-produced but with gaps the project could fill | Either far beyond the project's capacity or too low-quality to gain from association |
| **Posting consistency** | How often do they post? | 3-7x/week — active but not spammy | < 1x/week (dormant) or > 3x/day (noise) |
| **Community responsiveness** | Do they reply to comments? Do they engage with other accounts? | Regular comment replies, story interactions | Zero community interaction — broadcast only |

#### Instagram engagement hierarchy

| Priority | Account type | Action |
|----------|-------------|--------|
| **1 (highest)** | Target buyers who are active commenters | Reply to their comments on others' posts. Engage their content. |
| **2** | Peer creators in adjacent niches | Comment meaningfully. Build mutual engagement relationships. |
| **3** | Large accounts in the niche | Comment insightfully on their posts. High visibility. Don't expect reciprocation. |
| **4** | Aspirational / out-of-reach accounts | Follow, learn, reference their content in your posts. |

---

### I0-L — LinkedIn: Creator & Group Discovery

#### LinkedIn discovery methods

| Method | How to execute | What you learn |
|--------|---------------|----------------|
| **Content search** | Search relevant industry terms. Filter by "Posts" and sort by "Top." | Who drives conversation. What topics get engagement. |
| **Hashtag following** | Follow 3-5 niche hashtags. Browse the feed they generate. | Active posters, emerging topics, content patterns. |
| **Creator identification** | For each relevant hashtag, note the 5-10 most consistent, highest-engagement posters. | Who to follow and engage. Who not to replicate (they already own the space). |
| **Group search** | Search for Groups by industry keyword. Review group description, rules, member count, post frequency. | Which Groups are worth joining. Where target buyers congregate. |
| **"People also viewed"** | On any relevant profile, check the "People also viewed" sidebar. | Adjacent professionals. Referral sources. Potential collaborators. |
| **Mutual connection mapping** | If the operator has LinkedIn connections, check their networks for target buyers. | Warm-path introductions. |

#### LinkedIn Group evaluation criteria

| Criteria | Green flag | Red flag |
|----------|------------|----------|
| **Member quality** | Decision-makers, practitioners, target buyer titles visible | Recruiters, salespeople, "I help people..." bios dominating |
| **Post quality** | Discussion threads with substantial comments. Questions getting thoughtful answers. | Link-drops with zero comments. "I agree!" one-word responses. |
| **Moderation** | Clear rules. Spam removed. Active admin presence. | Open posting with no oversight. GDPR/recruiter spam. |
| **Activity level** | 5-20 new posts/day. Existing posts get comments within hours. | < 2 posts/day (dead) or > 50/day (impossible to get visibility). |
| **Self-promotion rules** | Explicitly stated. Promo day threads or zero tolerance — either is fine as long as clear. | Unstated rules that lead to unpredictable removal. |

---

### I0-F — Facebook: Group & Page Discovery

#### Facebook Group discovery methods

| Method | How to execute | What you learn |
|--------|---------------|----------------|
| **Facebook search** | Search `<topic> group` or `<industry> community` on Facebook. Filter by "Groups." | Direct group discovery. Member count, privacy setting, description. |
| **Suggested Groups** | Facebook's "Suggested for You" section in the Groups tab. | Algorithmic discovery based on profile and existing group membership. |
| **Competitor group membership** | Check the "Groups" section of competitor or peer profiles (if public). | Which groups your peers find valuable. |
| **Related Groups** | On any Group page, check "Related Groups" or "Suggested Groups" sections. | Adjacent communities. |
| **Event-based discovery** | Search for events in the niche. Check which Groups promote or sponsor them. | Active, organized communities. |
| **Local discovery** (if geography-relevant) | Search `<city/region> <industry> group` for local business communities. | Geographic-filtered communities. |

#### Facebook Group evaluation criteria

| Criteria | What to check | Green flag | Red flag |
|----------|---------------|------------|----------|
| **Privacy level** | Public vs Private | Private groups typically have higher-quality discussion and stronger community norms | Public groups often attract spam |
| **Member count** | Group size | 500-50,000 members. Mid-size often has best engagement-to-visibility ratio. | Under 200 (too small) or over 500,000 (low visibility, diluted) |
| **Post approval** | Are posts moderated before appearing? | Moderated posts = quality control, no spam | But: if approval takes > 24 hours, timing-dependent content is impossible |
| **Self-promotion rules** | Explicit rules about promotion, links, offers | Clear, enforced rules. "Promo Tuesday" threads are common and work. | No rules stated — unpredictable. Or: rules forbid any mention of your profession entirely. |
| **Engagement patterns** | What gets comments? What gets ignored? | Questions, case studies, and "lessons learned" posts perform best. Direct advice requests get responses. | Only links and announcements get engagement (content farm). BuzzFeed-style content dominating. |
| **Moderator presence** | Do admins participate? Do they enforce rules? | Active moderators who engage as members | Absent moderators + growing spam = group in decline |

---

### I0-A — Additional platforms

| Platform | Where to go | Best for | Discovery approach |
|----------|-------------|----------|--------------------|
| **Indie Hackers** | `indiehackers.com` — product launches, founder stories, revenue transparency | B2B SaaS, bootstrapped founders, productized services | Browse "Products" and "Posts." Engage in comment threads. |
| **MicroConf** | `microconf.com` community / Slack | B2B SaaS founders, $10k+ MRR, high-signal | Join Slack. Participate before posting. |
| **Discord** | Niche Discord servers via Disboard.org or industry blogs | Developer tools, gaming-adjacent tech, younger demographics | Lurking first is mandatory. Server culture varies wildly. |
| **Slack communities** | Industry Slack workspaces (e.g., ProductLed, RevGenius, design communities) | B2B professionals, SaaS operators | Intro channel first. Follow workspace rules strictly. |
| **X (Twitter)** | Follow relevant accounts, engage in replies, build lists | Tech, media, VC-adjacent, real-time conversation | Lists > timeline for signal. Reply value > tweet volume. |

---

### Community fit checklist (universal)

Before committing to any community, verify:

- [ ] Target buyer hangs out there (confirmed by browsing 20+ threads/posts)
- [ ] Active moderation (no spam pit, rules enforced)
- [ ] You can contribute without mentioning your product for the first 2-4 weeks
- [ ] Post frequency and format match what the project can sustain
- [ ] At least 3 specific content ideas emerged during the evaluation browse
- [ ] Community rules explicitly or implicitly permit the content approach you plan

---

## I1 — Engagement rules

1. **Answer, don't pitch.** If someone asks a question your offer answers — explain the *concept*, recommend *any* tool that solves it, mention yours last if relevant.
2. **Add value first.** Every comment should stand alone as useful even if the reader never visits your profile.
3. **10+ meaningful answers / week.** Not one-liners. Paragraphs that show expertise.
4. **Never DM out of the blue.** Only DM after a thread interaction where the person invites deeper conversation.
5. **Track every engagement** in your pipeline tracker: platform, thread link, response, outcome.
6. **Platform-native voice.** Your Reddit comments should sound like a Redditor, not a LinkedIn thought leader cross-posting. Read the room before writing.
7. **Post before you engage (on content-heavy platforms).** On Instagram and LinkedIn, have 5-10 posts on your profile before heavy engagement — people check who's talking.

---

## I2 — Time budget

| Activity | Time |
|----------|------|
| Find & evaluate communities (one-time per platform) | 45-90 min |
| Browse & find threads (daily) | 10-15 min |
| Write responses (3 sessions/week) | 30-40 min each |
| Review what worked (weekly) | 10 min |
| **Total (steady-state)** | **2-3 hrs / week** |

---

## I3 — Convert without selling

1. Someone replies "thanks, that helped" → offer "happy to dig deeper, DM me if you want"
2. Someone asks "what tool do you use for X" → name your tool + honest trade-offs
3. Someone comments on your answer → engage back, build thread rapport
4. Thread goes well → "I wrote a deeper guide here [link]" (1-2x/month max)

**Pipeline conversion signal:** Someone who engages with you in 3+ threads across 2+ weeks is ready for a DM conversation.

---

## Platform-specific engagement notes

### Reddit engagement
- Sort by "New" to find threads before they blow up. Early valuable comments get disproportionate visibility.
- Your comment history is public. Anyone evaluating you will read your last 20 comments. Keep them consistently valuable.
- Crosspost cautiously: only if the content genuinely belongs in both communities. Read both subreddits' rules.
- Gold/upvotes are not the metric. Profile visits and DM requests are.

### Instagram engagement
- Reply to Stories (not just posts) — DMs from Story replies build deeper connections.
- Comment within 30 minutes of a target account posting. Early comments get visibility.
- Save and share content from target accounts. Signals interest and builds algorithmic relationship.
- Use Notes to redirect your audience to your new content.

### LinkedIn engagement
- Comment on posts from target-audience creators within the first hour. Early engagement drives post visibility.
- Leave thoughtful comments, not "Great post!" — the quality of your comments is your portfolio.
- Engage with people who comment on your posts. Every commenter is a potential relationship.
- Follow hashtags, not just people. Engage with posts that appear in hashtag feeds.

### Facebook engagement
- In Groups: answer questions thoroughly. A single great answer in a 50k-member Group can drive 10+ profile views and DMs.
- Don't post in more Groups than you can sustain quality engagement in. 2-3 Groups deeply > 10 Groups shallowly.
- Watch for "looking for recommendations" posts — these are highest-intent and lowest-competition.
- Respond to comments on your Group posts within 1-2 hours to keep the thread active.

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | At least 3 communities identified as high-fit per platform (if applicable) | |
| 2 | 10+ meaningful answers posted this week | |
| 3 | No pitch-first comments (audit last 10) | |
| 4 | Engagement tracked in pipeline tracker | |
| 5 | At least 1 inbound conversation started | |

**Next:** `@content-social write <platform> - <topic>` to create content for the communities found. `@biz-pipeline-diagnosis run` — check if community engagement is feeding your pipeline.

---

## Related skills

| Skill | When |
|-------|------|
| `@content-social write` | Generate platform-native posts for communities you've found |
| `@content-social research` | Research trending topics before writing for a community |
| `@content-writing write` | Draft long-form content to adapt for community posts |
| `@biz-pipeline-diagnosis run` | Check if community engagement is converting to pipeline |
| `@biz-strategy certify` | Ensure target buyer is defined before committing to communities |

---

*Based on community playbook principles: show up, help, repeat.*
