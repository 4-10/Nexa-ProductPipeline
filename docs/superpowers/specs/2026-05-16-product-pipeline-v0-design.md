# Product Pipeline v0 Design

## Status

Draft for Richard review.

## Purpose

Product Pipeline v0 turns high-level human product direction into researched, structured, developable work for Nexa. It exists because implementation speed can outrun backlog quality. The module must create enough product clarity that build agents can keep moving without inventing strategy.

The v0 artifact should be a workflow/skill first. It should not start as an app, service, database, or broad automation layer.

## Goals

- Guide a human from raw product idea to clear product direction.
- Run a lightweight but real research stage before generating build work.
- Produce durable product artifacts that future agents can read from the parent KB.
- Generate epics and task/story candidates only when the confidence level supports them.
- Mark work as ready for development only when it has enough context, acceptance criteria, non-goals, and verification.
- Preserve a clean handoff to AppGenerator/App Builder and a future design module.
- Feed GitHub Issues and Projects after the artifact shape is proven.

## Non-Goals

- Product Pipeline v0 will not build the application shell.
- Product Pipeline v0 will not replace AppGenerator, App Builder, or implementation agents.
- Product Pipeline v0 will not own a separate runtime KB for generated products.
- Product Pipeline v0 will not execute full visual design or brand systems.
- Product Pipeline v0 will not automatically create many GitHub issues from weak or unsupported direction.
- Product Pipeline v0 will not require every idea to pass through a heavy hierarchy of epic, feature, story, and task.

## Recommended V0 Shape

Build Product Pipeline first as a Codex-compatible workflow/skill backed by Markdown artifact templates and parent-KB update rules.

The workflow should be dogfooded manually before GitHub automation is added. The first proof is whether Product Pipeline can create excellent Product Pipeline tasks for its own repo.

## Module Boundary

Product Pipeline owns:

- product intake,
- research prompts and evidence capture,
- comparative analysis,
- target market focus,
- differentiator thesis,
- emotional-calling synthesis,
- opportunity brief,
- epic map,
- task/story candidates,
- ready-for-dev gate,
- design-needed gate,
- GitHub issue/project output rules,
- parent KB update instructions.

Product Pipeline does not own:

- final app generation,
- implementation work,
- runtime project memory,
- final visual design execution,
- deployment,
- production operations.

## Workflow

```text
Human idea
-> parent KB catchup
-> structured intake
-> research plan
-> research and comparative analysis
-> opportunity brief
-> epic map
-> story/task candidates when safe
-> design-needed or ready-for-dev gate
-> GitHub output proposal
-> parent KB updates
```

## Inputs

Required inputs:

- Human product idea or product direction.
- Active parent KB path.
- Current parent KB state, decisions, open defects, and product notes.
- Target output request: explore, research, plan, create backlog, or refine existing backlog.

Optional inputs:

- Competitors or analogs.
- Target user or buyer guesses.
- Existing AppGenerator/App Builder output.
- Design constraints or brand direction.
- GitHub repo and Project target.

## Outputs

V0 should produce these artifacts in order.

### Intake Notes

Purpose: preserve human intent and constraints.

Includes:

- original idea,
- target user or buyer,
- pain or opportunity,
- desired outcome,
- constraints,
- first-version appetite,
- emotional tone,
- unclear assumptions.

### Research Brief

Purpose: gather enough evidence to avoid shallow backlog generation.

Includes:

- research questions,
- sources or evidence notes,
- market or workflow findings,
- current alternatives,
- open unknowns,
- confidence level.

### Comparative Analysis

Purpose: understand alternatives and differentiation.

Includes:

- direct competitors when applicable,
- adjacent tools or manual workarounds,
- strengths and weaknesses,
- differentiator opportunities,
- implications for the first wedge.

### Opportunity Brief

Purpose: choose the product direction.

Includes:

- target market focus,
- user pain,
- first wedge,
- differentiator thesis,
- emotional calling,
- risks,
- non-goals,
- recommended next move.

### Epic Map

Purpose: structure the product into capability areas.

Includes:

- 3 to 7 epics when the product is broad,
- goal and non-goal for each epic,
- dependency and design notes,
- confidence level.

### Story/Task Candidates

Purpose: produce developable work only when safe.

Includes:

- goal,
- context,
- non-goals,
- acceptance criteria,
- verification plan,
- likely files or modules,
- parent KB updates required,
- dependency or blocker notes.

## Readiness Gates

Product Pipeline should classify every output candidate.

### Intake

The idea is captured but not researched.

### Research

The next best work is evidence gathering or comparison.

### Spec

The direction is clear enough to draft product artifacts, but not enough for implementation.

### Draft Ready

The work can be reviewed as an issue candidate, but needs human or design confirmation.

### Dev Ready

The task is claimable by a build agent.

Dev Ready requires:

- clear goal,
- useful context,
- explicit non-goals,
- acceptance criteria,
- verification plan,
- dependency notes,
- design status,
- parent KB update expectation,
- traceability to research, human guidance, or a decision entry.

### Blocked

The work cannot proceed because a human decision, design artifact, parent KB correction, or dependency is missing.

## Design Collaboration

Keep design separate from Product Pipeline in v0, but include a lightweight design brief and a design-needed gate.

Product Pipeline may produce:

- target user,
- emotional tone,
- brand adjectives and anti-adjectives,
- user workflow priorities,
- key surfaces,
- open design questions,
- design-needed issue candidates.

Product Pipeline should not produce:

- final UI mockups,
- full visual systems,
- production assets,
- detailed component specs unless the user explicitly asks for a design-oriented pass.

If visual direction is required for implementation, the task should be `Draft Ready` or `Blocked`, not `Dev Ready`.

## Parent KB Integration

The final module writes into the active parent KB. It does not create a separate runtime KB.

At minimum, Product Pipeline should update or propose updates to:

- parent project `AUDIT-LOG.md`,
- parent project `DECISION-LOG.md` for product decisions,
- product strategy or product artifacts folder,
- `CURRENT-STATE.md` when the active product focus changes,
- `INDEX.md` when new product docs are added,
- GitHub issue/project references when work is created.

Every generated task should trace back to:

- human guidance,
- research or explicit assumption,
- parent KB context,
- decision entry when applicable,
- verification expectation.

## GitHub Output

V0 should not immediately auto-create issues by default. It should first generate a reviewable GitHub output proposal.

After human approval, it can create:

- research spikes,
- epics,
- stories,
- tasks,
- design-needed issues,
- defects or KB correction issues.

The GitHub Project fields should be set as follows:

- `Work Type`: research, epic, story, task, design, KB ops, defect.
- `Readiness Gate`: intake, research, spec, draft ready, dev ready, blocked.
- `Module Boundary`: Product Pipeline, Parent KB, AppGenerator, Design Module, GitHub Project.

## Error Handling And Escalation

Product Pipeline should stop or ask for human input when:

- the target user is unknown and cannot be reasonably inferred,
- research finds contradictory direction,
- the first wedge is unclear,
- design is required before build work,
- AppGenerator assumptions are unstable,
- parent KB state conflicts with the requested output,
- a task would be too vague or too broad to claim.

When blocked, it should produce a short blocker note and the smallest next research or decision question.

## Testing And Verification

V0 verification should focus on artifact quality before automation.

Acceptance checks:

- Given a raw product idea, the workflow produces intake notes, research questions, opportunity brief, epic map, and issue candidates.
- Generated task candidates include non-goals, acceptance criteria, verification, dependencies, and parent KB update expectations.
- No task is marked Dev Ready when design, research, or human decision blockers remain.
- The workflow can dogfood itself by producing high-quality Product Pipeline issues.
- Parent KB update instructions are explicit.
- GitHub output proposal can be reviewed before issue creation.

Initial manual test:

Use Product Pipeline to turn the Product Pipeline module itself into 5 to 8 issue candidates for the new GitHub Project.

## First Implementation Slices After Approval

1. Create artifact templates for intake notes, research brief, comparative analysis, opportunity brief, epic map, and issue candidates.
2. Create a Product Pipeline workflow skill or prompt pack that uses those templates.
3. Dogfood the workflow on this repo and produce the first issue proposal.
4. Add GitHub issue/project creation only after the proposal format is approved.
5. Register the module contract back in Nexa-AOS when the workflow is stable enough.

## Open Questions For Richard

- Should v0 issue creation require explicit approval every time, or can trusted runs auto-create research spikes?
- Should Product Pipeline use the existing Nexa safe-task claim protocol immediately, or wait until implementation work starts?
- Should the first module artifact live as a Codex skill under this repo, a Nexa-AOS skill, or both during development?
