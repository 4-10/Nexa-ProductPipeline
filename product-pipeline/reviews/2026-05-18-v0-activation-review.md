# Product Pipeline v0 Activation Review

## Purpose

Record the Overwatch `#4` review decision for the Product Pipeline v0 artifacts.

## Reviewed Source

```text
repo: C:/Projects/Nexa-ProductPipeline
branch: product-pipeline-v0-artifacts
reviewed_commit: c79897d Prepare Product Pipeline v0 workflow artifacts
review_date: 2026-05-18
reviewer: Codex Overwatch session
```

## Decision

Accept Product Pipeline v0 as the baseline workflow artifact set for the next
NoderaOS integration step.

The accepted v0 baseline is workflow-first, not runtime-first. It proves the
artifact ladder, quality gates, review-gated GitHub output, and parent-KB
writeback shape before Product Pipeline becomes a skill, CLI, service, or
automation layer.

## Accepted Artifact Shape

Product Pipeline v0 may produce these artifacts for a product idea:

1. intake notes,
2. research brief,
3. comparative analysis,
4. opportunity brief,
5. epic map,
6. issue candidates,
7. design brief when visual or interaction direction is required,
8. parent KB update plan,
9. GitHub output proposal.

The v0 workflow must stop at the review checkpoint before creating GitHub
issues unless a future decision creates a narrow trusted auto-create class.

## Issue Output Decision

No Product Pipeline GitHub issues or Project items were created in this review.

The self-dogfood proposal remains useful, but candidate creation is explicitly
deferred until Richard approves exact candidates or a later policy relaxes the
manual approval rule.

Recommended next candidates when issue creation is approved:

| Candidate | Decision | Reason |
|---|---|---|
| 3. Create Product Pipeline workflow skill source | Recommended next | Turns accepted workflow into an invokable module asset. |
| 4. Define parent KB writeback contract | Partially absorbed by Overwatch integration contract | The cross-module contract should define the system boundary first; Product Pipeline can then add its module-local contract. |
| 6. Register Product Pipeline module contract draft | Recommended after integration contract | Should use the accepted cross-module inputs/outputs instead of inventing a parallel shape. |
| 7. Dogfood on a second idea | Deferred | Needs a selected product idea. |
| 8. Add minimal GitHub automation | Deferred | Manual output flow should be proven first. |

## Integration Handoff

This review unblocks Overwatch `#6` because Product Pipeline now has a stable
v0 output shape to connect to KB Core and AppBuilder.

Overwatch `#6` should use this accepted shape as its Product Pipeline side of
the contract:

```text
human idea
-> Product Pipeline artifact set
-> parent KB update plan
-> reviewed issue candidates
-> KB Core readiness and truth rules
-> AppBuilder invocation inputs
-> generated app or app-change handoff
-> review and KB writeback
```

## Verification Evidence

Read-only checks during review:

- branch was clean and tracking `origin/product-pipeline-v0-artifacts`,
- v0 branch diff contained artifact templates, workflow, gates, proposal, and GitHub output procedure,
- Product Pipeline Project `#4` existed,
- Overwatch `#4` was the active coordination item,
- proposal candidates clearly separated already-complete local artifacts from future create-now candidates.

Promotion checks to run before closing Overwatch `#4`:

```powershell
rg -n 'T[B]D|T[O]DO|\{\{|\}\}' product-pipeline docs/superpowers/plans INDEX.md projects/nexa-productpipeline
git diff --check
gh project view 4 --owner 4-10
gh issue list --repo 4-10/Nexa-ProductPipeline --state all --limit 100
gh project item-list 4 --owner 4-10 --limit 100 --format json
```

Expected result: no unresolved placeholders, no diff whitespace errors,
GitHub Project `#4` visible, no unintended Product Pipeline issues or Project
items created by this review.
