# Product Pipeline v0 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build Product Pipeline v0 as a workflow/skill-first module with artifact templates, readiness gates, a dogfood issue proposal, and a review-gated GitHub creation path.

**Architecture:** Add a focused `product-pipeline/` module artifact area inside this repo. Keep runtime behavior as Markdown workflow instructions and templates first, then prove the workflow by generating a reviewed issue proposal before creating GitHub issues.

**Tech Stack:** Markdown, GitHub CLI, GitHub Issues, GitHub Projects v2, Codex skills/workflows, Nexa KB conventions.

---

## File Structure

Create or modify these files:

- Create `product-pipeline/README.md` - explains the v0 module artifact area and current boundaries.
- Create `product-pipeline/templates/intake-notes.md` - template for capturing human guidance.
- Create `product-pipeline/templates/research-brief.md` - template for research questions, findings, and confidence.
- Create `product-pipeline/templates/comparative-analysis.md` - template for alternatives and differentiator analysis.
- Create `product-pipeline/templates/opportunity-brief.md` - template for target focus, wedge, emotional calling, and recommendation.
- Create `product-pipeline/templates/epic-map.md` - template for capability grouping.
- Create `product-pipeline/templates/issue-candidate.md` - template for buildable issue candidates.
- Create `product-pipeline/templates/design-brief.md` - lightweight design handoff template.
- Create `product-pipeline/templates/parent-kb-update-plan.md` - template for parent KB writeback instructions.
- Create `product-pipeline/workflows/product-pipeline-v0.md` - main Product Pipeline v0 operating workflow.
- Create `product-pipeline/checklists/readiness-gate.md` - gate that prevents weak tasks from becoming dev-ready.
- Create `product-pipeline/checklists/design-needed-gate.md` - gate that keeps design dependencies explicit.
- Create `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md` - first dogfood output, proposing 8 Product Pipeline issues without creating them yet.
- Create `product-pipeline/how-to/create-github-output-from-proposal.md` - review-gated GitHub issue/project creation procedure.
- Modify `INDEX.md` - route the new module artifact area.
- Modify `projects/nexa-productpipeline/CURRENT-STATE.md` - update active focus after implementation slices.
- Modify `projects/nexa-productpipeline/AUDIT-LOG.md` - log each meaningful task.
- Modify `projects/nexa-productpipeline/DECISION-LOG.md` only if execution changes a boundary decision.

---

### Task 1: Create Artifact Template Set

**Files:**
- Create: `product-pipeline/README.md`
- Create: `product-pipeline/templates/intake-notes.md`
- Create: `product-pipeline/templates/research-brief.md`
- Create: `product-pipeline/templates/comparative-analysis.md`
- Create: `product-pipeline/templates/opportunity-brief.md`
- Create: `product-pipeline/templates/epic-map.md`
- Create: `product-pipeline/templates/issue-candidate.md`
- Create: `product-pipeline/templates/design-brief.md`
- Create: `product-pipeline/templates/parent-kb-update-plan.md`
- Modify: `INDEX.md`
- Modify: `projects/nexa-productpipeline/AUDIT-LOG.md`

- [ ] **Step 1: Create module directories**

Run:

```powershell
New-Item -ItemType Directory -Force product-pipeline, product-pipeline/templates
```

Expected: directories exist.

- [ ] **Step 2: Create `product-pipeline/README.md`**

Use this content:

````markdown
# Product Pipeline Module Artifacts

This folder contains the first implementation artifacts for Product Pipeline v0.

V0 is intentionally workflow-first. It proves the product artifact ladder before adding broad automation.

## Current Boundary

Product Pipeline v0 owns:

- structured product intake,
- research and comparison artifacts,
- opportunity synthesis,
- epic and issue candidate generation,
- readiness and design gates,
- parent KB update instructions,
- review-gated GitHub output.

Product Pipeline v0 does not own:

- implementation work,
- final app generation,
- visual design execution,
- a separate runtime KB for generated products.

## Layout

- `templates/` - reusable artifact templates.
- `workflows/` - operating instructions for running Product Pipeline.
- `checklists/` - readiness and dependency gates.
- `proposals/` - reviewable output proposals before GitHub creation.
- `how-to/` - repeatable procedures for using outputs.
````

- [ ] **Step 3: Create `product-pipeline/templates/intake-notes.md`**

Use this content:

````markdown
# Intake Notes

## Source

- Product idea:
- Human guidance:
- Parent KB path:
- Session date:

## Initial Product Shape

- Target user or buyer:
- Problem or opportunity:
- Desired outcome:
- First-version appetite:
- Constraints:
- Known examples or analogs:

## Emotional Signal

- Frustration to relieve:
- Confidence to create:
- Moment that should feel compelling:
- Words or phrases from the human worth preserving:

## Assumptions

- Explicit assumptions:
- Inferred assumptions:
- Assumptions needing confirmation:

## Next Best Step

- Recommended next artifact:
- Reason:
````

- [ ] **Step 4: Create `product-pipeline/templates/research-brief.md`**

Use this content:

````markdown
# Research Brief

## Research Goal

- Question this research should answer:
- Product decision this research should inform:

## Research Questions

- Question 1:
- Question 2:
- Question 3:

## Evidence Notes

| Source or observation | What it says | Confidence | Product implication |
|---|---|---|---|
|  |  |  |  |

## Market Or Workflow Findings

- Finding:
- Finding:
- Finding:

## Open Unknowns

- Unknown:
- Unknown:

## Recommendation

- Recommended next move:
- Confidence level:
- Why this is enough or not enough to create backlog:
````

- [ ] **Step 5: Create `product-pipeline/templates/comparative-analysis.md`**

Use this content:

````markdown
# Comparative Analysis

## Comparison Goal

- Product decision this comparison informs:
- Alternatives considered:

## Alternatives

### Alternative 1

- Who it serves:
- Core promise:
- What it does well:
- Where it falls short:
- What Product Pipeline should learn:
- Implication for first wedge:

### Alternative 2

- Who it serves:
- Core promise:
- What it does well:
- Where it falls short:
- What Product Pipeline should learn:
- Implication for first wedge:

### Alternative 3

- Who it serves:
- Core promise:
- What it does well:
- Where it falls short:
- What Product Pipeline should learn:
- Implication for first wedge:

## Differentiator Thesis

- Functional differentiator:
- Workflow differentiator:
- Emotional differentiator:
- Economic or speed advantage:

## Recommendation

- Direction to pursue:
- Direction to avoid:
- Reason:
````

- [ ] **Step 6: Create `product-pipeline/templates/opportunity-brief.md`**

Use this content:

````markdown
# Opportunity Brief

## Product Direction

- Product idea:
- Target market focus:
- Primary user:
- Buyer or sponsor:
- First wedge:

## Problem

- Pain:
- Current workaround:
- Why now:

## Differentiation

- Differentiator thesis:
- Emotional calling:
- What should feel meaningfully better:

## Scope

- In scope for first slice:
- Out of scope for first slice:
- Design dependency:
- AppGenerator dependency:

## Risks

- Product risk:
- Research risk:
- Design risk:
- Implementation risk:

## Recommendation

- Recommended epic map:
- Recommended next issue type:
- Readiness gate:
````

- [ ] **Step 7: Create `product-pipeline/templates/epic-map.md`**

Use this content:

````markdown
# Epic Map

## Product Direction

- Opportunity brief:
- Target user:
- First wedge:

## Epics

### Epic 1

- Goal:
- Non-goal:
- User or agent outcome:
- Dependencies:
- Readiness:

### Epic 2

- Goal:
- Non-goal:
- User or agent outcome:
- Dependencies:
- Readiness:

### Epic 3

- Goal:
- Non-goal:
- User or agent outcome:
- Dependencies:
- Readiness:

## Sequencing

- First:
- Second:
- Later:

## Notes

- Design-needed items:
- Research-needed items:
- Parent KB updates:
````

- [ ] **Step 8: Create `product-pipeline/templates/issue-candidate.md`**

Use this content:

````markdown
# Issue Candidate

## Title

## Work Type

Choose one: Research Spike, Discovery, Epic, Story, Task, Design, KB Ops, Defect.

## Readiness Gate

Choose one: Intake, Research, Spec, Draft Ready, Dev Ready, Blocked.

## Module Boundary

Choose one: Product Pipeline, Parent KB, AppGenerator, Design Module, GitHub Project.

## Goal

## Context

## Non-Goals

## Acceptance Criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Verification Plan

- Command or inspection:
- Expected result:

## Files Or Artifacts Likely Affected

- Path or artifact:

## Parent KB Updates

- Audit log:
- Decision log:
- Current state:
- Index:

## Dependencies Or Blockers

- Dependency:
- Blocker:

## Traceability

- Human guidance:
- Research or decision:
- Source artifact:
````

- [ ] **Step 9: Create `product-pipeline/templates/design-brief.md`**

Use this content:

````markdown
# Design Brief

## Product Context

- Opportunity brief:
- Target user:
- First wedge:

## Emotional Direction

- Feeling to create:
- Frustration to relieve:
- Brand adjectives:
- Brand anti-adjectives:

## User Workflows

- Critical workflow:
- Secondary workflow:
- Moments of uncertainty:

## Design Questions

- Question:
- Question:
- Question:

## Handoff Status

- Design-needed issue:
- Build tasks blocked by design:
- Build tasks safe without design:
````

- [ ] **Step 10: Create `product-pipeline/templates/parent-kb-update-plan.md`**

Use this content:

````markdown
# Parent KB Update Plan

## Parent KB

- Path:
- Active project:

## Updates Required

### Audit Log

- Entry summary:
- Files or GitHub artifacts:
- Verification:

### Decision Log

- Decision:
- Context:
- Consequences:

### Current State

- Active focus change:
- Last action:
- Next intended move:

### Index

- New routing entries:
- Updated routing entries:

### Product Artifacts

- New artifact paths:
- Updated artifact paths:

## Completion Check

- [ ] Parent KB audit entry is written.
- [ ] Parent KB decisions are recorded.
- [ ] Parent KB current state reflects the new product direction.
- [ ] New product docs are routed from the parent KB index.
- [ ] GitHub issue or project references are linked.
````

- [ ] **Step 11: Register templates in `INDEX.md`**

Add these entries under `Product Pipeline Reference`:

```markdown
- **module artifacts, product pipeline templates, intake notes, research brief, opportunity brief** -> `product-pipeline/README.md`
- **intake notes template, human guidance capture** -> `product-pipeline/templates/intake-notes.md`
- **research brief template, evidence capture, research questions** -> `product-pipeline/templates/research-brief.md`
- **comparative analysis template, alternatives, differentiators** -> `product-pipeline/templates/comparative-analysis.md`
- **opportunity brief template, target market, first wedge, emotional calling** -> `product-pipeline/templates/opportunity-brief.md`
- **epic map template, capability map, sequencing** -> `product-pipeline/templates/epic-map.md`
- **issue candidate template, acceptance criteria, readiness gate** -> `product-pipeline/templates/issue-candidate.md`
- **design brief template, design-needed handoff** -> `product-pipeline/templates/design-brief.md`
- **parent KB update plan template, audit, decision, current state writeback** -> `product-pipeline/templates/parent-kb-update-plan.md`
```

- [ ] **Step 12: Verify Task 1**

Run:

```powershell
rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline INDEX.md
git diff --check
```

Expected: no unresolved placeholder matches in `product-pipeline/` or `INDEX.md`; `git diff --check` exits successfully.

- [ ] **Step 13: Log Task 1**

Append to `projects/nexa-productpipeline/AUDIT-LOG.md`:

```markdown
## 2026-05-16 - Add Product Pipeline artifact templates

**What:** Added the first Product Pipeline v0 artifact template set and routed the templates from `INDEX.md`.

**Why:** The workflow needs concrete artifacts before GitHub automation can safely create issues.

**Files:** `product-pipeline/README.md`, `product-pipeline/templates/*`, `INDEX.md`.

**Verification:** `rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline INDEX.md` returned no unresolved template placeholders; `git diff --check` passed.
```

- [ ] **Step 14: Commit Task 1**

Run:

```powershell
git add product-pipeline/README.md product-pipeline/templates INDEX.md projects/nexa-productpipeline/AUDIT-LOG.md
git commit -m "Add Product Pipeline artifact templates"
```

Expected: commit succeeds.

---

### Task 2: Create Workflow And Gate Instructions

**Files:**
- Create: `product-pipeline/workflows/product-pipeline-v0.md`
- Create: `product-pipeline/checklists/readiness-gate.md`
- Create: `product-pipeline/checklists/design-needed-gate.md`
- Modify: `INDEX.md`
- Modify: `projects/nexa-productpipeline/AUDIT-LOG.md`

- [ ] **Step 1: Create directories**

Run:

```powershell
New-Item -ItemType Directory -Force product-pipeline/workflows, product-pipeline/checklists
```

Expected: directories exist.

- [ ] **Step 2: Create `product-pipeline/workflows/product-pipeline-v0.md`**

Use this content:

````markdown
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
````

- [ ] **Step 3: Create `product-pipeline/checklists/readiness-gate.md`**

Use this content:

````markdown
# Readiness Gate

Use this checklist before marking a Product Pipeline output as Dev Ready.

## Dev Ready Requirements

- [ ] Goal is clear.
- [ ] Context explains why the work matters.
- [ ] Non-goals prevent scope drift.
- [ ] Acceptance criteria are testable.
- [ ] Verification plan is specific.
- [ ] Dependencies are listed.
- [ ] Design status is explicit.
- [ ] Parent KB update expectation is listed.
- [ ] Traceability points to human guidance, research, or a decision entry.

## Gate Outcomes

### Intake

Use when the idea is captured but not researched.

### Research

Use when evidence gathering or comparison is the next best work.

### Spec

Use when direction is clear enough for artifact drafting but not for implementation.

### Draft Ready

Use when the issue candidate can be reviewed but needs human or design confirmation.

### Dev Ready

Use only when every Dev Ready requirement is satisfied.

### Blocked

Use when a decision, design artifact, parent KB correction, or dependency is missing.

## Failure Rule

If any Dev Ready requirement is missing, do not mark the item Dev Ready.
````

- [ ] **Step 4: Create `product-pipeline/checklists/design-needed-gate.md`**

Use this content:

````markdown
# Design-Needed Gate

Use this gate when Product Pipeline output might require visual, interaction, or brand direction before implementation.

## Questions

- Does the task require layout, visual hierarchy, or brand tone?
- Does the user need to inspect a UI before build work starts?
- Would implementation create visible product commitments without design input?
- Are brand adjectives, anti-adjectives, or emotional tone missing?
- Does the task affect a primary workflow or first impression?

## Outcomes

### No Design Needed

The task can proceed with existing design conventions or no visible UI.

### Lightweight Design Brief Needed

Create `product-pipeline/templates/design-brief.md` output and keep the work at Draft Ready until reviewed.

### Dedicated Design Issue Needed

Create a design issue candidate and keep dependent implementation tasks Blocked.

## Rule

Do not mark a visible implementation task Dev Ready when required design direction is missing.
````

- [ ] **Step 5: Register workflow and gates in `INDEX.md`**

Add these entries under `Product Pipeline Reference`:

```markdown
- **product pipeline v0 workflow, run product pipeline, product idea to backlog** -> `product-pipeline/workflows/product-pipeline-v0.md`
- **readiness gate, dev ready, draft ready, blocked, issue candidate quality** -> `product-pipeline/checklists/readiness-gate.md`
- **design-needed gate, design handoff, visual direction blocker** -> `product-pipeline/checklists/design-needed-gate.md`
```

- [ ] **Step 6: Verify Task 2**

Run:

```powershell
rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline/workflows product-pipeline/checklists INDEX.md
git diff --check
```

Expected: no unresolved placeholder matches in the new workflow/gate files; whitespace check passes.

- [ ] **Step 7: Log Task 2**

Append to `projects/nexa-productpipeline/AUDIT-LOG.md`:

```markdown
## 2026-05-16 - Add Product Pipeline workflow and gates

**What:** Added the v0 workflow plus readiness and design-needed gates.

**Why:** The module needs clear operating rules before dogfooding issue generation.

**Files:** `product-pipeline/workflows/product-pipeline-v0.md`, `product-pipeline/checklists/*`, `INDEX.md`.

**Verification:** Placeholder scan over workflow and gate files returned no unresolved placeholders; `git diff --check` passed.
```

- [ ] **Step 8: Commit Task 2**

Run:

```powershell
git add product-pipeline/workflows product-pipeline/checklists INDEX.md projects/nexa-productpipeline/AUDIT-LOG.md
git commit -m "Add Product Pipeline workflow gates"
```

Expected: commit succeeds.

---

### Task 3: Dogfood The Workflow Into Issue Candidates

**Files:**
- Create: `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md`
- Modify: `INDEX.md`
- Modify: `projects/nexa-productpipeline/CURRENT-STATE.md`
- Modify: `projects/nexa-productpipeline/AUDIT-LOG.md`

- [ ] **Step 1: Create proposal directory**

Run:

```powershell
New-Item -ItemType Directory -Force product-pipeline/proposals
```

Expected: directory exists.

- [ ] **Step 2: Create `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md`**

Use this content:

````markdown
# Product Pipeline Self-Dogfood Issue Proposal

## Purpose

This proposal uses Product Pipeline v0 on itself. It does not create GitHub issues until Richard approves.

## Proposed Issues

### 1. Add Product Pipeline artifact templates

- Work Type: Task
- Readiness Gate: Dev Ready
- Module Boundary: Product Pipeline
- Labels: `type:story`, `area:product`
- Goal: Create the reusable Markdown artifact templates that Product Pipeline v0 uses.
- Non-goals: Do not add GitHub automation or a runtime service.
- Acceptance criteria:
  - Intake, research, comparison, opportunity, epic, issue, design, and parent KB templates exist.
  - Templates are routed from `INDEX.md`.
  - Placeholder scan and whitespace checks pass.
- Verification: `rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline/templates INDEX.md` returns no unresolved placeholder matches; `git diff --check` passes.

### 2. Add Product Pipeline v0 workflow and gates

- Work Type: Story
- Readiness Gate: Dev Ready
- Module Boundary: Product Pipeline
- Labels: `type:story`, `area:product`
- Goal: Define the step-by-step v0 workflow, readiness gate, and design-needed gate.
- Non-goals: Do not create GitHub issues automatically.
- Acceptance criteria:
  - Workflow covers parent KB catchup through review checkpoint.
  - Readiness gate prevents weak tasks from becoming Dev Ready.
  - Design-needed gate blocks visible work without design direction.
- Verification: Workflow and checklist files exist; `INDEX.md` routes them; `git diff --check` passes.

### 3. Create Product Pipeline workflow skill source

- Work Type: Story
- Readiness Gate: Draft Ready
- Module Boundary: Product Pipeline
- Labels: `type:story`, `area:product`
- Goal: Convert the workflow into a skill source that future sessions can invoke.
- Non-goals: Do not install it globally until the dogfood pass is reviewed.
- Acceptance criteria:
  - Skill source exists under a repo-owned skills path.
  - Skill points to templates, gates, and proposal workflow.
  - Skill includes parent KB writeback rules.
  - Skill includes the review checkpoint before GitHub creation.
- Verification: Skill file exists; routing docs mention it; placeholder scan passes.

### 4. Define parent KB writeback contract

- Work Type: Task
- Readiness Gate: Draft Ready
- Module Boundary: Parent KB
- Labels: `type:story`, `area:kb`
- Goal: Specify exactly what Product Pipeline writes back to a parent KB after a run.
- Non-goals: Do not modify Nexa-AOS until the local contract is reviewed.
- Acceptance criteria:
  - Contract names required parent KB input files.
  - Contract names required parent KB output files.
  - Contract defines traceability from issue to human guidance and research.
  - Contract defines when to update audit, decision, current state, and index.
- Verification: Contract doc exists and is linked from `INDEX.md`.

### 5. Add review-gated GitHub output procedure

- Work Type: Task
- Readiness Gate: Draft Ready
- Module Boundary: GitHub Project
- Labels: `type:story`, `area:github-project`
- Goal: Create a safe procedure for turning approved proposals into GitHub issues and Project fields.
- Non-goals: Do not bypass human approval.
- Acceptance criteria:
  - Procedure includes exact `gh issue create` and `gh project item-add` flow.
  - Procedure lists required labels and field values.
  - Procedure includes verification commands.
  - Procedure explains when not to create an issue.
- Verification: Procedure exists; commands are concrete; `gh project view 4 --owner 4-10` succeeds.

### 6. Register Product Pipeline module contract draft

- Work Type: Task
- Readiness Gate: Draft Ready
- Module Boundary: Product Pipeline
- Labels: `type:story`, `area:product`
- Goal: Draft the module contract that Nexa-AOS can later consume.
- Non-goals: Do not edit the Nexa-AOS module registry until this draft is approved.
- Acceptance criteria:
  - Draft contract includes module id, purpose, inputs, outputs, invocation rules, verification, and KB updates.
  - Draft contract names AppGenerator and Design Module boundaries.
  - Draft contract is routed from `INDEX.md`.
- Verification: Contract draft exists; `INDEX.md` routes it.

### 7. Dogfood Product Pipeline on a second product idea

- Work Type: Research Spike
- Readiness Gate: Research
- Module Boundary: Product Pipeline
- Labels: `type:spike`, `area:product`
- Goal: Run the workflow on a second idea to prove it is not overfitted to its own repo.
- Non-goals: Do not create implementation issues from the second idea without approval.
- Acceptance criteria:
  - Intake notes, research brief, opportunity brief, and issue proposal are produced for the second idea.
  - Any confusing workflow steps are logged as defects or improvement issues.
  - Parent KB writeback instructions are exercised.
- Verification: Artifact set exists under `product-pipeline/proposals/`; follow-up defects or improvements are recorded.

### 8. Add minimal GitHub automation after proposal approval

- Work Type: Story
- Readiness Gate: Spec
- Module Boundary: GitHub Project
- Labels: `type:story`, `area:github-project`
- Goal: Add a small script or documented command wrapper to create approved issues and assign Project fields.
- Non-goals: Do not add a service, database, or continuous automation.
- Acceptance criteria:
  - Automation reads an approved proposal format.
  - Automation creates issues only for candidates marked create now.
  - Automation verifies created issue URLs and Project item state.
  - Automation refuses candidates missing title, body, labels, Work Type, Readiness Gate, or Module Boundary.
- Verification: Dry-run mode demonstrates planned issue creation without mutating GitHub; live mode is run only after approval.

## Recommendation

Create issues 1 and 2 first because they are Dev Ready and establish the artifact base. Keep issues 3 through 8 as Draft Ready or Research until the template and workflow pass is reviewed.
````

- [ ] **Step 3: Register proposal in `INDEX.md`**

Add this entry under `Product Pipeline Reference`:

```markdown
- **self dogfood issue proposal, first issues, proposed backlog** -> `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md`
```

- [ ] **Step 4: Update `CURRENT-STATE.md`**

Set:

- Active focus: reviewing the self-dogfood issue proposal.
- Last action: created the proposal.
- Next intended move: Richard approves which proposed issues to create.
- Recent significant artifacts: add `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md`.

- [ ] **Step 5: Verify Task 3**

Run:

```powershell
rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline/proposals INDEX.md projects/nexa-productpipeline/CURRENT-STATE.md
git diff --check
```

Expected: no unresolved placeholder matches in the proposal/current-state update; whitespace check passes.

- [ ] **Step 6: Log Task 3**

Append to `projects/nexa-productpipeline/AUDIT-LOG.md`:

```markdown
## 2026-05-16 - Create Product Pipeline self-dogfood issue proposal

**What:** Used the v0 design to draft the first Product Pipeline issue proposal without creating GitHub issues yet.

**Why:** The workflow should prove its artifact quality before mutating the live board.

**Files:** `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md`, `INDEX.md`, `projects/nexa-productpipeline/CURRENT-STATE.md`.

**Verification:** Placeholder scan over proposal and current-state files returned no unresolved placeholders; `git diff --check` passed.
```

- [ ] **Step 7: Commit Task 3**

Run:

```powershell
git add product-pipeline/proposals INDEX.md projects/nexa-productpipeline/CURRENT-STATE.md projects/nexa-productpipeline/AUDIT-LOG.md
git commit -m "Dogfood Product Pipeline issue proposal"
```

Expected: commit succeeds.

---

### Task 4: Add Review-Gated GitHub Output Procedure

**Files:**
- Create: `product-pipeline/how-to/create-github-output-from-proposal.md`
- Modify: `INDEX.md`
- Modify: `projects/nexa-productpipeline/AUDIT-LOG.md`

- [ ] **Step 1: Create how-to directory**

Run:

```powershell
New-Item -ItemType Directory -Force product-pipeline/how-to
```

Expected: directory exists.

- [ ] **Step 2: Create `product-pipeline/how-to/create-github-output-from-proposal.md`**

Use this content:

````markdown
# Create GitHub Output From An Approved Proposal

Use this only after Richard approves a Product Pipeline issue proposal.

## Prerequisites

- The proposal exists under `product-pipeline/proposals/`.
- Each issue candidate has title, goal, non-goals, acceptance criteria, verification, labels, Work Type, Readiness Gate, and Module Boundary.
- `gh auth status` succeeds.
- GitHub Project 4 is available.

## Verification Before Mutating GitHub

```powershell
gh auth status
gh project view 4 --owner 4-10
gh issue list --repo 4-10/Nexa-ProductPipeline --state open --limit 20
```

Expected: authentication succeeds, Project 4 is visible, and the open issue list is understood before adding more work.

## Create One Issue

Create the issue:

```powershell
gh issue create --repo 4-10/Nexa-ProductPipeline --title "Add Product Pipeline artifact templates" --label "type:story" --label "area:product" --body-file .\product-pipeline\proposals\issue-bodies\add-product-pipeline-artifact-templates.md
```

Expected: command returns the created issue URL.

## Add Issue To Project

```powershell
$createdIssueUrl = "https://github.com/4-10/Nexa-ProductPipeline/issues/1"
gh project item-add 4 --owner 4-10 --url $createdIssueUrl
```

Expected: command returns the Project item id.

## Set Project Fields

Use `gh project field-list 4 --owner 4-10` to confirm field ids before setting fields. Set `Work Type`, `Readiness Gate`, and `Module Boundary` to match the approved proposal.

## Verify

```powershell
gh issue list --repo 4-10/Nexa-ProductPipeline --state open --limit 20
gh project item-list 4 --owner 4-10 --limit 20
```

Expected: created issues appear in the repo and in Project 4 with correct fields.

## Stop Conditions

Do not create an issue when:

- the proposal item is not approved,
- acceptance criteria are weak,
- verification is missing,
- design is needed but not marked,
- Work Type, Readiness Gate, or Module Boundary is missing.
````

- [ ] **Step 3: Register how-to in `INDEX.md`**

Add this entry under `How-To Procedures`:

```markdown
- **create GitHub output, approved proposal, issue creation, project fields** -> `product-pipeline/how-to/create-github-output-from-proposal.md`
```

- [ ] **Step 4: Verify Task 4**

Run:

```powershell
rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline/how-to INDEX.md
git diff --check
gh project view 4 --owner 4-10
```

Expected: no unresolved placeholder matches; whitespace check passes; GitHub Project 4 is visible.

- [ ] **Step 5: Log Task 4**

Append to `projects/nexa-productpipeline/AUDIT-LOG.md`:

```markdown
## 2026-05-16 - Add review-gated GitHub output procedure

**What:** Added the procedure for turning approved Product Pipeline proposals into GitHub issues and Project items.

**Why:** Live board mutations need a repeatable approval and verification path.

**Files:** `product-pipeline/how-to/create-github-output-from-proposal.md`, `INDEX.md`.

**Verification:** Placeholder scan over the how-to and index passed; `git diff --check` passed; `gh project view 4 --owner 4-10` succeeded.
```

- [ ] **Step 6: Commit Task 4**

Run:

```powershell
git add product-pipeline/how-to INDEX.md projects/nexa-productpipeline/AUDIT-LOG.md
git commit -m "Document Product Pipeline GitHub output flow"
```

Expected: commit succeeds.

---

### Task 5: Final Verification And Handoff

**Files:**
- Modify: `projects/nexa-productpipeline/CURRENT-STATE.md`
- Modify: `projects/nexa-productpipeline/AUDIT-LOG.md`

- [ ] **Step 1: Run full verification**

Run:

```powershell
git status --short --branch
rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline docs/superpowers/plans INDEX.md projects/nexa-productpipeline
git diff --check
gh project view 4 --owner 4-10
```

Expected:

- Git status shows the current branch and only intended changes before the final commit.
- Placeholder scan returns no unresolved placeholders in non-template execution artifacts.
- Whitespace check passes.
- GitHub Project 4 is visible.

- [ ] **Step 2: Update current state**

Set `projects/nexa-productpipeline/CURRENT-STATE.md`:

- Active focus: Product Pipeline v0 artifact workflow and issue proposal are ready for Richard review.
- Last action: created templates, workflow, gates, proposal, and GitHub output procedure.
- Next intended move: Richard approves issue creation or selects first implementation issue.
- Recent significant artifacts: include `product-pipeline/`.

- [ ] **Step 3: Log final verification**

Append to `projects/nexa-productpipeline/AUDIT-LOG.md`:

```markdown
## 2026-05-16 - Verify Product Pipeline v0 workflow artifacts

**What:** Ran final verification over the v0 artifact templates, workflow, gates, proposal, and GitHub output procedure.

**Why:** The workflow artifacts need to be clean before issue creation or implementation work continues.

**Files:** `product-pipeline/*`, `INDEX.md`, `projects/nexa-productpipeline/CURRENT-STATE.md`, `projects/nexa-productpipeline/AUDIT-LOG.md`.

**Verification:** Full placeholder scan passed; `git diff --check` passed; `gh project view 4 --owner 4-10` succeeded.
```

- [ ] **Step 4: Commit final state**

Run:

```powershell
git add INDEX.md product-pipeline projects/nexa-productpipeline/CURRENT-STATE.md projects/nexa-productpipeline/AUDIT-LOG.md
git commit -m "Prepare Product Pipeline v0 workflow artifacts"
```

Expected: commit succeeds.

- [ ] **Step 5: Push**

Run:

```powershell
git push
```

Expected: branch pushes to `origin/main`.

- [ ] **Step 6: Report handoff**

Report:

- plan execution completed,
- commit hashes created,
- verification commands run,
- whether GitHub issues were created,
- next approval needed.
