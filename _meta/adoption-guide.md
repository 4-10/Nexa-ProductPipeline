# Adoption guide

How to take this template and turn it into a real, working knowledge
base for your project. Allow yourself a few hours for the initial
scaffold; the system reaches steady state over the first few weeks
of real use.

---

## Phase 1 — Scaffold (one sitting, ~1 hour)

1. **Copy the template folder.** Copy this entire `knowledge-base-template/`
   directory to wherever your knowledge base will live. Typical
   locations:
   - `C:/Projects/<KB-Name>/` for a single-machine workflow.
   - Inside a private git repo if you want versioning + sync.
   - Adjacent to (not inside) the actual project code repository,
     so the KB has its own lifecycle.

2. **Rename the top-level folder** to something descriptive:
   `<Domain>-Reference`, `<Org>-Knowledge`, etc. Avoid generic
   names like "docs" or "kb" that overlap with other directories.

3. **Rename `projects/` if appropriate.** Use the word that fits
   your domain: `servers/`, `clients/`, `engagements/`, `products/`,
   `workstreams/`. If you rename, update references in `INDEX.md`,
   `SUBAGENT_BRIEFING.md`, `README.md`, and the `_meta/` docs.

4. **Fill in the top-level README.** Edit `README.md` so the
   description on the first few lines reflects what THIS knowledge
   base is for. Strip the template-meta language.

5. **Stub out `GLOSSARY.md`.** Add the 5–10 most important
   project-specific terms a fresh session would not recognize.
   Don't try to be exhaustive.

6. **Scaffold your first project.** Copy `_templates/project/` into
   `projects/<your-first-project>/`. Walk through each file and
   fill in placeholders. Files in priority order:
   - `README.md` (project identity) — fill in fully now.
   - `CURRENT-STATE.md` — fill in fully now. Be honest about
     status; don't aspirationally describe a future state.
   - `AUDIT-LOG.md` — keep the starter entry, add a fresh one
     describing the scaffolding action.
   - `DECISION-LOG.md` — keep the starter entry; new entries
     accumulate from here forward.
   - `STATE-SNAPSHOT.md` — fill in the stack and environment
     sections.
   - `OPEN-DEFECTS.md` — leave empty for now; populate as defects
     emerge.
   - `how-to/` — leave empty for now; add procedures as you
     discover them.

7. **Adapt `SUBAGENT_BRIEFING.md`'s routing table.** Replace the
   placeholder domains with your real ones (the domains a subagent
   might be asked to work in). Point each row at real files you
   either have now or plan to create. It's OK to leave rows
   pointing at files that don't exist yet — flag them and create
   them on first use.

8. **Populate `INDEX.md`** with entries for every file you just
   created. Use the keyword conventions described at the top of
   the index. Don't skimp on keyword aliases.

9. **Commit if you're using git.** Initial commit. Now you have
   a baseline.

---

## Phase 2 — Wire up the catchup skill (one sitting, ~30 min)

10. **Read `_meta/catchup-skill-template.md`.** It's a template
    for a Claude Code skill that walks a fresh session through the
    standard read order.

11. **Create the actual skill file.** Path:
    `~/.claude/skills/<your-skill-name>/SKILL.md`. Copy the
    template content into it, replace placeholders with your real
    KB path and project names.

12. **Test the skill.** Start a fresh Claude Code session in the
    project. Invoke the skill. Confirm it reads the expected files
    in the expected order. Adjust the skill if the read order
    isn't right.

---

## Phase 3 — First real session (one working session, ~2–4 hours)

13. **Do real work.** Pick a real task and execute it normally.

14. **Practice the maintenance discipline.** When you finish a
    meaningful action, write an audit log entry. When you make a
    non-obvious choice, write a decision log entry. When you
    discover a procedure, write a how-to.

15. **Update `CURRENT-STATE.md` at the end.** Even if you didn't
    finish the work, leave the doc in a state where the next
    session can pick up cleanly.

16. **Notice friction.** If something feels clunky (a missing
    routing entry, an unclear procedure, a stale verification
    command), fix it immediately. The template is a starting
    point, not a finished product — friction during real use is
    the signal for where to invest.

---

## Phase 4 — First subagent delegation (whenever the work calls for it)

17. **Use the task prompt template** (`_meta/task-prompt-template.md`).
    Don't ad-hoc the Task tool call. The template forces you to
    name the domain, write parent context, and require pre-flight
    confirmation.

18. **Verify the subagent's first response is in PRE-FLIGHT
    COMPLETE format.** If it isn't, push back and make the
    subagent redo the pre-flight before proceeding.

19. **When the subagent finishes**, check that it updated the
    audit log and (if applicable) the decision log. If it didn't,
    do it yourself before the context is lost.

---

## Phase 5 — Settle in (first 2–4 weeks of real use)

20. **Watch what files get read most.** Reference docs that
    subagents repeatedly read are the high-value ones. Invest in
    making them better.

21. **Watch what files never get read.** If a file sits unused
    for weeks, either nobody knows about it (fix the INDEX entry)
    or it's not load-bearing (consider removing).

22. **Add a second project when you have one.** Use the template.
    Notice what was hard about the first project that you can
    shortcut on the second.

23. **Prune.** After a month or two, prune the audit log per the
    pruning policy in the file. Mark stale decisions as
    superseded. Update verification commands that have changed.

---

## Common adoption mistakes

- **Trying to backfill the decision log from years of history.**
  Don't. Capture from the moment you institute it forward.
- **Writing aspirational `CURRENT-STATE.md` entries** (describing
  what you wish were true, not what is). The doc becomes useless
  the instant it's not honest.
- **Letting the index drift behind the file system.** As soon as a
  file move isn't reflected in INDEX, the system rots.
- **Skipping the audit log because "I'll remember."** You won't.
  Or you will, but the next session won't.
- **Treating the subagent briefing as optional.** Without it,
  you're back to subagents guessing. The whole point of this
  architecture is the briefing layer.

---

## Steady-state signal

You'll know the system is healthy when:

- Fresh sessions catch up in under 5 minutes using the skill.
- Subagents reliably produce work that respects project gotchas
  without you re-explaining them.
- When a defect surfaces, you can usually find a related
  decision-log or audit-log entry within a minute.
- The INDEX file is your first instinct, not Ctrl-F over the
  whole folder.
