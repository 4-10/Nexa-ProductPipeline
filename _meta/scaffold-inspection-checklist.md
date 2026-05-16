# Scaffold inspection checklist

A comprehensive checklist for verifying a freshly scaffolded
knowledge base is *actually* in shape, not just "looks done."

This checklist is used in two contexts:

1. **By the `init-knowledge-base` skill at scaffold time** — the
   skill delegates inspection to a fresh subagent via the Task
   tool, passing this checklist. The subagent runs it read-only,
   reports findings. The skill fixes any FAILs and re-runs.
2. **By a session post-scaffold for re-verification** — if a KB
   has been sitting for a while or has had partial maintenance,
   a session can run through this manually to check structural
   integrity.

The two use cases are the same checklist. The framing differs:
fresh scaffold expects "all PASS"; mature KB may have intentional
gaps that the session uses for context-setting.

---

## How to run

Read the entire KB you're inspecting first. Then walk the checklist
top to bottom, marking PASS / FAIL / N/A per item. Report findings
at the end in the format below.

**Do not modify files during inspection.** Verification is
read-only. Issues get fixed by whoever invoked the inspection
(the scaffolding skill, or you), not by the inspector.

---

## Structural completeness

- [ ] **C-1.** Top-level files exist: `README.md`, `INDEX.md`,
      `SUBAGENT_BRIEFING.md`, `GLOSSARY.md`.
- [ ] **C-2.** `shared/` directory exists with `README.md`.
- [ ] **C-3.** `shared/reference/` directory exists.
- [ ] **C-4.** Every domain in `SUBAGENT_BRIEFING.md`'s routing
      table has a corresponding file at the path the row points to.
- [ ] **C-5.** `projects/` directory exists with `README.md`.
- [ ] **C-6.** `projects/<project-name>/` exists with all 6
      standard files: `README.md`, `CURRENT-STATE.md`,
      `AUDIT-LOG.md`, `DECISION-LOG.md`, `OPEN-DEFECTS.md`,
      `STATE-SNAPSHOT.md`.
- [ ] **C-7.** `projects/<project-name>/how-to/` exists with
      `README.md` and `_example.md`.
- [ ] **C-8.** `_templates/project/` is fully intact (the
      skeleton — all 6 standard files plus `how-to/` subfolder
      with `README.md` and `_example.md`).
- [ ] **C-9.** `_meta/` contains: `adoption-guide.md`,
      `maintenance-discipline.md`, `growth-pattern.md`,
      `task-prompt-template.md`, `catchup-skill-template.md`,
      `scaffold-inspection-checklist.md` (this file).
- [ ] **C-10.** If a catchup skill was scaffolded:
      `_meta/installed-catchup-skill/SKILL.md` exists.

## Content quality

- [ ] **Q-1.** Grep for `{{` in user-facing files (everything
      except `_templates/` and `_meta/`). Zero matches expected.
- [ ] **Q-2.** Grep for the literal string `YYYY-MM-DD` in
      user-facing files. Zero matches expected (it should appear
      only in `_templates/` and `_meta/` where it documents entry
      format).
- [ ] **Q-3.** Top-level `README.md` does NOT contain any of:
      "Who this is for", "extracted from a working production
      knowledge base", an "Adoption" section. (Those are
      template-meta that should have been stripped at scaffold.)
- [ ] **Q-4.** Top-level `README.md`'s opening paragraph names
      the project (not the template).
- [ ] **Q-5.** `projects/<name>/CURRENT-STATE.md`:
      - "Last action taken" is real content describing the
        scaffolding, not blockquoted template guidance.
      - "Next intended move" is real content.
      - "Open decisions" is populated or has
        `(none currently — KB freshly scaffolded)`.
      - "State health" table contains no `e.g., service / container`
        style placeholder rows.
- [ ] **Q-6.** `projects/<name>/AUDIT-LOG.md` has at least one
      real entry below the "newest-first" marker, and the entry
      uses today's actual date (not `YYYY-MM-DD`).
- [ ] **Q-7.** `projects/<name>/OPEN-DEFECTS.md` has the
      `_Empty as of scaffolding on <real date>_` note near the
      top.
- [ ] **Q-8.** `projects/<name>/STATE-SNAPSHOT.md`:
      - Has the `_Empty as of scaffolding on <real date>_` note.
      - Tech stack table uses `_TBD_` values, not
        `{{e.g., Python 3.11}}` style placeholders.
- [ ] **Q-9.** `projects/<name>/README.md` Identity table uses
      `_TBD — fill in when known_` notation for unknown fields
      (no `{{...}}` markers).
- [ ] **Q-10.** `projects/<name>/README.md` "What lives where"
      section is replaced with a single TBD line (not the
      `{{project-root-on-disk}}/{{dir-1}}/` placeholder).
- [ ] **Q-11.** `GLOSSARY.md` Terms section is empty or has the
      "no terms yet" note (not the `<example: iter 16>` style
      examples).

## Routing correctness

- [ ] **R-1.** Every row in `SUBAGENT_BRIEFING.md`'s routing
      table points at files that exist on disk.
- [ ] **R-2.** Every entry in `INDEX.md` points at files that
      exist on disk.
- [ ] **R-3.** Each domain in `SUBAGENT_BRIEFING.md`'s routing
      table has a corresponding entry in `INDEX.md`.
- [ ] **R-4.** Routing-table rows include `DECISION-LOG.md`
      tag-hints where appropriate (e.g., `(auth-tagged)`,
      `(db-tagged)`). This pattern tells subagents to scan
      DECISION-LOG for entries tagged with their domain during
      pre-flight.
- [ ] **R-5.** A catch-all row exists at the bottom of the
      routing table (typically pointing at
      `shared/reference/architecture.md`).

## Skill installation (if catchup skill was scaffolded)

If the user opted to skip the catchup skill at scaffold time,
mark this entire section N/A.

- [ ] **S-1.** `_meta/installed-catchup-skill/SKILL.md`
      frontmatter has the real KB name in the `name` field (not
      `<kb-name>`).
- [ ] **S-2.** SKILL.md content references the real KB absolute
      path (not `<absolute path to KB root>`).
- [ ] **S-3.** SKILL.md content references the real project
      folder name (not `<project-name>`).

---

## Report format

After completing the checklist, reply in this shape:

```
INSPECTION COMPLETE.

Structural completeness: <N> of <M> PASS
  - <list FAIL items by ID with specific findings>

Content quality: <N> of <M> PASS
  - <list FAIL items by ID with specific findings>

Routing correctness: <N> of <M> PASS
  - <list FAIL items by ID with specific findings>

Skill installation: <N of M PASS, or "N/A — not scaffolded">
  - <list FAIL items by ID with specific findings>

Overall: CLEAN / <N> issues found

Recommended fixes:
1. <specific actionable fix for FAIL #1>
2. <specific actionable fix for FAIL #2>
...
```

If everything passes, the report can be one line:
`INSPECTION COMPLETE. All checks PASS. Overall: CLEAN.`

---

## When to invoke this

**At scaffold time:** the `init-knowledge-base` skill invokes
inspection automatically via a Task-tool subagent. Output flows
back to the scaffolding session which fixes any FAILs.

**Post-scaffold:** invoke manually when:
- A KB has been sitting unused for a while and you want to
  confirm it's still in shape.
- You suspect maintenance has slipped (some files updated, others
  not).
- You're handing the KB to someone new and want to spot-check
  before handoff.
- Before a major project milestone where you want clean docs.

In post-scaffold use, some FAIL items may be intentional (e.g.,
a domain stub deliberately removed, a placeholder section
deliberately left as a TBD that hasn't been filled). The
inspection surfaces these for awareness; whether to "fix" them
is a judgment call.
