# GitHub Output Proposal - Nodera Launch Intake Pilot

## Proposal Status

```yaml
status: review_needed
create_github_issues_now: false
parent_overwatch_issue: 4-10/NoderaOS-Overwatch#7
product_pipeline_run: product-pipeline/runs/2026-05-18-nodera-launch-intake
```

## Recommendation

Use **Nodera Launch Intake** as the first Overwatch `#7` pilot idea.

Do not create GitHub issues automatically from this proposal yet. If approved, create Candidate 1 first, then use its accepted packet contract to decide Candidate 2 and Candidate 3.

## Why This Pilot

- It is small enough to avoid expensive implementation.
- It becomes reusable infrastructure for future Nodera ideas.
- It tests the actual operating loop: Product Pipeline -> KB Core -> AppBuilder handoff.
- It aligns with Richard's stated preference for optimization, scalability, and reuse.

## Candidate Issue 1

### Title

Product Pipeline: Define reusable Launch Intake packet contract

### Body

Goal: Create a reusable launch packet artifact that captures a raw idea, target user, pain, first wedge, constraints, risks, and next module handoff.

Context: Overwatch `#7` needs a small pilot idea that can scale later. Launch Intake is useful only if the packet becomes reusable across future Nodera product ideas.

Non-goals:

- Do not create GitHub issues automatically.
- Do not build a UI.
- Do not create a broad form-builder schema.

Acceptance criteria:

- Packet template exists in Product Pipeline artifacts.
- Packet fields map to Product Pipeline, KB Core, and AppBuilder handoff needs.
- Packet includes review status and next gate.

Verification:

- Review the packet against `product-pipeline/workflows/product-pipeline-v0.md`.
- Review the packet against `C:/Projects/NoderaOS-Overwatch/kb/projects/noderaos-overwatch/planning/integration-contract-v0.md`.

### Labels And Fields

```yaml
labels:
  - type:task
  - area:product-pipeline
  - priority:p1
work_type: Task
readiness_gate: Draft Ready
module_boundary: Product Pipeline
create_now: false
```

## Candidate Issue 2

### Title

KB Core: Initialize Launch Intake pilot KB from accepted bootstrap path

### Body

Goal: Initialize a lightweight pilot KB for Launch Intake using Nexa-AOS bootstrap tooling after the packet contract is accepted.

Context: Nexa-AOS D4/D5 productization is complete. The pilot should use the normal template-bootstrap path unless a local constraint requires the from-scratch fallback.

Non-goals:

- Do not create a GitHub repo by default.
- Do not build the AppBuilder screen.
- Do not extract a private template repo.

Acceptance criteria:

- Pilot KB exists and records scaffold lineage.
- Pilot KB links to the Product Pipeline run and Overwatch `#7`.
- Scaffold/health checks pass.

Verification:

- Run the appropriate Nexa-AOS bootstrap verifier.
- Inspect generated `CURRENT-STATE.md`, `AUDIT-LOG.md`, and `INDEX.md`.

### Labels And Fields

```yaml
labels:
  - type:task
  - area:nexa-core
  - priority:p1
work_type: Task
readiness_gate: Draft Ready
module_boundary: Parent KB
create_now: false
```

## Candidate Issue 3

### Title

AppBuilder: Add minimal Launch Intake screen to command-center proof

### Body

Goal: Add a small visible intake screen using the existing AppBuilder proof after deciding whether the pilot uses the local proof as-is or first promotes/backs up the domain-neutral packet.

Context: The screen should prove reusable UI flow, not launch a full product. It can later become the front door for paid/hosted Nodera product intake.

Non-goals:

- Do not add persistence.
- Do not add authentication changes.
- Do not add billing.
- Do not make the Nodera overlay the generic template by accident.

Acceptance criteria:

- Screen captures packet fields or displays a static packet prototype.
- UI uses existing reusable AppBuilder components.
- Verification passes with lint, typecheck, tests, build, and browser smoke.
- AppGenerator and Overwatch KBs record the handoff.

Verification:

- Run AppBuilder template verification and browser smoke.
- Confirm existing routes still work and Launch Intake screen is visible.

### Labels And Fields

```yaml
labels:
  - type:story
  - area:appbuilder
  - priority:p1
  - status:blocked
work_type: Story
readiness_gate: Blocked
module_boundary: AppGenerator
create_now: false
```

## Review Checkpoint

This proposal intentionally stops before GitHub issue creation.

Review decision needed:

- Approve Launch Intake as the Overwatch `#7` pilot idea.
- Approve whether Candidate 1 should become the first live issue.
- Decide whether Candidate 2 can follow immediately after Candidate 1, or whether the pilot KB should be initialized manually by Overwatch first.
- Keep Candidate 3 blocked until the AppBuilder substrate decision is made.
