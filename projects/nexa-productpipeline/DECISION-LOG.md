# Nexa Product Pipeline - DECISION LOG

Record durable decisions in reverse chronological order.

## 2026-05-19 - Use private managed-pilot pricing hypotheses

**Tags:** launch-intake, pricing, managed-pilot, commercialization

**Context:** The Research-gate offer validation artifact needed a concrete pricing hypothesis without turning the package into a public price sheet or billing implementation trigger.

**Options considered:**

- A: Publish pricing immediately and build payment flow.
- B: Avoid price discussion until after more implementation.
- C: Use private buyer-conversation hypotheses: `$4,500` managed pilot, `$2,500` artifact-only, and `$7,500-$12,500` local-workspace pilot.

**Decision:** Choose C.

**Why:** A private price ladder supports real buyer discovery while avoiding unsupported public claims. It keeps the package positioned below full agency MVP pricing but above a cheap template or chat-only deliverable.

**Consequences:**

- Do not build payment, public pricing, or subscription tiers from this artifact alone.
- Record buyer objections and willingness-to-pay evidence before publishing package language.
- Use Overwatch public trust and local-runner artifacts before selling a code-aware local-workspace variant.

## 2026-05-19 - Validate managed pilot before billing or self-serve productization

**Tags:** launch-intake, managed-pilot, commercialization, readiness-gate

**Context:** Overwatch selected a managed private pilot with local-first/customer-workspace execution as the v0 commercialization path after the Launch Intake Desk artifact review was accepted.

**Options considered:**

- A: Build billing or public pricing next.
- B: Re-materialize the Launch Intake app next.
- C: Validate the managed-pilot offer as Product Pipeline research first.

**Decision:** Choose C.

**Why:** Buyer, package, trust objections, and pricing hypothesis are the next riskiest unknowns. Product Pipeline can answer those without prematurely creating Dev Ready implementation work or making public SaaS/security claims.

**Consequences:**

- The next Product Pipeline item stays Research gate.
- Billing, public pricing, self-serve SaaS, and AppBuilder re-materialization remain blocked until offer validation and trust/handoff follow-ups are clearer.
- Future website copy and AppBuilder handoff work can cite the validation artifact.

## 2026-05-19 - Accept Launch Intake Desk artifact run as Draft Ready

**Tags:** launch-intake, artifact-review, readiness-gate, github-output

**Context:** Candidate 1 asked Product Pipeline to review the generated Launch Intake Desk artifact run and decide whether it was accepted, needed revision, or should drive the next live output.

**Options considered:**

- A: Accept the artifact run as Draft Ready review output.
- B: Revise the generated run before closing the review issue.
- C: Convert gaps directly into new live GitHub issues.

**Decision:** Choose A.

**Why:** The artifact set is coherent and traceable, and it correctly preserves the missing external research and design work as known blockers. It is strong enough to accept as Product Pipeline review output, but not strong enough to become Dev Ready work.

**Consequences:**

- `4-10/Nexa-ProductPipeline#2` can close once the outcome is posted.
- Missing external research, public design, pricing/payment, IP protection, and customer-handoff architecture remain known gaps.
- Additional live GitHub issue output still requires a separate approval checkpoint.

## 2026-05-19 - Approve Candidate 1 live review issue only

**Tags:** github-output, launch-intake, review-gate, issue-creation

**Context:** The generated Launch Intake Desk artifact run proposed three outputs. Candidate 2, AppBuilder generated-app DB isolation promotion, was already completed in the AppBuilder source path. Candidate 3 was the approval/deferral gate for live GitHub output.

**Options considered:**

- A: Create all generated candidates as live issues.
- B: Create only Candidate 1 as a Draft Ready review issue.
- C: Create no live issues and keep all work in local artifacts.

**Decision:** Choose B.

**Why:** Candidate 1 is review work, not implementation work, and it is concrete enough for a live Product Pipeline tracker item. Creating more issues would bypass the new review gate and risk board spam.

**Consequences:**

- `4-10/Nexa-ProductPipeline#2` is the only live issue created from this proposal.
- The issue remains Draft Ready, not Dev Ready.
- Additional issue output requires a separate explicit approval checkpoint after Candidate 1 review.

## 2026-05-19 - Keep packet-to-run generation review-only

**Tags:** artifact-generation, launch-intake, github-output, review-gate

**Context:** The Launch Intake pilot can now produce accepted parent-KB packet drafts. Product Pipeline needs a repeatable way to turn those packet drafts into full artifact runs without turning every draft into live GitHub work.

**Options considered:**

- A: Create GitHub issues directly from packet drafts.
- B: Keep every packet-to-run conversion manual.
- C: Add a local generator that creates reviewable Product Pipeline artifacts and a proposal, but no live GitHub mutations.

**Decision:** Choose C.

**Why:** The generator makes repeated Launch Intake handoffs faster and more consistent while preserving the quality gate that protects the GitHub backlog from draft or not-Dev-Ready work.

**Consequences:**

- Packet-to-run output is Draft Ready review material, not Dev Ready implementation work.
- Live GitHub issue creation still requires explicit proposal approval.
- Future Launch Intake surfaces can reuse the same generator boundary instead of inventing a new handoff shape.

## 2026-05-18 - Use Launch Intake packet as the first pilot handoff contract

**Tags:** launch-intake, handoff-contract, parent-kb-integration, appbuilder-boundary

**Context:** Overwatch `#7` needs to move from a Product Pipeline run into KB Core and AppBuilder without overbuilding a UI or guessing the pilot path. The approved Candidate 1 issue asks for a reusable packet contract.

**Options considered:**

- A: Initialize the pilot KB immediately from the run artifacts.
- B: Build a visible intake screen first.
- C: Define a reusable Launch Intake packet before KB or AppBuilder work.

**Decision:** Choose C.

**Why:** The packet captures the minimum reusable handoff: product context, source artifacts, KB Core needs, AppBuilder needs, review status, next gate, and non-goals. It keeps the next step small while making later web, desktop, mobile, or managed-service intake surfaces easier to build from the same parent artifact.

**Consequences:**

- Candidate 2 should consume the accepted packet before initializing the pilot KB.
- Candidate 3 remains blocked until the AppBuilder substrate decision is explicit.
- Future Product Pipeline runs that are meant to become launch workflows can reuse `product-pipeline/templates/launch-intake-packet.md`.

## 2026-05-16 - Start Product Pipeline v0 as a workflow/skill, not an app or service

**Tags:** architecture, module-boundary, product-strategy, v0-design

**Context:** Richard asked for the most efficient path to proceed. Product Pipeline ultimately may automate GitHub Project updates and integrate deeply with Nexa, but the riskiest unknown is the quality of the product artifact flow, not the mechanics of writing issues.

**Options considered:**

- A: Build a full app or service first.
- B: Build GitHub automation first.
- C: Build a Codex-compatible workflow/skill with Markdown artifact templates first.

**Decision:** Choose C.

**Why:** A workflow/skill can be dogfooded immediately, proves the artifact ladder before automation, and avoids creating backlog sludge faster than the product reasoning improves.

**Consequences:**

- The first implementation slices should create templates and workflow instructions.
- GitHub issue/project creation should come after the issue proposal format is proven.
- The first manual test should use Product Pipeline to generate its own first 5 to 8 issue candidates.

## 2026-05-16 - Use a temporary module-build KB, not a final runtime KB

**Tags:** architecture, parent-kb-integration, module-boundary

**Context:** The module needs durable working memory while it is being designed, but Richard explicitly noted that the end Product Pipeline module should be tied to the parent KB rather than owning its own KB.

**Options considered:**

- A: Give Product Pipeline its own runtime KB forever.
- B: Use no KB while designing the module.
- C: Use this repo as a temporary build KB, while designing the final module to read/write the parent KB.

**Decision:** Choose C.

**Why:** The build process needs continuity, audit, and routing. The final module should still preserve the Nexa operating model where project context lives in the active parent KB.

**Consequences:**

- This repo can store module-build research, decisions, and tasks.
- The final module contract must define parent KB inputs and outputs.
- Future agents should not assume every Product Pipeline run creates a new KB.

## 2026-05-16 - Keep design as a collaboration boundary for initial planning

**Tags:** design-collaboration, module-boundary, product-strategy

**Context:** Product Pipeline may need to involve a designer later. The current uncertainty is whether design should be embedded or kept separate.

**Options considered:**

- A: Fully merge design into Product Pipeline.
- B: Keep Product Pipeline separate and create a design handoff gate.
- C: Ignore design until implementation tasks need it.

**Decision:** Start with B while preserving the option to add a lightweight design brief.

**Why:** Product Pipeline should own product direction and readiness. Design should be able to consume that direction without forcing this module to become a design module too early.

**Consequences:**

- Product artifacts should include design-relevant context.
- Implementation tasks that need visual direction should not pass ready-for-dev until design output exists.
- A future module design can decide whether the design brief is internal or delegated.

## 2026-05-16 - Use GitHub Project 4 as the live tracker for this module

**Tags:** github-project, task-tracking, backlog-generation

**Context:** Richard requested a Project directly under the Nexa-ProductPipeline repo to track tasks and work.

**Decision:** Create `Nexa Product Pipeline` at `https://github.com/users/4-10/projects/4` and link it to `4-10/Nexa-ProductPipeline`.

**Consequences:**

- GitHub Issues and Project items should own live task status.
- This KB should explain process and durable reasoning, not duplicate the whole board.
- Project fields should support work type, readiness, and module boundary.
