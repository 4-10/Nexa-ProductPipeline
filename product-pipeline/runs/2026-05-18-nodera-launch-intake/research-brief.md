# Research Brief - Nodera Launch Intake

## Research Goal

- Question this research should answer: Is a small product-intake front door worth piloting as reusable Nodera infrastructure?
- Product decision this research should inform: Whether Overwatch `#7` should use Launch Intake as the first idea-to-app pilot.

## Research Questions

- Question 1: What do established tools show about the value of guided intake and feedback capture?
- Question 2: What should Nodera avoid in the first slice so the pilot stays small?
- Question 3: Which later scaling hooks should be preserved without implementing them now?

## Evidence Notes

| Source or observation | What it says | Confidence | Product implication |
|---|---|---|---|
| Typeform platform overview, 2026-05-18 web check: `https://www.typeform.com/platform-overview` | Typeform frames forms as appealing collection surfaces with integrations, workflow automation, AI analysis, and research/feedback use cases. | High | A guided intake surface is a proven user behavior, but Nodera should not compete as a generic form platform. |
| Productboard Product Portal, 2026-05-18 web check: `https://www.productboard.com/product-portal/` | Productboard positions portals around collecting ideas, validating features, sharing roadmap status, and closing the loop. | High | Idea intake gets more valuable when it links to validation and roadmap state. Nodera should preserve that path later. |
| Linear Customer Requests docs, 2026-05-18 web check: `https://linear.app/docs/customer-requests` | Linear links customer feedback to issues/projects and supports customer context, impact filtering, and integrations. | High | The long-term shape should connect intake to work items, but the first slice should stop at a reviewable packet. |
| Linear Intake page, 2026-05-18 web check: `https://linear.app/intake` | Linear emphasizes dedupe, rules, auto-assignment, customer requests, and routing from Slack/email/forms. | High | Automation, dedupe, and routing are valuable later scaling hooks, not first-slice requirements. |

## Market Or Workflow Findings

- Finding: Intake is valuable when it captures structured context and routes work to a downstream system.
- Finding: Mature products expand into dedupe, routing, feedback linking, and roadmap loops.
- Finding: A reusable launch packet is a smaller and more aligned wedge than building a public portal or generalized form builder.

## Open Unknowns

- Unknown: Whether the first user-facing surface should be embedded in the command center or kept artifact-only until the AppBuilder packet is promoted.
- Unknown: Which fields are the minimum viable intake contract for Richard's actual working rhythm.

## Recommendation

- Recommended next move: Use Launch Intake as the Overwatch `#7` pilot idea, but keep the first implementation to a reusable packet contract and optional command-center screen.
- Confidence level: Medium-high.
- Why this is enough or not enough to create backlog: Enough for a review-gated proposal; not enough to create live implementation issues without accepting the AppBuilder substrate decision.
