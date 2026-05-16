# Session Start

Use this at the beginning of a Product Pipeline session.

## Steps

1. Sync the repo.

```powershell
git -C C:\Projects\Nexa-ProductPipeline pull --ff-only
```

2. Read the routing layer.

```powershell
Get-Content C:\Projects\Nexa-ProductPipeline\INDEX.md
```

3. Read current state and recent history.

```powershell
Get-Content C:\Projects\Nexa-ProductPipeline\projects\nexa-productpipeline\CURRENT-STATE.md
Get-Content C:\Projects\Nexa-ProductPipeline\projects\nexa-productpipeline\AUDIT-LOG.md -TotalCount 80
```

4. Verify live tracker state if touching work items.

```powershell
gh project view 4 --owner 4-10
gh issue list --repo 4-10/Nexa-ProductPipeline --state open --limit 20
```

5. Load only the reference docs needed for the task.

## Orientation Output

Report:

- active focus,
- last action,
- next intended move,
- verification concerns,
- open decisions needing Richard.
