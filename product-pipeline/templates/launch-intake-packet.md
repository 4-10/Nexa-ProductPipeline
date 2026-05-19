# Launch Intake Packet

Use this packet when a Product Pipeline run needs a compact, reusable handoff from product idea to KB Core and AppBuilder.

The packet is not a form-builder schema and it does not create GitHub issues by itself. It is a reviewed product-context bundle that tells the next module what is known, what is blocked, and which gate comes next.

## Packet Metadata

- Packet name:
- Packet id:
- Packet version:
- Packet status: Intake | Draft Ready | Accepted | Blocked | Superseded
- Parent KB path:
- Active parent project:
- Product Pipeline run path:
- Source proposal:
- Source issue:
- Last reviewed:

## Source Idea

- Raw idea:
- Human guidance:
- Target user or buyer:
- Problem or opportunity:
- Desired outcome:
- First wedge:
- Why this is reusable:
- Non-goals:

## Product Pipeline Artifact Map

| Artifact | Path | Handoff use |
|---|---|---|
| Intake notes |  | Raw guidance and assumptions. |
| Research brief |  | Evidence questions and source notes. |
| Comparative analysis |  | Alternative paths and differentiator context. |
| Opportunity brief |  | Target focus, first wedge, risks, recommendation. |
| Epic map |  | Capability grouping and sequence. |
| Issue candidates |  | Candidate work, gates, dependencies. |
| Readiness review |  | Gate status and blockers. |
| Parent KB update plan |  | Required writeback to the parent KB. |
| GitHub output proposal |  | Review-gated issue creation plan. |

## Product Pipeline Handoff

- Product context path:
- Issue candidate path:
- Proposal path:
- Readiness status:
- Design status:
- Approved live issues:
- Deferred candidates:
- Must not infer:

## KB Core Handoff

- Parent KB root:
- Target project slug:
- Scaffold mode:
- Bootstrap path:
- Lineage source:
- Required parent KB files:
- Required product artifact links:
- Readiness metadata required before claimable work:
- Open KB decisions:

## AppBuilder Handoff

- AppBuilder mode:
- Product context path:
- Parent KB update plan path:
- AppBuilder proof or packet source:
- Required verification:
- Browser smoke needed: Yes | No
- AppBuilder substrate decision:
- Open AppBuilder blockers:

## Review Status And Next Gate

| Gate | Owner | Status | Decision needed |
|---|---|---|---|
| Product idea | Product Pipeline |  |  |
| Product artifacts | Product Pipeline |  |  |
| GitHub output | Product Pipeline or Overwatch |  |  |
| Pilot KB | KB Core |  |  |
| AppBuilder substrate | AppGenerator or Overwatch |  |  |
| Review and writeback | Overwatch |  |  |

## Constraints

- Scope guardrails:
- Safety or stewardship notes:
- Data, privacy, or IP notes:
- Known risks:

## Verification Checklist

- [ ] Required Product Pipeline artifacts are linked.
- [ ] KB Core handoff names the parent KB, project slug, scaffold mode, and lineage source or explicitly marks them blocked.
- [ ] AppBuilder handoff names the mode, context path, update plan, proof source, and substrate decision or explicitly marks them blocked.
- [ ] Review status names the current gate and next gate.
- [ ] Non-goals prevent automatic issue creation, broad schema design, or premature UI work.
- [ ] Packet was checked against the Product Pipeline workflow and the active integration contract.
