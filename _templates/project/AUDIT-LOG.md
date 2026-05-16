# {{PROJECT_NAME}} — AUDIT LOG

Append-only log of significant changes, decisions, and findings.
**Newest entries on top.**

## Entry format (template)

```markdown
## YYYY-MM-DD HH:MM — Short title (verb-led)

**What:** What changed in 1–2 sentences.
**Why:** The reason — context, problem solved, decision made.
**Files:** Comma-separated list of files affected (relative paths).
**Verification:** How we know it worked, OR "Pending: <what remains>".
**Deferred (if applicable):** What was explicitly NOT done and why.
```

Skip a section if not relevant. Keep entries under ~15 lines each;
if you need more detail, link to a doc rather than inlining.

## What counts as "significant"

Worth a log entry:
- Code or config change that touched real behavior.
- A non-obvious finding (a bug root cause, a stack quirk).
- A decision that committed you to a path (also goes in `DECISION-LOG.md`).
- A planned task that you started or finished.
- An incident or near-miss.

NOT worth a log entry:
- Reading docs, exploring code, low-stakes refactors.
- Trivial fixes (typos, formatting).
- Anything the session-level work didn't actually change in the
  real world.

If in doubt, log it. Over-logging is cheap; under-logging means
context is lost forever.

## Pruning policy

When this file exceeds the previous calendar month's entries,
archive everything older than 30 days into `AUDIT-ARCHIVE-YYYY-MM.md`
(one archive per month). Keep top of file readable.

Archived entries remain canonical; the archive files are just an
overflow buffer to keep this main file scannable.

---

> Below this line, log entries newest-first. Delete the starter
> entry below once you've added a real one.

## YYYY-MM-DD HH:MM — Knowledge base initialized

**What:** Scaffolded project folder from `_templates/project/`.
**Why:** Starting work on {{PROJECT_NAME}}.
**Files:** All files in `projects/{{project-folder-name}}/`.
**Verification:** Folder structure present; this entry is the first
real entry in the log.
