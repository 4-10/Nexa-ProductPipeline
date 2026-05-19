# Epic Map - Launch Intake Desk

## Epic 1: Capture Accepted Product Intent

Goal: Preserve the accepted request, source workspace, target user, problem, desired outcome, and constraints.

Candidate slices:

- Keep accepted request export deterministic.
- Keep source app workspace and parent KB project distinct.
- Preserve source request id in every downstream artifact.

## Epic 2: Generate Complete Product Pipeline Artifacts

Goal: Turn the packet draft into intake, research, comparison, opportunity, epic, issue, readiness, and parent-KB artifacts.

Candidate slices:

- Generate this artifact run from the packet draft.
- Review the output for product truth and missing research.
- Keep GitHub output behind proposal approval.

## Epic 3: Prepare Implementation Handoff

Goal: Decide whether the next build step belongs to Product Pipeline, AppBuilder, Overwatch, or KB Core.

Candidate slices:

- Review issue candidates.
- Choose full artifact generation follow-up or AppBuilder DB isolation promotion.
- Update Overwatch, Pilot KB, and AppGenerator state after review.

## Sequencing Recommendation

1. Review this generated artifact run.
2. Accept or revise issue candidates.
3. Only then create live GitHub issues or invoke AppBuilder work.
