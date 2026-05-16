# Subagent task prompt template

> The parent session uses this template **every time** it spawns a
> subagent via the Task tool. The catchup skill enforces this — see
> `catchup-skill-template.md`.
>
> Copy the template block below, fill in the slots, and pass the
> result as the `prompt` parameter to the Task tool.

---

## The template (copy from here)

```
MANDATORY BOOTSTRAP — DO NOT SKIP

Before doing anything else:
1. Read `SUBAGENT_BRIEFING.md` at the knowledge-base root in full.
2. Follow its Routing Table for the domain(s) below.
3. Complete its pre-flight checklist.
4. Respond with the PRE-FLIGHT COMPLETE format it specifies.

If you start writing code before completing the bootstrap, I will
stop you and have you redo it. The cost of pre-flight is small. The
cost of broken work because you skipped it is large.

----

TASK DOMAIN(S): <list domain keywords here so the subagent routes
correctly — e.g., "auth, sessions" or "db, migrations">

PARENT CONTEXT (read this before the briefing):
<2–5 bullets of the most important nuances the parent already knows
are relevant to this task. Include gotchas you remember, links to
specific files in the knowledge base that you know apply, and any
constraints the subagent must respect. If you can name specific
decision-log entries by title, do so.>

TASK:
<the actual task description — what to build, what to fix, what to
investigate. Be specific about success criteria.>

CONSTRAINTS:
- <e.g. "Do not modify any file outside src/auth/">
- <e.g. "All new functions must have unit tests">
- <e.g. "Match the existing pattern in src/auth/middleware.ts —
   do not invent a new one">

ON COMPLETION:
1. Append one line to `AUDIT-LOG.md` summarizing what you did.
2. If you made any non-obvious design decisions, add an entry to
   `DECISION-LOG.md`.
3. If you encountered a defect (existing or new), update
   `OPEN-DEFECTS.md`.
4. Report back in this exact shape:
   - What I planned
   - What I did
   - What I verified (and how)
   - What I could NOT verify (be explicit)
   - What the parent / user should test manually
   - Open questions or concerns

Do not declare success unless tests pass. If tests fail, report
honestly and stop.
```

---

## Why each piece is there

**The bootstrap block goes first, in caps.** Subagents under context
pressure skim. Burying the bootstrap below context makes it
skippable. Put it at the top with a stop-sign tone.

**TASK DOMAIN(S) is a separate field, not buried in the task.** The
subagent uses this to drive its Routing Table lookup. If you write
it into the prose of the task, the subagent has to extract it — and
might miss a domain you care about. Naming it explicitly forces
you to be clear about what nuance is relevant.

**PARENT CONTEXT goes before the briefing.** The briefing is generic
routing. The parent context is "here is what I specifically know
matters for this task." Two channels: one general, one specific.
Use both.

**CONSTRAINTS are listed, not implied.** Subagents respect explicit
constraints. They violate implicit ones constantly. If something
matters, write it down.

**ON COMPLETION specifies the report shape.** The five-section
format (planned / did / verified / not-verified / human-to-test /
open questions) forces honesty. Subagents that aren't given this
shape produce reports that read as confident regardless of whether
the work succeeded.

---

## When to deviate from the template

Three cases where deviation is OK:

1. **Trivial, no-domain tasks** ("rename this variable everywhere",
   "fix this typo"). The full template is overkill. A two-line
   task prompt is fine. But ask yourself: is it really domain-free?
   Many tasks that *feel* trivial sit on top of a gotcha.

2. **Investigation-only tasks** where the subagent is not writing
   code. The bootstrap still applies, but CONSTRAINTS and
   ON COMPLETION can be lighter.

3. **Multi-step chained delegations** where you've already briefed
   the subagent once and are giving it the next step. Even here,
   re-state the constraints — subagent memory across turns is real
   but not bulletproof.

In every other case, use the full template. The few extra tokens
are cheap insurance against the much larger cost of rework.

---

## Verifying the subagent's first response

When the subagent replies, check that the first message follows
the PRE-FLIGHT COMPLETE format described in `SUBAGENT_BRIEFING.md`.
If it doesn't:

1. Stop the subagent before it proceeds.
2. Restate the bootstrap requirement.
3. Ask for the PRE-FLIGHT COMPLETE response.

If you let a non-compliant subagent proceed, you've lost the
verification check. The whole point of the format is to catch
"I skipped the briefing" before any real work happens.

---

## Verifying the subagent's completion report

When the subagent reports completion, check:

- All five report sections are present (planned / did / verified /
  not-verified / human-to-test / open questions).
- The "What I could NOT verify" section is non-empty unless the
  task was truly trivial. Empty is a yellow flag — almost no real
  task has zero uncertainty.
- The audit log entry was added.
- If non-obvious decisions were made, the decision log was updated.
- All file paths and symbols mentioned in the report are real
  (a quick `Read` or `Grep` confirms).

If the subagent invented anything — a file that doesn't exist, a
function that isn't defined, a config key that isn't real — treat
the entire completion report as suspect and re-delegate with more
constraints.
