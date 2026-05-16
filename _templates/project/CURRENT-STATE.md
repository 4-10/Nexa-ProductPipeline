# {{PROJECT_NAME}} — CURRENT STATE

**Last updated:** {{YYYY-MM-DD}}
**Updated by:** {{name or "Claude session N"}}

---

## Active focus

> What's the current major effort? One short paragraph. Replace
> the placeholder, don't leave it.

## Last action taken

> The most recent meaningful change. Specific enough that a fresh
> session knows what was done, by whom, and what state the project
> is in as a result.

## Next intended move

> What you'll do next — concrete steps. If this is an "awaiting
> human review" state, say so explicitly and note what's being
> awaited.

## Open decisions (deferred for input)

- {{Each bullet should be a question or a fork in the road that
  someone — usually the human — needs to weigh in on.}}
- {{If empty, write "(none currently)" so a reader knows you
  thought about it.}}

## State health (verify before trusting these claims)

> Table of "expected state" vs "how to verify." This is what makes
> this doc safe to act on without re-deriving from scratch.

| Component | Expected state | Verify with |
|---|---|---|
| {{e.g., service / container / job}} | {{e.g., up, healthy, last deploy YYYY-MM-DD}} | {{exact command or check to run}} |
| {{e.g., database}} | {{schema version N, X rows in Y table}} | {{exact query}} |
| {{e.g., source repo}} | {{branch / commit hash}} | `git -C {{path}} log -3 --oneline` |

## Recent significant artifacts

> Files, configs, scripts, or commits recently touched. Helps a
> fresh session orient quickly to where the action is.

- `{{relative/path/to/file}}` — {{one-line description of what's there}}
- ...

## Active testbed / test environment

> Which environment, account, character, or fixture to use for
> testing. Note any contaminated or special test setups.

## Failure modes to watch for

> If a known issue could resurface, document the diagnostic step
> here so a future session doesn't re-derive from scratch.

- **{{symptom}}** — {{what to check / how to mitigate}}

---

## Verification rule (MANDATORY for sessions reading this doc)

Before acting on the claims above:

1. Check the date at top — if more than ~1 day old, treat as suspect.
2. Run the verification commands in the "State health" table above.
3. Read top 3 entries of `AUDIT-LOG.md` — do they corroborate the
   "Last action taken" above?
4. Spot-check at least one specific claim that matters to your
   current task using a direct query / file inspection / command.

If any check disagrees, **the doc is stale and lying.** Update it
before acting. The maintenance discipline (`_meta/maintenance-discipline.md`)
is mandatory; this verification rule exists because that discipline
sometimes slips.
