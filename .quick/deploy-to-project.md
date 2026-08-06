# Deploy .ai.biz (Business OS) Into a Target Project

Two modes: **fat-client** (`biz-deploy-files` — vendored `.ai.biz/`) and **thin-client** (`biz-deploy-basic` — `.cursorrules` + `.work.biz/` only; skills load from `$AGENT_OS_SOURCE`).

**No local `opencode.json`.** Register via parent Agent OS (`.ai/opencode.json`) when co-installed.

## Thin-client

```bash
bash /path/to/.ai.biz/scripts/biz-deploy-basic.sh /path/to/target
bash /path/to/.ai.biz/scripts/biz-deploy-basic.sh --status /path/to/target
bash /path/to/.ai.biz/scripts/biz-deploy-basic.sh /path/to/target --update
```

```text
@biz-deploy-basic - /path/to/target
@biz-deploy-basic update
@biz-deploy-basic status
```

## Fat-client

```bash
bash /path/to/.ai.biz/scripts/biz-deploy-files.sh /path/to/target
bash /path/to/.ai.biz/scripts/biz-deploy-files.sh /path/to/target --update
bash /path/to/.ai.biz/scripts/biz-deploy-files.sh /path/to/target --force
```

In-place scaffold (`.ai.biz/`, `.work.biz/`, `.cursorrules`):

```bash
cd /path/to/target && bash /path/to/.ai.biz/scripts/biz-deploy-files.sh .
```

## Full repo

```text
@biz-deploy-repo clone - /path/to/destination
@biz-deploy-repo archive - /path/to/destination
```

## Next steps

```text
@biz-session start
@biz-strategy greenfield
```

Verify: `bash /path/to/.ai.biz/scripts/framework-verify.sh`
