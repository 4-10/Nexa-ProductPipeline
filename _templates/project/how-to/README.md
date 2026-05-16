# {{PROJECT_NAME}} — how-to/

Project-specific procedures. Step-by-step recipes for tasks that
come up in this project specifically. (Procedures that apply across
projects belong in `shared/how-to/` instead.)

## When to add a how-to

Add one when:

- You did a task and you know you (or a future session) will do it
  again.
- The task has gotchas that aren't obvious from the code.
- The task takes more than a single command and has decision points.
- A subagent attempted this and got it wrong — write the how-to so
  the next attempt doesn't.

Don't add one for:

- A one-off task you won't repeat.
- Something already covered by another how-to (extend the existing
  one).
- A task that's documented at length in `shared/reference/` (link
  to the reference instead).

## Convention

Each how-to is a single markdown file named after the task in
kebab-case: `deploy-to-staging.md`, `add-feature-flag.md`,
`rotate-credentials.md`.

The first thing in the file is a "Read first" pointer to any
relevant reference doc:

```markdown
> **Read first:** `path/to/reference.md` -
> background on why this procedure exists / how the underlying
> system works.
```

The how-to is the procedure; the reference is the mechanics. Don't
duplicate the mechanics in the how-to.

See `_example.md` in this folder for the recommended structure.

## Registering

Every new how-to must be registered in the project's section of
the top-level `INDEX.md`. Unregistered how-tos are invisible.
