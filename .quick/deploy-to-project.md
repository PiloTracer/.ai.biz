# Deploy .ai.biz (Business OS) Into a Target Project

Two modes: **fat-client** (`deploy-files` — vendored `.ai.biz/`) and **thin-client** (`deploy-basic` — `.cursorrules` + `.work.biz/` only; skills load from `$AGENT_OS_SOURCE`).

**No local `opencode.json`.** Register via parent Agent OS (`.ai/opencode.json`) when co-installed.

## Thin-client

```bash
bash /path/to/.ai.biz/scripts/deploy-basic.sh /path/to/target
bash /path/to/.ai.biz/scripts/deploy-basic.sh --status /path/to/target
bash /path/to/.ai.biz/scripts/deploy-basic.sh /path/to/target --update
```

```text
@deploy-basic - /path/to/target
@deploy-basic update
@deploy-basic status
```

## Fat-client

```bash
bash /path/to/.ai.biz/scripts/deploy-files.sh /path/to/target
bash /path/to/.ai.biz/scripts/deploy-files.sh /path/to/target --update
bash /path/to/.ai.biz/scripts/deploy-files.sh /path/to/target --force
```

In-place scaffold (`.ai.biz/`, `.work.biz/`, `.cursorrules`):

```bash
cd /path/to/target && bash /path/to/.ai.biz/scripts/deploy-files.sh .
```

## Full repo

```text
@deploy-repo clone - /path/to/destination
@deploy-repo archive - /path/to/destination
```

## Next steps

```text
@session-biz start
@biz-strategy greenfield
```

Verify: `bash scripts/framework-verify.sh`
