# Catchup skill template

A template for the Claude Code skill that orients a fresh session
on this knowledge base, validates living-doc freshness, and brings
the session up to speed in a few minutes instead of an hour.

To use: copy the content of the SKILL.md block below to
`~/.claude/skills/<your-skill-name>/SKILL.md`, replace placeholders
with your real paths, and test it.

---

## Why have a catchup skill

A fresh Claude session has no idea your knowledge base exists, where
it lives, or what to read. The skill is the connective tissue:

- It's auto-loaded by Claude Code based on its description, so a
  session searching for "what is this project / where's the data
  repo / how do I get oriented" gets it triggered.
- It runs through a standardized read order so context lands in a
  predictable shape.
- It enforces the maintenance discipline at session start (verify
  doc freshness) and session end (update audit log).
- It enforces the subagent briefing discipline by reminding the
  parent to use the task prompt template.

Without the skill, you'd have to manually paste the read order at
the start of every session. The skill makes it free.

---

## SKILL.md content (copy and adapt)

```markdown
---
name: <kb-name>-catchup
description: Orient a fresh Claude session on the <KB Name> knowledge base. Trigger when the session needs project context, when starting work on this project, when asked "where are we" or "what's the state", or at the start of any working session on this project.
---

# <KB Name> Catchup

You are starting (or resuming) a session that works on the <KB Name>
knowledge base, at `<absolute path to KB root>`. Before doing any
work, complete the catchup protocol below.

## Catchup protocol

Complete in order. Do NOT skip steps.

1. **Load `INDEX.md`** from the KB root. This is your map. When the
   user asks about a topic later, search INDEX before guessing.

2. **Load `README.md`** to refresh on the architecture and the
   single-source-of-truth rules.

3. **Identify the active project.** If the user has named one,
   use that. If not, list the projects in `projects/` and ask.

4. **Load `projects/<active>/README.md`** for project identity.

5. **Load `projects/<active>/CURRENT-STATE.md`.** This is the
   living doc. After loading, you MUST run the "Verification rule"
   at the bottom of the doc:
   - Check the date — if more than 1 day old, treat as suspect.
   - Run each verification command in the "State health" table.
   - Read the top 3 entries of `AUDIT-LOG.md` — do they corroborate
     the "Last action taken"?
   - Spot-check at least one claim relevant to the user's task.

   If any check fails, **the CURRENT-STATE doc is stale**. Update
   it before proceeding with new work. Do not act on stale claims.

6. **Load `projects/<active>/AUDIT-LOG.md`** (top ~10–20 entries)
   for recent context.

7. **Load `projects/<active>/OPEN-DEFECTS.md`** if the user's task
   could be affected by known issues.

8. **Lazy-load** anything else only when the user's task touches
   that area. INDEX.md tells you where to look.

## Report orientation to the user

After completing catchup, give the user a 4–6 line orientation:

- What the active project is doing right now (from CURRENT-STATE
  "Active focus").
- Last action taken.
- Next intended move.
- Whether you found any verification check that failed.
- Any open decisions that may need their input.

Keep this concise. The user doesn't need every detail; they need
to know you're caught up and what's worth their attention.

## Maintenance during the session

While working:

- **After meaningful action**, append to `AUDIT-LOG.md`.
- **After non-obvious choice**, append to `DECISION-LOG.md`.
- **After completing major work**, update `CURRENT-STATE.md`.
- **After creating any new doc**, register in `INDEX.md`.

These are not optional. The whole architecture assumes they happen.

## Growing the KB into new domains

The KB starts small and grows as the project surfaces new domains.
If you (or a subagent) hit a topic the KB doesn't yet cover:

1. **Don't ignore the gap.** A missing routing entry or reference
   file is exactly when knowledge gets lost.
2. **Create the file with whatever you have** — even 3–5 facts is
   better than nothing. Stubs are fine; perfection is not.
3. **Add a row to `SUBAGENT_BRIEFING.md`'s routing table** pointing
   at the new file, with generous keyword aliases.
4. **Register the file in `INDEX.md`** with relevant keywords.
5. **Append to `AUDIT-LOG.md`** that you grew the KB this session.

Full discipline and patterns: see `_meta/growth-pattern.md`.

Critical: do NOT create empty placeholder files, and do NOT add
routing entries that point at files that don't exist. Both are
worse than the gap they're trying to close.

## Delegating to subagents

You will frequently spawn subagents via the Task tool. **Every time
you do this, you must use the subagent task template at
`_meta/task-prompt-template.md`.**

### Hard rules

1. Never call the Task tool with an ad-hoc prompt — always use
   the template.
2. Always include a TASK DOMAIN(S) field so the subagent routes
   correctly via `SUBAGENT_BRIEFING.md`.
3. Always include a PARENT CONTEXT block with 2–5 bullets of the
   most relevant nuances you know.
4. Always require the PRE-FLIGHT COMPLETE response. If the
   subagent's first response is not in that format, push back
   and make it redo the pre-flight.
5. Always specify CONSTRAINTS explicitly. Implicit constraints
   get violated.
6. Always require the 5-section completion report.

When a subagent finishes, verify:
- PRE-FLIGHT COMPLETE response was present and listed real files.
- The "What I could NOT verify" section is non-empty.
- Audit log was updated.
- If non-obvious decisions were made, decision log was updated.
- All paths/symbols in the report exist.

### When to skip the template

Only for: trivial domain-free tasks, investigation-only tasks
(still bootstrap, lighter on the rest), continuation of an
already-briefed subagent. Every other case: full template.

## Session-end protocol

Before ending the session:

1. Confirm `CURRENT-STATE.md` reflects reality at session end.
2. Confirm all meaningful actions have audit log entries.
3. Confirm all non-obvious decisions have decision log entries.
4. Confirm any new files are registered in `INDEX.md`.
5. Report a one-line session summary to the user.

If any of these is incomplete, do them BEFORE telling the user
the session is done.
```

---

## Adapting the template

Things to replace before saving:

- `<kb-name>` in the skill name (use a short, hyphenated form).
- `<KB Name>` in the description and content (the human-readable
  name of your knowledge base).
- `<absolute path to KB root>` (e.g., `C:/Projects/Wow-Reference/`
  or `~/work/acme-knowledge/`).
- Any references to `projects/` if you renamed that folder
  (`servers/`, `clients/`, etc.).

Things to consider customizing:

- **Verification commands** in step 5: the generic ones (`git log`,
  `docker ps`) are placeholders for what `CURRENT-STATE.md`'s table
  actually contains. The skill just enforces "run them"; the
  commands themselves live in the doc.
- **What counts as the "active project"** in step 3: if you only
  ever have one, hard-code it. If you have several, the skill can
  default to "the most recently updated CURRENT-STATE.md".
- **Subagent rules** can be lighter if you don't delegate often.
  But if you use Superpowers or similar plugins that spawn
  aggressively, keep these rules tight.

---

## Testing the skill

After saving, test:

1. Start a fresh Claude Code session in the project directory.
2. Ask: "What's the current state of <project>?" or "Get me
   oriented on this KB."
3. Confirm the skill triggers and runs the protocol.
4. Confirm the orientation report at the end is concise and
   useful.
5. Confirm the verification rule actually fires (have CURRENT-STATE
   say something verifiable, then poke a hole — does the session
   notice?).

If the skill doesn't trigger, the description needs more keywords.
If it runs but skips s