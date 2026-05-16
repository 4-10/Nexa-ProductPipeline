# Maintenance discipline

The knowledge base only works if it stays current. This file is
the operating manual for that.

The discipline is small but non-negotiable. The whole architecture
assumes these rules are followed. When they aren't, the system
degrades into noise: stale `CURRENT-STATE.md`, audit log with gaps,
INDEX that no longer matches reality. Once trust in the docs is
lost, sessions stop using them, and the value collapses.

---

## The five rules

1. **After meaningful action (>5 min work or non-obvious decision):**
   append to `AUDIT-LOG.md`. Match the entry format at the top of
   the file. Keep entries terse but specific.

2. **After a non-obvious design choice:** append to `DECISION-LOG.md`.
   Tag with relevant domain keywords. Include the *why*, not just
   the *what*.

3. **After completing major work:** update `CURRENT-STATE.md`. The
   "Active focus", "Last action taken", and "Next intended move"
   sections should reflect reality at session end. The verification
   commands at the bottom should still pass if a fresh session
   ran them right now.

4. **After discovering a repeatable procedure:** add a doc to
   `how-to/` (project-specific or `shared/how-to/` for cross-project).
   Register it in `INDEX.md` with relevant keywords.

5. **After creating any new doc:** register it in `INDEX.md`.
   Unregistered docs are invisible. Don't trust people to grep
   the file tree.

---

## Two more rules that are easy to forget

6. **When `CURRENT-STATE.md` diverges from reality:** fix it
   before doing more work. If you sit down to work and the doc
   describes a state that doesn't match what you find, that's the
   highest-priority thing in front of you. Update the doc, *then*
   do the work.

7. **When a subagent finishes:** verify the audit log and (if
   applicable) decision log got updated. If they didn't, write
   the entries yourself before context is lost. The subagent's
   completion report is the source material.

---

## What gets logged where

A mental decision tree:

```
Did something change in the world?
├── Yes
│   ├── Was it a one-time action? → AUDIT-LOG.md
│   ├── Did it commit you to a path? → AUDIT-LOG.md + DECISION-LOG.md
│   ├── Did it change current focus or next move? → also update CURRENT-STATE.md
│   ├── Did it change structural config (versions, deployment)? → also update STATE-SNAPSHOT.md
│   ├── Was it a new repeatable procedure? → also write a how-to
│   └── Did it surface a known issue? → OPEN-DEFECTS.md
└── No, just thinking / planning
    ├── Did the thinking commit you to a path? → DECISION-LOG.md
    └── Otherwise no log entry needed
```

---

## Update frequency by file

| File | Update when... |
|---|---|
| `CURRENT-STATE.md` | End of every working session that changed focus or state |
| `AUDIT-LOG.md` | After every meaningful action |
| `DECISION-LOG.md` | After every non-obvious choice |
| `OPEN-DEFECTS.md` | When a defect is found, fixed, or status changes |
| `STATE-SNAPSHOT.md` | When versions, configs, or services change |
| `INDEX.md` | When any file is added, moved, or deleted |
| `GLOSSARY.md` | When you find yourself explaining a term to Claude |
| `README.md` | Rarely — only when the architecture itself changes |
| `SUBAGENT_BRIEFING.md` routing table | When a new task domain emerges, or routing-to file paths change |

---

## Subagent responsibilities

When a subagent finishes a task, it's responsible for:

- Appending to `AUDIT-LOG.md`.
- Adding to `DECISION-LOG.md` if it made a non-obvious call.
- Reporting back to the parent in the 5-section completion format
  (planned / did / verified / not-verified / human-to-test /
  open questions). The parent's task prompt template enforces this.

The parent is responsible for:

- Using the task prompt template every time.
- Verifying the subagent's PRE-FLIGHT COMPLETE response on first
  reply.
- Verifying the subagent updated the logs on completion.
- Updating `CURRENT-STATE.md` if the subagent's work materially
  changed project state.

---

## Pruning policy

Append-only logs grow without bound. Two practices keep them
manageable:

1. **AUDIT-LOG.md** — when the file exceeds the previous calendar
   month's entries, archive everything older than 30 days into
   `AUDIT-ARCHIVE-YYYY-MM.md`. One archive per month. The archives
   are canonical history; they're just out of the main file's
   immediate scan window.

2. **DECISION-LOG.md** — don't archive; the whole point of decision
   log entries is durable recall. If a decision becomes irrelevant
   (e.g., the code it described no longer exists), mark
   `Status: superseded` or `Status: reversed` — don't delete.

3. **OPEN-DEFECTS.md** — when resolved-defects section grows large,
   archive into `DEFECTS-ARCHIVE-YYYY-MM.md`. Open defects always
   stay in the main file.

---

## Pruning is not deletion

Archives are still canonical. They're just out of the main file
to keep the main file scannable. A subagent that needs deep history
can grep the archives. Don't delete entries unless they're factually
wrong; correct them or mark them superseded instead.

---

## Growing the KB (vs. just maintaining)

Maintenance keeps the existing KB current. Growth is when a new
domain emerges and the KB needs to expand to cover it. They're
related but distinct disciplines.

The growth pattern is documented in detail in `growth-pattern.md`.
Short version: when a session or subagent hits a topic the KB
doesn't cover, the session is responsible for creating the file,
adding it to `SUBAGENT_BRIEFING.md`'s routing table, registering it
in `INDEX.md`, and logging the addition — all during the same
session, not deferred to "later."

The growth discipline complements maintenance. Without growth, the
KB ossifies; without maintenance, the KB rots. Both are required.

## Drift signals (watch for these)

The system is drifting toward decay when:

- The audit log has a gap of more than ~2 weeks of active work.
- `CURRENT-STATE.md`'s date is more than 7 days old and you've
  been working in the project since.
- Subagents start producing the same wrong guess twice — the
  routing table didn't surface the right file, or the file doesn't
  exist yet.
- You catch your