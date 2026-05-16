# {{PROJECT_NAME}} — DECISION LOG

> **Purpose:** This log captures *why* the project is the way it is,
> especially when "why" is non-obvious from the code or current state.
> The audit log captures *what* got done; this log captures *what
> got considered, what was rejected, and why the chosen path won*.
>
> **Why this exists:** Subagents (and future-you) repeatedly
> re-litigate decisions because the code only shows the final
> answer, not the reasoning. A short entry here saves hours of
> rework later.

---

## How to write an entry

Every entry has the same shape. Keep them short — one screen max.
The point is recall, not exhaustive documentation.

```markdown
## YYYY-MM-DD — <short title>

**Tags:** <domain1>, <domain2>   (use the same domain keywords as
                                  the SUBAGENT_BRIEFING routing table)

**Context:** What problem or question prompted the decision. 1–3
sentences.

**Options considered:**
- A: <approach> — <why we didn't pick it>
- B: <approach> — <why we didn't pick it>
- C: <approach> — chosen.

**Why we chose C:** The actual reasoning. Include any tradeoffs we
accepted. If there's a known downside, name it so the next person
doesn't think they've discovered a bug.

**Implications for future work:**
- Subagents working on <domain> should respect <constraint>.
- If <condition> changes, revisit this decision.

**Status:** active | superseded by YYYY-MM-DD-<title> | reversed
```

---

## When to add an entry

Add an entry whenever any of the following are true:

- You picked between two or more real alternatives, and the choice
  is not obvious from looking at the code.
- You implemented something a particular way *despite* a more
  obvious alternative existing.
- A bug or incident drove a design change (the fix is in the code;
  the *why* belongs here).
- You consciously deferred a problem ("we'll do X later when Y
  changes") — this prevents subagents from thinking the deferral
  is a bug.
- You and a subagent disagreed on an approach and you overrode it.

**Don't add entries for:** trivial style choices, decisions that
are self-evident from the code, or decisions covered by an existing
entry (update the existing one instead).

---

## Maintenance

Once a month or so:

- Skim entries older than ~6 months. If they're still load-bearing,
  leave them. If they describe code that no longer exists, mark
  them `Status: reversed` (don't delete — the history is useful).
- If two entries cover the same topic, merge them.
- If you find a decision being violated repeatedly by subagents,
  the entry probably needs a stronger title or better tags so it
  surfaces during pre-flight.

---

## Entries

> Below this line, append entries newest-first.

## YYYY-MM-DD — Decision log instituted

**Tags:** meta, process

**Context:** Knowledge base scaffolded from template; instituting
the decision log alongside the audit log.

**Options considered:**
- A: Combine rationale into the audit log — rejected, the audit log
  becomes unscannable and reasoning gets buried under what-changed
  details.
- B: Capture rationale only in per-domain knowledge files — rejected,
  knowledge files describe how things work, not the history of how
  we got there; mixing the two makes both harder to read.
- C: Separate `DECISION-LOG.md`, referenced from the subagent
  briefing's pre-flight checklist — chosen.

**Why we chose C:** Separation of concerns. Knowledge files = how
it works. Audit log = what changed. Decision log = why we picked
this. Subagents read the decision log during pre-flight, so the
reasoning lands in their context exactly when it's useful.

**Implications for future work:**
- Every subagent's pre-flight checklist includes a decision-log
  scan for their domain tag.
- Sessions should add an entry whenever they make a non-obvious call.

**Status:** active
