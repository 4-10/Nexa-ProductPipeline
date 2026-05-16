# {{PROJECT_NAME}} — Open defects

Living defect tracker. Append new entries at the top within each
iteration / cycle block. Mark resolved items with strikethrough +
the iter/date that fixed them.

## Entry format

```markdown
**ID — short title** [severity: P0/P1/P2/P3]

- **What:** symptom as observed
- **Why (hypothesis):** suspected cause; "unknown" if not yet diagnosed
- **Fix sketch:** approach if known; "TBD" if not
- **Status:** OPEN / IN-PROGRESS / RESOLVED-YYYY-MM-DD or RESOLVED-iterN
```

## Severity scale

- **P0** — blocks the feature from working at all.
- **P1** — feature works but with wrong / broken behavior.
- **P2** — cosmetic / theme / minor issue, doesn't break functionality.
- **P3** — UI noise / unconfirmed / pre-existing / cosmetic edge case.

## ID convention

Use a stable, memorable prefix per defect cluster — e.g.,
`D17-01` (iteration 17, defect 1), `BUG-101`, `AUTH-04`. The point
is that an ID survives across multiple sessions and survives the
status changing from OPEN → RESOLVED.

---

## Open

> Group by iteration / cycle. Most recent group at top.

### {{Iter N or YYYY-MM cycle label}}

**{{ID}} — {{short title}}** [{{severity}}]

- **What:** {{symptom}}
- **Why (hypothesis):** {{cause or "unknown"}}
- **Fix sketch:** {{approach or "TBD"}}
- **Status:** OPEN

---

## Resolved (recent)

> Keep a few months of resolved defects with strikethrough on the
> title for posterity. Older resolved defects can be archived
> following the same pattern as the audit log (monthly archive
> files) if this section grows.

### Iter / cycle that resolved them

**~~{{ID}} — {{short title}}~~** [{{severity}}] — RESOLVED-{{date or iter}}

- **What was:** {{symptom}}
- **Root cause:** {{the actual cause once diagnosed}}
- **Fix:** {{what made it work}}
- **Lesson captured in:** {{path to reference doc / memory file, if applicable}}

---

## Triage summary

> Helpful to keep a small table at the bottom for at-a-glance.

| Severity | Count | Items |
|---|---|---|
| P0 (blocking) | 0 | — |
| P1 (broken behavior) | 0 | — |
| P2 (cosmetic) | 0 | — |
| P3 (noise / cosmetic edge) | 0 | — |

## Notes

- **Resolution lessons:** when you resolve a defect that taught
  you something non-obvious, capture the lesson in a reference
  doc (`shared/reference/`) or memory file. Link it under the
  resolved entry. Future subagents read these via the routing
  table.
- **Don't delete resolved entries.** They're history. If volume
  becomes a problem, archive into dated files.
