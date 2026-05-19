# Product Pipeline v0 Workflow

## Purpose

Run this workflow when a human gives a product idea and wants researched, developable Nexa backlog output.

## Operating Rule

Do not create GitHub issues until the GitHub output proposal has been reviewed and approved.

## Step 1: Parent KB Catchup

1. Identify the active parent KB.
2. Read the parent KB `INDEX.md`.
3. Read the active project `CURRENT-STATE.md`, `AUDIT-LOG.md`, and `DECISION-LOG.md`.
4. Note any product constraints, open decisions, and defects that affect the idea.

## Step 2: Intake

Use `product-pipeline/templates/intake-notes.md`.

Capture the raw human idea, target user, pain, desired outcome, constraints, first-version appetite, and emotional signal.

If the target user, pain, or outcome is unclear, ask one question before continuing.

## Step 3: Research Plan

Use `product-pipeline/templates/research-brief.md`.

Write 3 focused research questions. Research should answer what affects the first wedge, not every market curiosity.

## Step 4: Comparative Analysis

Use `product-pipeline/templates/comparative-analysis.md`.

Compare direct competitors, adjacent tools, manual workflows, and the option of not building yet.

## Step 5: Opportunity Brief

Use `product-pipeline/templates/opportunity-brief.md`.

Choose target focus, first wedge, differentiator thesis, emotional calling, risks, and recommendation.

## Step 6: Epic Map

Use `product-pipeline/templates/epic-map.md`.

Create 3 to 7 epics only when the product direction is broad enough to need epics. If the idea is narrow, create one epic and a small task set.

## Step 7: Issue Candidates

Use `product-pipeline/templates/issue-candidate.md`.

Create task or story candidates only when they have clear scope, non-goals, acceptance criteria, verification, dependencies, and parent KB update expectations.

## Step 8: Readiness Gate

Use `product-pipeline/checklists/readiness-gate.md`.

Classify each candidate as Intake, Research, Spec, Draft Ready, Dev Ready, or Blocked.

## Step 8A: Launch Intake Packet

Use `product-pipeline/templates/launch-intake-packet.md` when the run is intended to become a pilot, generated app, hosted intake surface, managed sprint, or other reusable launch workflow.

The packet must map Product Pipeline artifacts to KB Core and AppBuilder handoff needs. It must name review status, current gate, next gate, non-goals, and any blocked decisions. Do not treat the packet as permission to create GitHub issues or build a UI.

If a reviewed packet draft already exists in a parent KB, `product-pipeline/tools/New-ProductPipelineRunFromPacket.ps1` can generate the first full artifact run and review-gated proposal. Review and edit that generated run before considering live GitHub output.

## Step 9: Design Gate

Use `product-pipeline/checklists/design-needed-gate.md`.

If visual direction is required, produce `product-pipeline/templates/design-brief.md` output and keep the build task out of Dev Ready.

## Step 10: GitHub Output Proposal

Create or update a proposal under `product-pipeline/proposals/`.

The proposal must include issue title, body, labels, Work Type, Readiness Gate, Module Boundary, and whether the item should be created now.

## Step 11: Parent KB Update Plan

Use `product-pipeline/templates/parent-kb-update-plan.md`.

List audit, decision, current-state, index, and product artifact updates required in the parent KB.

## Step 12: Review Checkpoint

Stop and ask Richard to approve the proposal before creating GitHub issues, unless a future decision explicitly allows auto-creation for a narrow class of trusted research spikes.
