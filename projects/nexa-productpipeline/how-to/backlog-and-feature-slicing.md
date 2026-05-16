# Backlog And Feature Slicing

Use this when turning Product Pipeline ideas into safe, focused implementation or research work.

## Live Tracking

- Live work queue: GitHub Issues in `4-10/Nexa-ProductPipeline`.
- Planning board: GitHub Project `Nexa Product Pipeline` at `https://github.com/users/4-10/projects/4`.
- Durable process and decisions: this KB.

## Principles

- Separate research spikes from implementation stories.
- Do not make a story ready for dev until the product direction and verification plan are clear.
- Use epic-level work when the idea is still broad.
- Use task-level work only when the expected artifact is bounded.
- Capture design dependencies explicitly.
- Record non-obvious product choices in `DECISION-LOG.md`.

## Recommended Issue Types

### Research Spike

Use when the output is a finding, comparison, decision, or recommendation.

Good examples:

- Compare Product Pipeline artifact formats.
- Research how product discovery workflows should map to GitHub issues.
- Evaluate whether v0 should include design brief generation.

### Epic

Use when the output is a coherent capability area that still needs slicing.

Good examples:

- Product intake and questioning flow.
- Research and comparative analysis engine.
- GitHub Project issue-generation workflow.

### Story

Use when the output is user-visible or agent-visible behavior.

Good examples:

- As a product lead, I can provide an idea and receive an opportunity brief.
- As a build agent, I can claim only tasks that passed the ready-for-dev gate.

### Task

Use when the output is a bounded implementation, documentation, or operational artifact.

### Defect

Use when an existing artifact is wrong, stale, broken, or misleading.

## Definition Of Ready

Before work starts, the issue should state:

- Goal.
- Context.
- Non-goals.
- Expected output artifact.
- Acceptance criteria.
- Verification plan.
- Likely files or GitHub artifacts affected.
- KB update expectation.
- Dependencies or blockers.

## Definition Of Done

A task is done when:

- Acceptance criteria are satisfied.
- Required verification passes.
- Durable KB updates are made.
- GitHub Project status reflects reality.
- Follow-up work is recorded instead of left implicit.
- The final note says what changed and how it was verified.

## Ready-For-Dev Rule

Research and product artifacts may feed the backlog, but they do not make a task claimable by themselves. A dev-ready issue needs clear scope, non-goals, acceptance criteria, verification, dependency notes, and any required design handoff.

## Parallel Work

If multiple sessions work on Product Pipeline at once:

- Use GitHub Issues and the GitHub Project as the live coordination layer.
- Claim one task before editing files.
- Use a dedicated branch or worktree for implementation work.
- Do not silently take over another active claim.
- Verify live GitHub state before assuming a task is free.
