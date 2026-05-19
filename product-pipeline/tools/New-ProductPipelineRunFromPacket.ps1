param(
    [Parameter(Mandatory = $true)]
    [string]$PacketDraftPath,

    [string]$OutputRoot,

    [string]$ProposalRoot,

    [string]$RunSlug,

    [string]$RunDate = (Get-Date -Format 'yyyy-MM-dd'),

    [string]$GeneratedAt = ([DateTime]::UtcNow.ToString('o')),

    [switch]$Force
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($OutputRoot)) {
    $OutputRoot = Join-Path $PSScriptRoot '..\runs'
}

if ([string]::IsNullOrWhiteSpace($ProposalRoot)) {
    $ProposalRoot = Join-Path $PSScriptRoot '..\proposals'
}

function Resolve-RequiredFile {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $resolved = Resolve-Path -LiteralPath $Path -ErrorAction Stop
    return [System.IO.Path]::GetFullPath($resolved.Path)
}

function Resolve-OutputPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    return [System.IO.Path]::GetFullPath($Path)
}

function Assert-PathUnderRoot {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Root
    )

    $fullPath = [System.IO.Path]::GetFullPath($Path)
    $fullRoot = [System.IO.Path]::GetFullPath($Root).TrimEnd([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
    $rootPrefix = $fullRoot + [System.IO.Path]::DirectorySeparatorChar

    if (-not $fullPath.StartsWith($rootPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to write outside output root '$fullRoot': '$fullPath'."
    }
}

function ConvertTo-Slug {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Value
    )

    $slug = $Value.Trim().ToLowerInvariant()
    $slug = $slug -replace '[^a-z0-9]+', '-'
    $slug = $slug -replace '^-+', ''
    $slug = $slug -replace '-+$', ''

    if ([string]::IsNullOrWhiteSpace($slug)) {
        return 'product-pipeline-run'
    }

    return $slug
}

function Normalize-MarkdownValue {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Value
    )

    $normalized = $Value.Trim()

    if ($normalized.Length -ge 2 -and $normalized.StartsWith('`') -and $normalized.EndsWith('`')) {
        $normalized = $normalized.Substring(1, $normalized.Length - 2)
    }

    return $normalized.Trim()
}

function Get-PacketField {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Content,

        [Parameter(Mandatory = $true)]
        [string]$Label,

        [bool]$Required = $true
    )

    $pattern = '(?m)^-\s+' + [regex]::Escape($Label) + ':\s*(.+?)\s*$'
    $match = [regex]::Match($Content, $pattern)

    if (-not $match.Success) {
        if ($Required) {
            throw "Packet draft is missing required field '$Label'."
        }

        return ''
    }

    return Normalize-MarkdownValue $match.Groups[1].Value
}

function Write-TextFile {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Content
    )

    $parent = Split-Path -Parent $Path

    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    Set-Content -LiteralPath $Path -Value $Content -Encoding UTF8
}

function Fill-Template {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Template,

        [Parameter(Mandatory = $true)]
        [hashtable]$Values
    )

    $result = $Template

    foreach ($key in $Values.Keys) {
        $result = $result.Replace("__$key`__", [string]$Values[$key])
    }

    return $result
}

$resolvedPacketPath = Resolve-RequiredFile $PacketDraftPath
$resolvedOutputRoot = Resolve-OutputPath $OutputRoot
$resolvedProposalRoot = Resolve-OutputPath $ProposalRoot
$packetContent = Get-Content -LiteralPath $resolvedPacketPath -Raw

$packetName = Get-PacketField $packetContent 'Packet name'
$packetId = Get-PacketField $packetContent 'Packet id'
$packetStatus = Get-PacketField $packetContent 'Packet status'
$parentKbPath = Get-PacketField $packetContent 'Parent KB path'
$activeParentProject = Get-PacketField $packetContent 'Active parent project'
$sourceAppWorkspace = Get-PacketField $packetContent 'Source app workspace' $false
$sourceRequest = Get-PacketField $packetContent 'Source request'
$acceptedWritebackSource = Get-PacketField $packetContent 'Accepted writeback source' $false
$draftOutputPath = Get-PacketField $packetContent 'Draft output path'
$rawIdea = Get-PacketField $packetContent 'Raw idea'
$humanGuidance = Get-PacketField $packetContent 'Human guidance'
$targetUser = Get-PacketField $packetContent 'Target user or buyer'
$problem = Get-PacketField $packetContent 'Problem or opportunity'
$desiredOutcome = Get-PacketField $packetContent 'Desired outcome'
$firstWedge = Get-PacketField $packetContent 'First wedge'
$whyReusable = Get-PacketField $packetContent 'Why this is reusable'
$nonGoals = Get-PacketField $packetContent 'Non-goals'

if ($RunDate -notmatch '^\d{4}-\d{2}-\d{2}$') {
    throw "RunDate must use yyyy-MM-dd format."
}

if ([string]::IsNullOrWhiteSpace($RunSlug)) {
    $RunSlug = (ConvertTo-Slug $packetName) + '-artifact-run'
} else {
    $RunSlug = ConvertTo-Slug $RunSlug
}

$runFolderName = "$RunDate-$RunSlug"
$runPath = Join-Path $resolvedOutputRoot $runFolderName
$proposalFileName = "$RunDate-$RunSlug-proposal.md"
$proposalPath = Join-Path $resolvedProposalRoot $proposalFileName

Assert-PathUnderRoot -Path $runPath -Root $resolvedOutputRoot
Assert-PathUnderRoot -Path $proposalPath -Root $resolvedProposalRoot

if ((Test-Path -LiteralPath $runPath) -and -not $Force) {
    throw "Product Pipeline run '$runPath' already exists. Use -Force to regenerate it."
}

if ((Test-Path -LiteralPath $proposalPath) -and -not $Force) {
    throw "Product Pipeline proposal '$proposalPath' already exists. Use -Force to regenerate it."
}

$relativeProposalPath = "../../proposals/$proposalFileName"
$sourceWorkspaceLine = if ([string]::IsNullOrWhiteSpace($sourceAppWorkspace)) { 'Not recorded.' } else { $sourceAppWorkspace }
$writebackLine = if ([string]::IsNullOrWhiteSpace($acceptedWritebackSource)) { 'Not linked.' } else { $acceptedWritebackSource }

$values = @{
    ACCEPTED_WRITEBACK_SOURCE = $writebackLine
    ACTIVE_PARENT_PROJECT = $activeParentProject
    DRAFT_OUTPUT_PATH = $draftOutputPath
    FIRST_WEDGE = $firstWedge
    GENERATED_AT = $GeneratedAt
    HUMAN_GUIDANCE = $humanGuidance
    NON_GOALS = $nonGoals
    PACKET_ID = $packetId
    PACKET_NAME = $packetName
    PACKET_STATUS = $packetStatus
    PARENT_KB_PATH = $parentKbPath
    PROBLEM = $problem
    PROPOSAL_FILE_NAME = $proposalFileName
    PROPOSAL_RELATIVE_PATH = $relativeProposalPath
    RAW_IDEA = $rawIdea
    RUN_DATE = $RunDate
    RUN_FOLDER_NAME = $runFolderName
    RUN_SLUG = $RunSlug
    SOURCE_APP_WORKSPACE = $sourceWorkspaceLine
    SOURCE_PACKET_PATH = $resolvedPacketPath
    SOURCE_REQUEST = $sourceRequest
    TARGET_USER = $targetUser
    DESIRED_OUTCOME = $desiredOutcome
    WHY_REUSABLE = $whyReusable
}

$readmeTemplate = @'
# __PACKET_NAME__ Artifact Run

## Purpose

This run turns the reviewed packet draft for **__PACKET_NAME__** into a complete Product Pipeline artifact set.

## Generated From Packet Draft

- Packet id: `__PACKET_ID__`
- Packet status: `__PACKET_STATUS__`
- Source request: `__SOURCE_REQUEST__`
- Source app workspace: `__SOURCE_APP_WORKSPACE__`
- Parent KB path: `__PARENT_KB_PATH__`
- Active parent project: `__ACTIVE_PARENT_PROJECT__`
- Accepted writeback source: `__ACCEPTED_WRITEBACK_SOURCE__`
- Packet draft source: `__SOURCE_PACKET_PATH__`
- Generated at: __GENERATED_AT__

## Artifact Order

1. [Intake notes](intake-notes.md)
2. [Research brief](research-brief.md)
3. [Comparative analysis](comparative-analysis.md)
4. [Opportunity brief](opportunity-brief.md)
5. [Epic map](epic-map.md)
6. [Design brief](design-brief.md)
7. [Issue candidates](issue-candidates.md)
8. [Readiness review](readiness-review.md)
9. [Parent KB update plan](parent-kb-update-plan.md)
10. [Launch Intake packet](launch-intake-packet.md)
11. [GitHub output proposal](__PROPOSAL_RELATIVE_PATH__)

## Recommendation

Review this run as Product Pipeline output. Do not create GitHub issues from this generated run until the GitHub output proposal is approved.
'@

$intakeTemplate = @'
# Intake Notes - __PACKET_NAME__

## Source

- Product idea: __RAW_IDEA__
- Human guidance: __HUMAN_GUIDANCE__
- Parent KB path: `__PARENT_KB_PATH__`
- Session date: __RUN_DATE__
- Source request: `__SOURCE_REQUEST__`
- Source packet draft: `__SOURCE_PACKET_PATH__`

## Initial Product Shape

- Target user or buyer: __TARGET_USER__
- Problem or opportunity: __PROBLEM__
- Desired outcome: __DESIRED_OUTCOME__
- First-version appetite: Small, review-gated, reusable internal workflow.
- Constraints: __NON_GOALS__
- Known examples or analogs: Internal Product Pipeline run, KB writeback artifact, AppBuilder generated app proof.

## Emotional Signal

- Frustration to relieve: Promising ideas vanish in chat before becoming scoped work.
- Confidence to create: A founder or operator can see an idea become reviewable, traceable work.
- Moment that should feel compelling: Accepting a rough idea and receiving a clear artifact packet with next gates.
- Words or phrases from the human worth preserving: reusable, scalable, optimized, review material, not Dev Ready.

## Assumptions

- Explicit assumptions: __WHY_REUSABLE__
- Inferred assumptions: The first commercial wedge is a managed pilot before broad SaaS automation.
- Assumptions needing confirmation: Whether the next implementation branch is full Product Pipeline artifact generation or AppBuilder DB isolation promotion.

## Next Best Step

- Recommended next artifact: Review the GitHub output proposal.
- Reason: It keeps issue creation gated while giving Overwatch a complete artifact set to inspect.
'@

$researchTemplate = @'
# Research Brief - __PACKET_NAME__

## Research Question

Can __PACKET_NAME__ become the reusable front door for turning product ideas into governed Product Pipeline, KB Core, and AppBuilder work?

## Current Evidence

- Source packet draft exists at `__SOURCE_PACKET_PATH__`.
- Accepted writeback source: `__ACCEPTED_WRITEBACK_SOURCE__`
- The app-side source request is `__SOURCE_REQUEST__`.
- Target user or buyer: __TARGET_USER__
- Problem or opportunity: __PROBLEM__
- Desired outcome: __DESIRED_OUTCOME__

## What We Know

- The workflow already proves a persisted intake request, accepted request status, KB writeback, packet draft generation, and command manifest refresh.
- The reusable value is not the specific Launch Intake app. The reusable value is the governed transition from rough idea to artifact-backed work.
- GitHub issue creation remains intentionally review-gated.

## What Needs External Research

- Comparable productized intake/workflow tools.
- Pricing and buyer appetite for managed idea-to-app sprints.
- Security and privacy expectations for customer repo handoff.
- Which parts of the product brain should stay server-side, local-runner-side, or human-reviewed.

## Research Risk

This generated run does not include live market research. Treat it as internal discovery until external evidence is gathered.

## Recommendation

Continue with a narrow managed-pilot proof before broad SaaS claims.
'@

$comparisonTemplate = @'
# Comparative Analysis - __PACKET_NAME__

## Alternatives Compared

| Alternative | Strength | Weakness | Fit |
|---|---|---|---|
| Chat-only idea capture | Fast and flexible | Loses state, gates, and accountability | Poor long-term fit |
| Manual product brief | Familiar and reviewable | Slow to repeat and easy to skip | Useful fallback |
| Generic project intake form | Structured and simple | Does not produce Product Pipeline, KB, or AppBuilder artifacts | Partial fit |
| __PACKET_NAME__ packet-to-run workflow | Produces governed artifacts and handoffs | Needs review and template discipline | Best current fit |

## Differentiator Thesis

The differentiator is not just capturing an idea. It is preserving provenance from raw idea to Product Pipeline artifacts, parent KB updates, issue candidates, readiness gates, and AppBuilder handoff options.

## Buyer Impact

- Operators get less drift between intent and execution.
- Founders get a repeatable way to test ideas without prematurely building.
- Internal agents get artifacts that reduce repeated orientation cost.

## Recommendation

Use the packet-to-run path as the internal productization spine. Keep external claims modest until one customer-shaped managed pilot is complete.
'@

$opportunityTemplate = @'
# Opportunity Brief - __PACKET_NAME__

## Product Direction

- Product idea: __RAW_IDEA__
- Target market focus: __TARGET_USER__
- Primary user: Founder or product operator with raw ideas and limited time to turn them into scoped work.
- Buyer or sponsor: Founder, solo builder, agency operator, or internal product lead.
- First wedge: __FIRST_WEDGE__

## Problem

- Pain: __PROBLEM__
- Current workaround: Chat notes, manual planning, scattered docs, and ad hoc issue creation.
- Why now: The Nodera operating loop now has enough verified pieces to dogfood a governed handoff.

## Differentiation

- Differentiator thesis: Move from idea to artifact-backed work without losing review gates.
- Emotional calling: The user should feel the idea is being held carefully and converted into something completable.
- What should feel meaningfully better: Less repeated explaining, fewer stale handoffs, and clearer next gates.

## Scope

- In scope for first slice: Packet review, full artifact run, issue candidates, readiness review, and parent KB update plan.
- Out of scope for first slice: __NON_GOALS__
- Design dependency: Visible buyer-facing experience still needs design review before public launch.
- AppGenerator dependency: AppBuilder DB isolation and template promotion remain separate decisions.

## Risks

- Product risk: The managed pilot offer may need sharper buyer framing.
- Research risk: External market evidence is still pending.
- Design risk: Public website and buyer-facing flows are not designed yet.
- Implementation risk: Treating draft candidates as Dev Ready would bypass governance.

## Recommendation

- Recommended epic map: Idea intake, artifact generation, review gate, implementation handoff.
- Recommended next issue type: Review-gated Product Pipeline or Overwatch coordination issue.
- Readiness gate: Draft Ready, not Dev Ready.
'@

$epicTemplate = @'
# Epic Map - __PACKET_NAME__

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
'@

$designTemplate = @'
# Design Brief - __PACKET_NAME__

## Design Status

Design is required before any public buyer-facing Launch Intake experience. This generated artifact run does not approve visual design.

## User Experience Intent

- The operator should see a calm intake surface that converts rough ideas into reviewable packets.
- The review state must be obvious: draft, accepted, blocked, or ready for a next module.
- Generated artifacts should feel like a workbench, not a marketing page.

## Required Design Decisions

- Public website and offer framing.
- Intake form density and fields.
- Review queue states.
- Export/proposal review affordances.
- Trust, privacy, and IP protection copy.

## Non-Goals

- Do not create a broad form-builder UI.
- Do not make design execution part of Product Pipeline.
- Do not ship customer-facing copy without a separate review.

## Recommendation

Keep this design brief as a Product Pipeline handoff. Route execution to a design module, AppBuilder UI task, or human review when the public surface becomes the next priority.
'@

$issuesTemplate = @'
# Issue Candidates - __PACKET_NAME__

Do not create GitHub issues from this generated run without proposal approval.

## Candidate 1: Review Packet-To-Run Artifact Set

## Title

Product Pipeline: Review __PACKET_NAME__ full artifact run

## Work Type

Task

## Readiness Gate

Draft Ready

## Module Boundary

Product Pipeline

## Goal

Review the generated artifact set and decide whether it is accepted, needs revision, or should become live GitHub output.

## Context

This candidate is generated from packet draft `__PACKET_ID__`, source request `__SOURCE_REQUEST__`, and parent KB project `__ACTIVE_PARENT_PROJECT__`.

## Non-Goals

- Do not implement app changes.
- Do not create GitHub issues before approval.
- Do not mark implementation work Dev Ready.

## Acceptance Criteria

- [ ] Intake, research, comparison, opportunity, epic, issue, readiness, design, and parent-KB artifacts are reviewed.
- [ ] Missing research or design questions are either accepted as known gaps or converted into follow-up work.
- [ ] Overwatch records the review outcome.

## Verification Plan

- Inspect this run folder and proposal file.
- Confirm the proposal still blocks live GitHub issue creation.

## Candidate 2: Promote Generated-App DB Isolation

## Title

AppBuilder: Promote Launch Intake DB isolation defaults into generated-app source path

## Work Type

Task

## Readiness Gate

Draft Ready

## Module Boundary

AppGenerator

## Goal

Move the proven generated-app database isolation lessons into the AppBuilder source path so future generated apps do not need manual DB-port/name fixes.

## Context

Launch Intake proved app-specific database names and port `5441`; the reusable AppBuilder path should learn that without copying domain-specific Launch Intake behavior.

## Non-Goals

- Do not copy Launch Intake domain routes into the generic template.
- Do not change Product Pipeline artifacts.

## Acceptance Criteria

- [ ] AppBuilder source has deterministic generated-app DB identity defaults.
- [ ] Verification docs explain generated-app DB isolation.
- [ ] Existing source template checks still pass.

## Candidate 3: Approve Or Defer Live GitHub Output

## Title

Overwatch: Approve or defer __PACKET_NAME__ generated issue output

## Work Type

Decision

## Readiness Gate

Blocked

## Module Boundary

Overwatch

## Goal

Decide whether any candidates from this run should become live GitHub issues and Project rows.

## Blocker

Human or Overwatch approval is required before GitHub mutation.
'@

$readinessTemplate = @'
# Readiness Review - __PACKET_NAME__

## Summary

This artifact run is reviewable Product Pipeline output. It is not Dev Ready.

## Gate Results

| Gate | Result | Notes |
|---|---|---|
| Product intent | Pass | Source request `__SOURCE_REQUEST__` provides target user, problem, and outcome. |
| Parent KB context | Pass | Parent KB path is `__PARENT_KB_PATH__`. |
| Research evidence | Partial | Internal evidence exists; external market research is pending. |
| Design dependency | Blocked | Buyer-facing surface needs design review. |
| GitHub output | Blocked | Proposal approval is required before issue creation. |
| AppBuilder implementation | Blocked | AppBuilder substrate decision remains open. |

## Recommendation

Accept this as Draft Ready Product Pipeline review material. Do not treat it as Dev Ready implementation work.
'@

$parentKbTemplate = @'
# Parent KB Update Plan - __PACKET_NAME__

## Parent KB

- Path: `__PARENT_KB_PATH__`
- Active project: `__ACTIVE_PARENT_PROJECT__`

## Updates Required

### Audit Log

- Entry summary: Record generated Product Pipeline artifact run from packet draft `__PACKET_ID__`.
- Files or GitHub artifacts: `product-pipeline/runs/__RUN_FOLDER_NAME__/`, `product-pipeline/proposals/__PROPOSAL_FILE_NAME__`.
- Verification: Product Pipeline generator test, Markdown link check, placeholder scan, and `git diff --check`.

### Decision Log

- Decision: Treat packet-to-run output as review material before issue creation.
- Context: __PROBLEM__
- Consequences: Live GitHub issue creation remains gated; AppBuilder work remains deferred until review.

### Current State

- Active focus change: Review generated Product Pipeline artifact run.
- Last action: Generated full artifact set from `__SOURCE_PACKET_PATH__`.
- Next intended move: Accept/revise this run, then choose live issue output or AppBuilder DB isolation promotion.

### Index

- New routing entries: Full Product Pipeline artifact run and GitHub output proposal.
- Updated routing entries: Packet draft, current state, audit log, product artifacts.

### Product Artifacts

- New artifact paths: `product-pipeline/runs/__RUN_FOLDER_NAME__/`.
- Updated artifact paths: `__DRAFT_OUTPUT_PATH__`.

## Completion Check

- [ ] Parent KB audit entry is written.
- [ ] Parent KB decisions are recorded.
- [ ] Parent KB current state reflects the new product direction.
- [ ] New product docs are routed from the parent KB index.
- [ ] GitHub issue or project references are linked only after approval.
'@

$proposalTemplate = @'
# GitHub Output Proposal - __PACKET_NAME__ Artifact Run

## Review Required

This proposal is generated from `product-pipeline/runs/__RUN_FOLDER_NAME__/`. It does not create GitHub issues.

## Recommendation

Review Candidate 1 first. Defer Candidate 2 or Candidate 3 unless Overwatch chooses AppBuilder DB isolation or live issue output as the next lane.

## Candidate Output

- Candidate 1: Product Pipeline review of the generated artifact set.
- Candidate 2: AppBuilder generated-app DB isolation promotion.
- Candidate 3: Overwatch approval or deferral of live GitHub output.

## Approval Gate

Live GitHub mutation is blocked until this proposal is explicitly approved.

## Source

- Packet id: `__PACKET_ID__`
- Source request: `__SOURCE_REQUEST__`
- Parent KB: `__PARENT_KB_PATH__`
- Generated at: __GENERATED_AT__
'@

$packetCopyTemplate = @'
# Launch Intake Packet - __PACKET_NAME__

## Generated Run Linkage

- Run folder: `product-pipeline/runs/__RUN_FOLDER_NAME__/`
- Source packet draft: `__SOURCE_PACKET_PATH__`
- Source request: `__SOURCE_REQUEST__`
- Generated at: __GENERATED_AT__

## Source Packet Content

__PACKET_CONTENT__
'@

$documents = @(
    @{ Path = (Join-Path $runPath 'README.md'); Template = $readmeTemplate },
    @{ Path = (Join-Path $runPath 'intake-notes.md'); Template = $intakeTemplate },
    @{ Path = (Join-Path $runPath 'research-brief.md'); Template = $researchTemplate },
    @{ Path = (Join-Path $runPath 'comparative-analysis.md'); Template = $comparisonTemplate },
    @{ Path = (Join-Path $runPath 'opportunity-brief.md'); Template = $opportunityTemplate },
    @{ Path = (Join-Path $runPath 'epic-map.md'); Template = $epicTemplate },
    @{ Path = (Join-Path $runPath 'design-brief.md'); Template = $designTemplate },
    @{ Path = (Join-Path $runPath 'issue-candidates.md'); Template = $issuesTemplate },
    @{ Path = (Join-Path $runPath 'readiness-review.md'); Template = $readinessTemplate },
    @{ Path = (Join-Path $runPath 'parent-kb-update-plan.md'); Template = $parentKbTemplate }
)

if ((Test-Path -LiteralPath $runPath) -and $Force) {
    Remove-Item -LiteralPath $runPath -Recurse -Force
}

if ((Test-Path -LiteralPath $proposalPath) -and $Force) {
    Remove-Item -LiteralPath $proposalPath -Force
}

New-Item -ItemType Directory -Path $runPath -Force | Out-Null
New-Item -ItemType Directory -Path $resolvedProposalRoot -Force | Out-Null

foreach ($document in $documents) {
    Write-TextFile -Path $document.Path -Content (Fill-Template -Template $document.Template -Values $values)
}

$packetValues = $values.Clone()
$packetValues['PACKET_CONTENT'] = $packetContent.Trim()
Write-TextFile -Path (Join-Path $runPath 'launch-intake-packet.md') -Content (Fill-Template -Template $packetCopyTemplate -Values $packetValues)
Write-TextFile -Path $proposalPath -Content (Fill-Template -Template $proposalTemplate -Values $values)

Write-Output "Generated Product Pipeline artifact run at $runPath"
Write-Output "Generated review-gated proposal at $proposalPath"
