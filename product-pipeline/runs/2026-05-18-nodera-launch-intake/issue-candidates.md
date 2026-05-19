# Issue Candidates - Nodera Launch Intake

## Candidate 1: Define Launch Packet Contract

## Title

Product Pipeline: Define reusable Launch Intake packet contract

## Work Type

Task

## Readiness Gate

Draft Ready

## Module Boundary

Product Pipeline

## Goal

Create a reusable launch packet artifact that captures a raw idea, target user, pain, first wedge, constraints, risks, and next module handoff.

## Context

Overwatch `#7` needs a small pilot idea that can scale later. Launch Intake is useful only if the packet becomes reusable across future Nodera product ideas.

## Non-Goals

- Do not create GitHub issues automatically.
- Do not build a UI.
- Do not create a broad form-builder schema.

## Acceptance Criteria

- [ ] Packet template exists in Product Pipeline artifacts.
- [ ] Packet fields map to Product Pipeline, KB Core, and AppBuilder handoff needs.
- [ ] Packet includes review status and next gate.

## Verification Plan

- Command or inspection: Review the packet against `product-pipeline/workflows/product-pipeline-v0.md` and Overwatch `planning/integration-contract-v0.md`.
- Expected result: Every required handoff field has a source or explicit non-goal.

## Files Or Artifacts Likely Affected

- `product-pipeline/templates/launch-intake-packet.md`
- `product-pipeline/workflows/product-pipeline-v0.md`
- `INDEX.md`

## Parent KB Updates

- Audit log: Record accepted Launch Intake packet.
- Decision log: Record why Launch Intake is the first pilot idea.
- Current state: Move Overwatch `#7` from idea selection to packet review.
- Index: Route Launch Intake packet and pilot run.

## Dependencies Or Blockers

- Dependency: Richard or Overwatch approval of this proposal.
- Blocker: None for artifact work.

## Traceability

- Human guidance: "light idea", "re-use / scale later", "optimizing and scalability / reuse".
- Research or decision: Research brief and opportunity brief in this run.
- Source artifact: `product-pipeline/runs/2026-05-18-nodera-launch-intake/`.

## Candidate 2: Initialize Launch Intake Pilot KB

## Title

KB Core: Initialize Launch Intake pilot KB from accepted bootstrap path

## Work Type

Task

## Readiness Gate

Draft Ready

## Module Boundary

Parent KB

## Goal

Initialize a lightweight pilot KB for Launch Intake using Nexa-AOS bootstrap tooling after the packet contract is accepted.

## Context

Nexa-AOS D4/D5 productization is complete. The pilot should use the normal template-bootstrap path unless a local constraint requires the from-scratch fallback.

## Non-Goals

- Do not create a GitHub repo by default.
- Do not build the AppBuilder screen.
- Do not extract a private template repo.

## Acceptance Criteria

- [ ] Pilot KB exists and records scaffold lineage.
- [ ] Pilot KB links to the Product Pipeline run and Overwatch `#7`.
- [ ] Scaffold/health checks pass.

## Verification Plan

- Command or inspection: Run the appropriate Nexa-AOS bootstrap verifier and inspect generated `CURRENT-STATE.md`, `AUDIT-LOG.md`, and `INDEX.md`.
- Expected result: Generated KB is routeable, selected-mode correct, and lineage is present.

## Files Or Artifacts Likely Affected

- Future pilot KB path.
- Overwatch `CURRENT-STATE.md`.
- Overwatch `AUDIT-LOG.md`.

## Parent KB Updates

- Audit log: Record pilot KB initialization and verification.
- Decision log: Record pilot KB location and scaffold mode.
- Current state: Move `#7` to AppBuilder substrate decision.
- Index: Route pilot KB if it lives in the repo family.

## Dependencies Or Blockers

- Dependency: Accepted launch packet contract.
- Blocker: Decide destination path and scaffold mode.

## Traceability

- Human guidance: Keep the pilot small and reusable.
- Research or decision: D4/D5 completion in Nexa-AOS.
- Source artifact: Overwatch `#3` closeout and this pilot run.

## Candidate 3: Add Optional Command-Center Intake Surface

## Title

AppBuilder: Add minimal Launch Intake screen to command-center proof

## Work Type

Story

## Readiness Gate

Blocked

## Module Boundary

AppGenerator

## Goal

Add a small visible intake screen using the existing AppBuilder proof after deciding whether the pilot uses the local proof as-is or first promotes/backs up the domain-neutral packet.

## Context

The screen should prove reusable UI flow, not launch a full product. It can later become the front door for paid/hosted Nodera product intake.

## Non-Goals

- Do not add persistence.
- Do not add authentication changes.
- Do not add billing.
- Do not make the Nodera overlay the generic template by accident.

## Acceptance Criteria

- [ ] Screen captures packet fields or displays a static packet prototype.
- [ ] UI uses existing reusable AppBuilder components.
- [ ] Verification passes with lint, typecheck, tests, build, and browser smoke.
- [ ] AppGenerator and Overwatch KBs record the handoff.

## Verification Plan

- Command or inspection: Run AppBuilder template verification and browser smoke.
- Expected result: Existing routes still work and Launch Intake screen is visible.

## Files Or Artifacts Likely Affected

- `C:/Projects/Nexa-BareAppFoundation-v0`
- `C:/Projects/Nexa-AppGenerator`
- `C:/Projects/NoderaOS-Overwatch`

## Parent KB Updates

- Audit log: Record app proof and browser smoke.
- Decision log: Record substrate choice.
- Current state: Move pilot into review/writeback.
- Index: Route app proof docs.

## Dependencies Or Blockers

- Dependency: Accepted packet contract and pilot KB.
- Blocker: AppBuilder substrate decision.

## Traceability

- Human guidance: Reusable/scalable, do not overbuild.
- Research or decision: AppBuilder packet v0 and GitHub-enriched manifest proof.
- Source artifact: Candidate 1 and Candidate 2.
