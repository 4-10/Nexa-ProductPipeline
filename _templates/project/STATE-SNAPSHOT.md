# {{PROJECT_NAME}} — State snapshot

What's *installed and configured* for this project. Different from
`CURRENT-STATE.md`, which captures *what's happening right now*.
This file is structural and slow-moving; it changes when you spin
something new up or change a version, not every working session.

> Tip: if information here changes weekly, it probably belongs in
> `CURRENT-STATE.md`, not here.

---

## Tech stack

| Component | Version | Source / Repo | Notes |
|---|---|---|---|
| {{e.g., Runtime}} | {{e.g., Python 3.11}} | {{path or URL}} | |
| {{e.g., Framework}} | {{e.g., FastAPI 0.115}} | | |
| {{e.g., Database}} | {{e.g., Postgres 16}} | | |
| {{e.g., Cache}} | {{e.g., Redis 7}} | | |
| {{e.g., Build tool}} | {{e.g., Docker 24.0}} | | |

## Environment

| Setting | Value |
|---|---|
| {{e.g., Repo location}} | `{{path}}` |
| {{e.g., Branch}} | `{{branch}}` |
| {{e.g., Local URL}} | `{{e.g., http://localhost:8080}}` |
| {{e.g., Credentials reference}} | {{e.g., 1password vault X}} |

## Running services / processes / containers

> Update when you add or remove a service. Specific to this
> project's deployment, not the whole machine.

- `{{service-name}}` — {{purpose}} — listens on `{{port or path}}`
- ...

## Build / run / test commands

> The bare-minimum command set someone needs to actually use this
> project. Be specific — full paths, exact flags.

```
# Build
{{command}}

# Run locally
{{command}}

# Run tests
{{command}}

# Deploy (if applicable)
{{command}}
```

## Tuning / configuration that matters

> Non-default settings or knobs that someone reading the code
> wouldn't otherwise know about. Specific values + the reason
> they're set that way.

- **{{setting name}} = {{value}}** — {{why}}

## What's customized vs. upstream / out-of-the-box

> If you forked something, list what you changed and why. Helps
> when upstream updates surface and you need to decide whether to
> pull them.

- **{{fork name}}** at `{{path or URL}}` — diverged from `{{upstream}}`
  for reasons documented in `DECISION-LOG.md` entry `{{date}}`.

---

## Maintenance

Update this file whenever:

- You change a version (runtime, framework, container).
- You add or remove a running service.
- You change a non-trivial configuration value.
- You diverge from an upstream you previously tracked closely.

A stale snapshot is dangerous in a different way from a stale
`CURRENT-STATE.md` — it misleads about the *base* the project sits
on, not just current task state. Treat updates here as load-bearing.
