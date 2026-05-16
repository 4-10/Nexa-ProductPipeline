# Growth pattern

How the knowledge base expands into new domains and files as the
project surfaces them. The KB starts small and grows — but only if
sessions actually do the work of growing it. This file is the
playbook for that.

---

## The problem this solves

When you scaffold a new KB, you can't anticipate every domain your
project will eventually need. You add the obvious ones up front
(database, auth, API) and leave the rest for later.

A few weeks in, you start working on, say, "payments" for the first
time. The `SUBAGENT_BRIEFING.md` routing table has no row for
payments. The `INDEX.md` has no entry. There's no
`shared/reference/payments.md`.

Three failure modes are possible:

1. **The session ignores the gap.** It guesses about payments
   mechanics, makes the same mistakes a subagent would, and
   ships broken work. (Worst case.)
2. **The session does the work without recording anything.** Code
   gets written, but the knowledge stays in the session's head.
   The next session re-derives from zero. (Common case.)
3. **The session grows the KB as it grows the project.** It
   creates the file, adds the routing entry, registers the index.
   Now the KB has a payments domain. (Goal case.)

This file documents how to make #3 the default.

---

## The growth checklist

When you discover that the KB doesn't cover a domain or topic you
need, complete these steps as part of doing the actual work — not
as a separate "documentation pass" later.

### 1. Recognize the gap

Signals that a gap exists:

- You search `INDEX.md` for a keyword and find nothing relevant.
- You search `SUBAGENT_BRIEFING.md`'s routing table and the domain
  isn't there.
- You're about to write code in an area where the KB has no
  reference doc.
- A subagent guessed wrong because no file covered the topic.
- You catch yourself explaining a concept to Claude that you've
  already explained in a previous session.

### 2. Decide what kind of artifact you need

| You learned... | Create / update... |
|---|---|
| How a complex subsystem actually works | `shared/reference/<topic>.md` |
| A repeatable procedure that crosses projects | `shared/how-to/<procedure>.md` |
| A repeatable procedure specific to one project | `projects/<name>/how-to/<procedure>.md` |
| A non-obvious decision you made today | `projects/<name>/DECISION-LOG.md` |
| A known issue / defect | `projects/<name>/OPEN-DEFECTS.md` |
| A new piece of technology / stack you adopted | `shared/stack/<tech>.md` |
| A new tool you started using | `shared/tooling/<tool>.md` |
| Project-specific term / jargon | `GLOSSARY.md` |

If multiple fit, do them all. A new domain often needs a reference
doc *and* a routing-table entry *and* an INDEX entry.

### 3. Create the file with whatever you have

Don't wait until you have the "complete picture." A partial file
that captures what you learned today is far more valuable than a
blank slate for the next session.

The file's first version might be:

- Three sections: "What this is", "Gotchas we've hit", "Open
  questions."
- A few hard-won facts with surrounding context.
- A note at the top: "Stub — populated 2026-MM-DD with initial
  findings. Expand on next pass."

That's fine. Subagents reading it will be better off than they
would be with no file at all. The next session can deepen it.

### 4. Add to `SUBAGENT_BRIEFING.md` routing table

Open `SUBAGENT_BRIEFING.md`. Add a row to the routing table:

```
| <new domain keyword(s)> | <path to new file>, <other relevant files> |
```

Pick keywords that match how someone would describe their task —
not librarian-language. If the topic is payments, the keywords
should include "payment, billing, charge, refund, subscription"
rather than just "payments."

Multiple keywords per row are fine and encouraged.

### 5. Add to `INDEX.md`

Open `INDEX.md`. Find the right section (`Architecture & key
findings`, `Stack`, `Tooling`, `How-to`, etc.). Add an entry:

```markdown
- **<keywords for this topic>** -> `<path>`
```

Use generous aliases. INDEX is keyword-search, not categorical
taxonomy.

### 6. Log it

Append to `AUDIT-LOG.md`:

```
## YYYY-MM-DD HH:MM — Added <domain> reference docs

**What:** Scaffolded <files> for <domain>. Added routing entry
in SUBAGENT_BRIEFING and INDEX entry.
**Why:** First time the project touched <domain>. Captured initial
findings so the next session doesn't re-derive.
**Files:** <list>
**Verification:** File exists; routing entry visible in
SUBAGENT_BRIEFING; INDEX search for keyword surfaces the file.
```

If the addition reflects a meaningful design decision (e.g., "we
chose to handle payments via Stripe rather than building our own"),
also add a `DECISION-LOG.md` entry.

### 7. Update related files if needed

If the new domain interacts with existing ones, consider:

- Does an existing reference doc need a cross-link to the new one?
- Does an existing how-to need a "Read first" pointer to the new
  reference?
- Does `GLOSSARY.md` need new terms?
- Does `STATE-SNAPSHOT.md` need to record the new component?

Five minutes here saves an hour next time.

---

## The "stub first, deepen later" pattern

You don't need to write the perfect reference doc on first contact.
A useful pattern:

**First touch (during the actual work):**
- Create the file.
- Capture 3–5 facts you just learned.
- List the open questions you didn't resolve.
- Add routing + index entries.
- Move on with the work.

**Second touch (next time the domain comes up):**
- Read what you wrote last time.
- Add what you've learned since.
- Resolve any open questions you can now answer.
- Don't try to be exhaustive — be incremental.

**Steady state (after 3–5 touches):**
- The file has settled into a comprehensive reference.
- Subagents reading it have the context they need.
- Open questions are mostly resolved or are explicitly deferred.

The pattern works because each touch is cheap and the value
compounds. Trying to write the comprehensive doc on first contact
usually fails — you don't yet know which details will matter.

---

## When a subagent surfaces a gap

If a subagent reports that the KB didn't cover something it needed:

1. **Treat the gap as actionable.** Don't just answer the
   subagent's question and move on. The next subagent will hit
   the same gap.
2. **Close the gap during the work, not after.** Create the file,
   add the entries, before declaring the parent's task done.
3. **Update the routing table.** The subagent didn't find the
   relevant file because the routing table didn't point there.
   Even if the file existed, the gap was discoverability.
4. **Note it in the audit log** so future-you can see that the KB
   expanded as a side effect of the task.

The subagent's confusion is the most reliable signal of where the
KB needs to grow. Treat it that way.

---

## Anti-patterns

Things that look like growth but actually rot the KB:

- **Creating empty placeholder files** "to be filled in later."
  Empty files mislead the next session into thinking content
  exists. Don't create the file until you have at least 3–5
  real facts to put in it.
- **Routing-table entries that point to files that don't exist.**
  Same problem. The routing table is a promise to subagents; a
  broken promise is worse than no promise.
- **Duplicating knowledge across files** because you couldn't
  decide where it belonged. Pick one. Cross-link from the other.
  Two copies of the same fact drift over time.
- **Deepening one file while ignoring the rest of the system.**
  Routing + index + audit log are non-negotiable companions to a
  new file. Skipping them means the file is invisible.
- **Skipping the audit-log entry because "the file change is
  obvious."** The audit log is the history substrate. Without
  the entry, future you doesn't know *when* this grew.

---

## How this connects to the subagent layer

The growth pattern is the system's way of staying current. The
subagent briefing system is the system's way of consuming that
currency. Together:

- Subagent surfaces a gap → parent closes it during the work →
  KB grows.
- Next time a subagent works in the same domain → routing table
  surfaces the file → no gap, no broken guesses.

The KB doesn't have to be complete to be useful. It just has to
*grow with the project*. The pattern in this file is the operational
discipline that makes that growth happen.
