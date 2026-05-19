# Product Pipeline Module Artifacts

This folder contains the first implementation artifacts for Product Pipeline v0.

V0 is intentionally workflow-first. It proves the product artifact ladder before adding broad automation.

## Current Boundary

Product Pipeline v0 owns:

- structured product intake,
- research and comparison artifacts,
- opportunity synthesis,
- reusable launch intake packet handoff,
- epic and issue candidate generation,
- readiness and design gates,
- parent KB update instructions,
- packet-draft to artifact-run generation,
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
- `runs/` - concrete Product Pipeline runs for a specific product idea or pilot.
- `proposals/` - reviewable output proposals before GitHub creation.
- `research/` - accepted research-gate outputs that validate package, buyer, pricing, objection, or market hypotheses.
- `reviews/` - durable review outcomes for accepted, revised, or blocked artifact runs.
- `tools/` - local automation for repeatable artifact synthesis and verification.
- `how-to/` - repeatable procedures for using outputs.

## Local Tools

Use the packet-to-run generator when an accepted parent-KB packet draft should become a full Product Pipeline artifact set:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File product-pipeline\tools\New-ProductPipelineRunFromPacket.ps1 -PacketDraftPath <packet-draft-path>
```

Verify the generator before relying on it:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File product-pipeline\tools\Test-ProductPipelineRunFromPacket.ps1
```

The generator creates review material only. It does not create GitHub issues, mark work Dev Ready, or bypass the proposal approval gate.
