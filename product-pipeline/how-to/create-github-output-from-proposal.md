# Create GitHub Output From An Approved Proposal

Use this procedure only after Richard approves a Product Pipeline issue proposal. This is a review-gated path: proposal review happens first, GitHub mutations happen only after approval is explicit.

## Prerequisites

- The proposal exists under `product-pipeline/proposals/`.
- Each issue candidate has title, goal, non-goals, acceptance criteria, verification, labels, Work Type, Readiness Gate, and Module Boundary.
- `gh auth status` succeeds.
- GitHub Project 4 is available for owner `4-10`.
- Richard has approved the exact issue candidate or candidate set to create.

## Verification Before Mutating GitHub

Run these read-only checks before creating issues or Project items:

```powershell
gh auth status
gh project view 4 --owner 4-10
gh issue list --repo 4-10/Nexa-ProductPipeline --state open --limit 20
```

Expected: authentication succeeds, Project 4 is visible, and the open issue list is understood before adding more work.

## Review Gate

Before any mutation, compare the approved proposal against the current repo and Project state.

- Confirm the proposal item is approved.
- Confirm there is no duplicate open issue.
- Confirm acceptance criteria and verification are concrete enough for an implementation agent.
- Confirm design-needed work is marked with the correct Readiness Gate.
- Confirm labels, Work Type, Readiness Gate, and Module Boundary are present.

Stop if any item is missing or ambiguous.

## Create One Issue

Create exactly one approved issue at a time:

```powershell
gh issue create --repo 4-10/Nexa-ProductPipeline --title "Add Product Pipeline artifact templates" --label "type:story" --label "area:product" --body-file .\product-pipeline\proposals\issue-bodies\add-product-pipeline-artifact-templates.md
```

Expected: command returns the created issue URL.

## Add Issue To Project

Use the URL returned by `gh issue create`:

```powershell
$createdIssueUrl = "https://github.com/4-10/Nexa-ProductPipeline/issues/1"
$itemId = gh project item-add 4 --owner 4-10 --url $createdIssueUrl --format json --jq '.id'
```

Expected: `$itemId` contains the Project item id returned by `gh project item-add`.

## Set Project Fields

Run these commands only after Richard has approved the proposal item and the issue has been created and added to Project 4.

Capture the Project id and the Project field metadata:

```powershell
$projectId = gh project view 4 --owner 4-10 --format json --jq '.id'
$fields = gh project field-list 4 --owner 4-10 --format json | ConvertFrom-Json
```

Capture the field ids:

```powershell
$workTypeFieldId = ($fields.fields | Where-Object { $_.name -eq "Work Type" }).id
$readinessGateFieldId = ($fields.fields | Where-Object { $_.name -eq "Readiness Gate" }).id
$moduleBoundaryFieldId = ($fields.fields | Where-Object { $_.name -eq "Module Boundary" }).id
```

Capture the single-select option ids that match the approved proposal. Example values:

```powershell
$workTypeOptionId = (($fields.fields | Where-Object { $_.name -eq "Work Type" }).options | Where-Object { $_.name -eq "Story" }).id
$readinessGateOptionId = (($fields.fields | Where-Object { $_.name -eq "Readiness Gate" }).options | Where-Object { $_.name -eq "Dev Ready" }).id
$moduleBoundaryOptionId = (($fields.fields | Where-Object { $_.name -eq "Module Boundary" }).options | Where-Object { $_.name -eq "Product Pipeline" }).id
```

Verify all ids were captured before editing fields:

```powershell
$projectId
$itemId
$workTypeFieldId
$workTypeOptionId
$readinessGateFieldId
$readinessGateOptionId
$moduleBoundaryFieldId
$moduleBoundaryOptionId
```

Set `Work Type`, `Readiness Gate`, and `Module Boundary` one field at a time:

```powershell
gh project item-edit --id $itemId --project-id $projectId --field-id $workTypeFieldId --single-select-option-id $workTypeOptionId
gh project item-edit --id $itemId --project-id $projectId --field-id $readinessGateFieldId --single-select-option-id $readinessGateOptionId
gh project item-edit --id $itemId --project-id $projectId --field-id $moduleBoundaryFieldId --single-select-option-id $moduleBoundaryOptionId
```

Expected: each `gh project item-edit` command succeeds without changing any field outside the approved proposal.

## Verify

Run these checks after creating the issue and setting Project fields:

```powershell
gh issue list --repo 4-10/Nexa-ProductPipeline --state open --limit 20
gh project item-list 4 --owner 4-10 --limit 20
```

Expected: created issues appear in the repo and in Project 4 with correct fields.

## Stop Conditions

Do not create an issue when:

- the proposal item is not approved,
- acceptance criteria are weak,
- verification is missing,
- design is needed but not marked,
- Work Type, Readiness Gate, or Module Boundary is missing.
