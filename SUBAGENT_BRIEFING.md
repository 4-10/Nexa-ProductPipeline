# Nexa Product Pipeline Subagent Briefing

You were spawned with a narrow task and blank context. This module is about turning product ideas into researched, developable backlog for Nexa. Do not jump from a vague idea directly into implementation issues.

## Required Pre-Flight

- [ ] Read `INDEX.md` and route by keywords.
- [ ] Read `README.md` to understand the temporary KB boundary.
- [ ] Read `projects/nexa-productpipeline/CURRENT-STATE.md` and run the verification rule relevant to your task.
- [ ] Read `projects/nexa-productpipeline/DECISION-LOG.md` for boundary and design decisions.
- [ ] Read recent entries in `projects/nexa-productpipeline/AUDIT-LOG.md`.
- [ ] Scan `projects/nexa-productpipeline/OPEN-DEFECTS.md` for risks tagged to your area.
- [ ] If creating or slicing work, read `projects/nexa-productpipeline/how-to/backlog-and-feature-slicing.md`.

## Routing Table

| If your task mentions | Read |
|---|---|
| architecture, boundary, parent KB, module outputs | `shared/reference/architecture.md`, `shared/reference/parent-kb-integration.md` |
| product strategy, velocity, backlog drought, why this module exists | `shared/reference/product-strategy.md` |
| intake, questions, agile flow, artifact ladder | `shared/reference/intake-to-artifacts.md` |
| research, discovery, evidence, market | `shared/reference/research-discovery.md` |
| competitors, alternatives, differentiation | `shared/reference/comparative-analysis.md` |
| GitHub issues, project board, ready-for-dev, task creation | `shared/reference/backlog-generation.md`, `projects/nexa-productpipeline/how-to/backlog-and-feature-slicing.md` |
| designer, UX, brand, visual direction, design module | `shared/reference/design-collaboration.md` |
| current repo/project/tool state | `projects/nexa-productpipeline/STATE-SNAPSHOT.md` |

## Operating Rules

1. Preserve the distinction between this temporary build KB and the final module behavior.
2. The final module should write into the parent KB, not create an isolated KB for each product pipeline run.
3. Keep research separate from implementation slicing until the opportunity and target focus are clear.
4. Use GitHub Issues and the GitHub Project for live task tracking. Use the KB for durable reasoning, rules, and audit.
5. If you discover a non-obvious decision, update `DECISION-LOG.md`. If you make a meaningful change, update `AUDIT-LOG.md`.
6. Do not store secrets, private customer data, proprietary paid research dumps, or sensitive credentials in this KB.

## Output Expectations

When reporting back, include:

- Files or GitHub artifacts changed.
- Verification performed.
- Decisions made or open decisions that need Richard.
- Follow-up work that should become GitHub issues or project items.
