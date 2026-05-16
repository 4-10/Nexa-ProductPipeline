# Product Pipeline Self-Dogfood Issue Proposal

## Purpose

Use Product Pipeline v0 on Product Pipeline itself to produce the first issue proposal. No GitHub issues are created until Richard approves which proposed items should become live issues.

## Proposed Issue Candidates

### 1. Add Product Pipeline artifact templates

**Work Type:** Task
**Readiness Gate:** Dev Ready
**Module Boundary:** Product Pipeline
**Labels:** `type:story`, `area:product`
**Create now:** No; already implemented locally in this branch as Task 1 unless retrospective board tracking is desired.

**Goal:** Create the reusable Markdown artifact templates that Product Pipeline v0 uses.

**Non-goals:** Do not add GitHub automation or a runtime service.

**Acceptance criteria:**

- Intake, research, comparison, opportunity, epic, issue, design, and parent KB templates exist.
- Templates are routed from `INDEX.md`.
- Placeholder scan and whitespace checks pass.

**Verification:**

- Use `rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline/templates INDEX.md`.
- Use `git diff --check`.

### 2. Add Product Pipeline v0 workflow and gates

**Work Type:** Story
**Readiness Gate:** Dev Ready
**Module Boundary:** Product Pipeline
**Labels:** `type:story`, `area:product`
**Create now:** No; already implemented locally in this branch as Task 2 unless retrospective board tracking is desired.

**Goal:** Define the step-by-step v0 workflow, readiness gate, and design-needed gate.

**Non-goals:** Do not create GitHub issues automatically.

**Acceptance criteria:**

- Workflow covers parent KB catchup through review checkpoint.
- Readiness gate prevents weak tasks from becoming Dev Ready.
- Design-needed gate blocks visible work without design direction.

**Verification:**

- Workflow and checklist files exist.
- `INDEX.md` routes the workflow and checklists.
- `git diff --check` passes.

### 3. Create Product Pipeline workflow skill source

**Work Type:** Story
**Readiness Gate:** Draft Ready
**Module Boundary:** Product Pipeline
**Labels:** `type:story`, `area:product`
**Create now:** Yes, after Richard approves proposal.

**Goal:** Convert the workflow into a skill source that future sessions can invoke.

**Non-goals:** Do not install it globally until the dogfood pass is reviewed.

**Acceptance criteria:**

- Skill source exists under a repo-owned skills path.
- Skill points to templates, gates, and proposal workflow.
- Skill includes parent KB writeback rules.
- Skill includes the review checkpoint before GitHub creation.

**Verification:**

- Skill file exists.
- Routing docs mention it.
- Placeholder scan passes.

### 4. Define parent KB writeback contract

**Work Type:** Task
**Readiness Gate:** Draft Ready
**Module Boundary:** Parent KB
**Labels:** `type:story`, `area:kb`
**Create now:** Yes, after Richard approves proposal.

**Goal:** Specify exactly what Product Pipeline writes back to a parent KB after a run.

**Non-goals:** Do not modify Nexa-AOS until the local contract is reviewed.

**Acceptance criteria:**

- Contract names required parent KB input files.
- Contract names required parent KB output files.
- Contract defines traceability from issue to human guidance and research.
- Contract defines when to update audit, decision, current state, and index.

**Verification:**

- Contract doc exists and is linked from `INDEX.md`.

### 5. Add review-gated GitHub output procedure

**Work Type:** Task
**Readiness Gate:** Draft Ready
**Module Boundary:** GitHub Project
**Labels:** `type:story`, `area:github-project`
**Create now:** No; this is Task 4 in the current execution plan and will be implemented before issue creation.

**Goal:** Create a safe procedure for turning approved proposals into GitHub issues and Project fields.

**Non-goals:** Do not bypass human approval.

**Acceptance criteria:**

- Procedure includes exact `gh issue create` and `gh project item-add` flow.
- Procedure lists required labels and field values.
- Procedure includes verification commands.
- Procedure explains when not to create an issue.

**Verification:**

- Procedure exists.
- Commands are concrete.
- `gh project view 4 --owner 4-10` succeeds.

### 6. Register Product Pipeline module contract draft

**Work Type:** Task
**Readiness Gate:** Draft Ready
**Module Boundary:** Product Pipeline
**Labels:** `type:story`, `area:product`
**Create now:** Yes, after Richard approves proposal.

**Goal:** Draft the module contract that Nexa-AOS can later consume.

**Non-goals:** Do not edit the Nexa-AOS module registry until this draft is approved.

**Acceptance criteria:**

- Draft contract includes module id, purpose, inputs, outputs, invocation rules, verification, and KB updates.
- Draft contract names AppGenerator and Design Module boundaries.
- Draft contract is routed from `INDEX.md`.

**Verification:**

- Contract draft exists.
- `INDEX.md` routes it.

### 7. Dogfood Product Pipeline on a second product idea

**Work Type:** Research Spike
**Readiness Gate:** Research
**Module Boundary:** Product Pipeline
**Labels:** `type:spike`, `area:product`
**Create now:** Yes, after Richard approves proposal and provides or selects a second idea.

**Goal:** Run the workflow on a second idea to prove it is not overfitted to its own repo.

**Non-goals:** Do not create implementation issues from the second idea without approval.

**Acceptance criteria:**

- Intake notes, research brief, opportunity brief, and issue proposal are produced for the second idea.
- Confusing workflow steps are logged as defects or improvement issues.
- Parent KB writeback instructions are exercised.

**Verification:**

- Artifact set exists under `product-pipeline/proposals`.
- Follow-up defects or improvements are recorded.

### 8. Add minimal GitHub automation after proposal approval

**Work Type:** Story
**Readiness Gate:** Spec
**Module Boundary:** GitHub Project
**Labels:** `type:story`, `area:github-project`
**Create now:** No; should wait until the manual GitHub output procedure is reviewed.

**Goal:** Add a small script or documented command wrapper to create approved issues and assign Project fields.

**Non-goals:** Do not add a service, database, or continuous automation.

**Acceptance criteria:**

- Automation reads an approved proposal format.
- Creates issues only for candidates marked create now.
- Verifies created issue URLs and Project item state.
- Refuses candidates missing title, body, labels, Work Type, Readiness Gate, or Module Boundary.

**Verification:**

- Dry-run mode demonstrates planned issue creation without mutating GitHub.
- Live mode is run only after approval.

## Recommendation

Recommended immediate next work after the current plan is issue 3, issue 4, and issue 6. Issue 7 waits for a second idea. Issue 8 waits until the manual GitHub output flow is proven. Issues 1 and 2 are completed locally. Issue 5 is in this execution plan as Task 4.
