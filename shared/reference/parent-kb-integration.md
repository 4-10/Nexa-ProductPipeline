# Parent KB Integration

## Core Rule

The final Product Pipeline module should not maintain its own runtime KB. It should use the active parent project KB as the durable memory for the product being shaped.

This repository is only a temporary working KB for building the module.

## Expected Parent KB Inputs

- Current project state.
- Existing product strategy.
- Known decisions.
- Open defects and constraints.
- AppGenerator output facts.
- Existing backlog and project board state.
- Agent instructions and truth hierarchy.

## Expected Parent KB Outputs

After a Product Pipeline run, the parent KB should receive:

- audit entry,
- decision entries for non-obvious product calls,
- research or opportunity artifacts,
- backlog or issue references,
- readiness status and unresolved questions,
- links to GitHub Project items or issues created.

## Accountability Requirements

Every generated task should be traceable back to:

- human guidance,
- research or decision evidence,
- parent KB context,
- generation session,
- expected verification.

## Failure Modes

- Product artifacts live only in chat and disappear.
- Generated issues are disconnected from the decisions that justified them.
- Parent KB says one thing while the GitHub Project says another.
- Product Pipeline creates a separate memory island that future Nexa agents do not read.
