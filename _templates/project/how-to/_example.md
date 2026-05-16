# How-to: {{task title}}

> **Read first:** `{{path/to/relevant-reference-doc}}`
> — {{one-line note about why reading the reference doc first matters}}.

Goal: {{one-sentence statement of what this procedure accomplishes}}.

## Prereqs

- {{environment / tools / credentials / state needed before starting}}
- {{any relevant gotchas referenced in memory or `shared/reference/`}}
- {{which character / account / test fixture to use, if applicable}}

## Procedure

### Step 1 — {{what it does}}

{{commands or actions, with exact syntax}}

```bash
# example
{{command}}
```

### Step 2 — {{what it does}}

{{commands or actions}}

### Step 3 — {{what it does}}

{{commands or actions}}

## Verification

How you know the procedure worked:

- {{specific check #1}} — e.g., `{{exact command}}` returns `{{expected}}`
- {{specific check #2}}
- {{in-app / in-system verification}}

## Common pitfalls

- **{{symptom}}** — {{cause}} — {{fix}}
- **{{symptom}}** — {{cause}} — {{fix}}

## Audit log entry template

When you finish this procedure, append something like this to
`AUDIT-LOG.md`:

```markdown
## YYYY-MM-DD HH:MM — {{verb-led title for this task}}

**What:** {{1–2 sentences}}
**Why:** {{context}}
**Files:** {{relative paths}}
**Verification:** {{which checks from above passed}}
```
