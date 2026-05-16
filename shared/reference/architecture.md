# Architecture

## What This Covers

Architecture knowledge for the Product Pipeline module: module boundary, relationship to Nexa-AOS, relationship to AppGenerator/App Builder, product artifact flow, GitHub Project integration, and parent KB writeback.

## Current Direction

Product Pipeline should sit above implementation and below raw human intent.

```text
Human idea
-> structured intake
-> research and comparative analysis
-> target focus and differentiator thesis
-> opportunity brief
-> epics and slices
-> GitHub issues / project board
-> ready-for-dev gate
-> AppGenerator or implementation agent
-> parent KB update
```

## Module Boundary

Product Pipeline is responsible for:

- Asking structured product questions.
- Running or coordinating research.
- Producing product artifacts that explain the opportunity and chosen direction.
- Slicing work into developable units.
- Creating or updating GitHub work items.
- Recording decisions, evidence, and task lineage in the parent KB.

Product Pipeline is not responsible for:

- Building the app shell.
- Owning the final project's runtime KB.
- Replacing a design module.
- Implementing developable tasks after they pass the ready-for-dev gate.
- Making unsupported claims without research evidence or human confirmation.

## Relationship To Nexa-AOS

Nexa-AOS owns the operating substrate: KB conventions, truth hierarchy, agent routing, module registry, and readiness rules. Product Pipeline should plug into that substrate as a callable module.

The module contract should eventually define:

- required input from the parent KB and human guidance,
- allowed outputs,
- required audit entries,
- GitHub Project mutations,
- verification evidence,
- escalation rules when the idea is too vague or risky.

## Relationship To AppGenerator

AppGenerator creates a strong base app foundation. Product Pipeline determines what that foundation should become.

The expected handoff is:

```text
Product Pipeline output
-> product brief, target user, first wedge, artifact list, feature slices
-> AppGenerator or App Builder shell
-> focused product build plan
```

Product Pipeline should not assume the AppGenerator stack before AppGenerator finalizes its own golden path.

## Relationship To Design

Design should remain a collaborating boundary for now. Product Pipeline may produce a design brief, brand/UX questions, emotional calling, audience expectations, and feature priorities. A future design module or designer can turn that into visual direction, interaction patterns, and design assets.

## Open Architecture Questions

- Does Product Pipeline first ship as a Codex skill, prompt pack, script, CLI, service, or module contract?
- Which artifact formats are mandatory for v0: opportunity brief, research brief, epic, story, task, or all of them?
- How much GitHub Project automation belongs in Product Pipeline versus Nexa core?
- What exact parent KB paths should Product Pipeline update after a run?
