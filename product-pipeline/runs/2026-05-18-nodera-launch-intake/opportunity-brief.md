# Opportunity Brief - Nodera Launch Intake

## Product Direction

- Product idea: Nodera Launch Intake.
- Target market focus: Founder/operator product startup workflow first; later small teams that want idea-to-app operating support.
- Primary user: Richard as first operator.
- Buyer or sponsor: Richard / Nodera.
- First wedge: A reusable launch packet that captures enough product intent for Product Pipeline, KB Core, and AppBuilder to continue.

## Problem

- Pain: Promising ideas enter as conversational context and can sprawl, disappear, or become oversized before they reach durable artifacts.
- Current workaround: Chat-based direction plus manual KB/issue updates.
- Why now: D3-D5 KB bootstrap paths are trustworthy, Product Pipeline v0 is accepted, and AppBuilder has a reusable proof surface.

## Differentiation

- Differentiator thesis: Nodera does not just collect an idea; it turns the idea into operating context, reviewable work, and a module handoff.
- Emotional calling: Make the first step of building feel calm, directed, and scalable.
- What should feel meaningfully better: A rough idea becomes a launch packet with clear next action, not a blank backlog or a bloated plan.

## Scope

- In scope for first slice:
  - Define the launch packet contract.
  - Prove the packet through this Product Pipeline run.
  - Propose a tiny AppBuilder surface only after packet review.
  - Update Overwatch with the chosen pilot idea and next gate.
- Out of scope for first slice:
  - Public portal.
  - Authentication or billing.
  - Automatic GitHub issue creation.
  - Dedupe/routing automation.
  - CRM/customer database.
- Design dependency: Low for the packet; medium for a user-facing command-center intake screen.
- AppGenerator dependency: Optional for the first packet; required for a visible intake screen.

## Risks

- Product risk: The first packet could become too generic if it tries to serve all future intake workflows.
- Research risk: External examples validate intake generally but not Nodera's exact operator workflow.
- Design risk: A visible screen could distract from the handoff contract if built too early.
- Implementation risk: Auto-creating issues would violate Product Pipeline's review-gated rule.

## Recommendation

- Recommended epic map: One narrow epic with three candidate slices: packet contract, pilot KB/bootstrap, optional command-center intake screen.
- Recommended next issue type: Draft Ready proposal, not live issue creation yet.
- Readiness gate: Draft Ready for review; AppBuilder UI remains Blocked until substrate decision.
