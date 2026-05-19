# Comparative Analysis - Nodera Launch Intake

## Comparison Goal

- Product decision this comparison informs: Choose the first pilot wedge for Overwatch `#7`.
- Alternatives considered: Generic form builder, product feedback portal, issue-management intake, and manual chat notes.

## Alternatives

### Alternative 1: Generic Guided Form

- Who it serves: Teams that need flexible data collection across many workflows.
- Core promise: Make it easy and pleasant to collect structured responses.
- What it does well: Low-friction input, branded experiences, integrations, and broad templates.
- Where it falls short: The output is still generic data unless a product/KB/workflow layer interprets it.
- What Product Pipeline should learn: Guided capture is useful, but Product Pipeline needs opinionated downstream structure.
- Implication for first wedge: Build a launch packet contract, not a generic form system.

### Alternative 2: Product Feedback Portal

- Who it serves: Product teams collecting ideas, votes, validation signals, and roadmap feedback.
- Core promise: Connect users and stakeholders to roadmap decisions.
- What it does well: Idea collection, validation, roadmap visibility, and closing the feedback loop.
- Where it falls short: It assumes a product already exists and needs customer feedback at scale.
- What Product Pipeline should learn: Preserve future feedback/validation hooks, but do not start there.
- Implication for first wedge: Capture a product idea and its decision context before adding public voting or portals.

### Alternative 3: Issue-Management Intake

- Who it serves: Teams routing bug reports, feature ideas, customer asks, and internal requests into work systems.
- Core promise: Convert incoming requests into routed, deduped, trackable work.
- What it does well: Issue linkage, customer context, impact filtering, assignment, and automation.
- Where it falls short: It often starts at work intake, while Nodera needs product shaping before work creation.
- What Product Pipeline should learn: Routing to GitHub issues is a later step and must remain review-gated.
- Implication for first wedge: Produce a launch packet and proposal before creating issues.

### Alternative 4: Manual Chat Notes

- Who it serves: A solo founder/operator moving quickly with an assistant.
- Core promise: Maximum speed and flexibility.
- What it does well: Low ceremony and rich context.
- Where it falls short: Hard to reuse, scale, audit, or convert into consistent module handoffs.
- What Product Pipeline should learn: Preserve the conversational feel but write durable structured artifacts.
- Implication for first wedge: Keep the first intake light and human-readable.

## Differentiator Thesis

- Functional differentiator: Nodera Launch Intake turns a rough product idea into a reusable launch packet that already knows the Product Pipeline, KB Core, and AppBuilder handoff.
- Workflow differentiator: It starts before backlog generation and stops before issue mutation until review.
- Emotional differentiator: It should feel like turning fog into a small, sturdy next step.
- Economic or speed advantage: Reuses existing Nexa/Nodera infrastructure instead of building or buying a full feedback portal.

## Recommendation

- Direction to pursue: Artifact-first Launch Intake packet with optional later command-center surface.
- Direction to avoid: Full product portal, generic form builder, or automated issue factory.
- Reason: The smaller wedge proves the operating loop and stays reusable for future products.
