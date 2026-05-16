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

## Prepare The Issue Body File

After approval, create the issue body file from the approved proposal item. This example uses the approved dogfood proposal candidate `Create Product Pipeline workflow skill source`, which is marked `Create now: Yes`, `Work Type: Story`, `Readiness Gate: Draft Ready`, and `Module Boundary: Product Pipeline`.

```powershell
$issueTitle = "Create Product Pipeline workflow skill source"
$issueBodyDir = ".\product-pipeline\proposals\issue-bodies"
$issueBodyFile = Join-Path $issueBodyDir "create-product-pipeline-workflow-skill-source.md"

New-Item -ItemType Directory -Force -Path $issueBodyDir

@'
## Goal

Convert the Product Pipeline v0 workflow into a repo-owned skill source that future sessions can invoke.

## Non-goals

- Do not install the skill globally until the dogfood pass is reviewed.
- Do not create GitHub output without Richard's approval checkpoint.

## Acceptance criteria

- Skill source exists under a repo-owned skills path.
- Skill points to templates, gates, and proposal workflow.
- Skill includes parent KB writeback rules.
- Skill includes the review checkpoint before GitHub creation.

## Verification

- Skill file exists.
- Routing docs mention it.
- Placeholder scan passes.

## Product Pipeline fields

- Work Type: Story
- Readiness Gate: Draft Ready
- Module Boundary: Product Pipeline
'@ | Set-Content -LiteralPath $issueBodyFile -Encoding UTF8
```

Expected: `$issueBodyFile` exists and matches the approved proposal item.

## Create One Issue

Create exactly one approved issue at a time:

```powershell
$issueTitle = "Create Product Pipeline workflow skill source"

$duplicates = gh issue list --repo 4-10/Nexa-ProductPipeline --state open --search "`"$issueTitle`" in:title" --json number,title,url |
    ConvertFrom-Json |
    Where-Object { $_.title -eq $issueTitle }

if ($duplicates) {
    $duplicates | Format-Table number,title,url
    throw "Stop: an open issue with the exact approved title already exists."
}
```

Expected: `$duplicates` is empty. Stop if any exact-title duplicate is returned.

After the duplicate check passes and approval is still current, create the issue:

```powershell
$createdIssueUrl = gh issue create --repo 4-10/Nexa-ProductPipeline --title $issueTitle --label "type:story" --label "area:product" --body-file $issueBodyFile
$createdIssueNumber = [int]::Parse(($createdIssueUrl -replace ".*/issues/", ""))
```

Expected: `$createdIssueUrl` contains the created issue URL and `$createdIssueNumber` contains its issue number.

## Add Issue To Project

Use the URL returned by `gh issue create`:

```powershell
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

Stop if any field id is empty.

Capture the single-select option ids that match the approved proposal. Example values:

```powershell
$workTypeOptionId = (($fields.fields | Where-Object { $_.name -eq "Work Type" }).options | Where-Object { $_.name -eq "Story" }).id
$readinessGateOptionId = (($fields.fields | Where-Object { $_.name -eq "Readiness Gate" }).options | Where-Object { $_.name -eq "Draft Ready" }).id
$moduleBoundaryOptionId = (($fields.fields | Where-Object { $_.name -eq "Module Boundary" }).options | Where-Object { $_.name -eq "Product Pipeline" }).id
```

Stop if any option id is empty.

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

Run these checks after creating the issue and setting Project fields. They verify the specific created issue and Project item, not just the first page of lists:

```powershell
$createdIssue = gh issue view $createdIssueNumber --repo 4-10/Nexa-ProductPipeline --json number,title,url,state | ConvertFrom-Json
$projectItems = gh project item-list 4 --owner 4-10 --limit 100 --format json | ConvertFrom-Json
$createdProjectItem = $projectItems.items | Where-Object { $_.id -eq $itemId -or $_.content.url -eq $createdIssueUrl }

$createdIssue
$createdProjectItem
```

Expected: `$createdIssue.url` equals `$createdIssueUrl`, `$createdIssue.title` equals `$issueTitle`, and `$createdProjectItem` is present with the expected Project field values.

## Stop Conditions

Do not create an issue when:

- the proposal item is not approved,
- an open issue with the exact approved title already exists,
- acceptance criteria are weak,
- verification is missing,
- design is needed but not marked,
- Work Type, Readiness Gate, or Module Boundary is missing,
- Project lookup, field lookup, or option lookup fails.

## Rollback And Recovery Conditions

If any mutation succeeds and a later step fails, stop immediately. Do not continue creating more issues or Project items. Summarize the partial output, confirm the recovery action with Richard, then use the smallest cleanup that restores the approved state.

### Issue Created But Project Item Add Fails

Condition: `$createdIssueUrl` exists, but `$itemId` was not created.

Recovery after Richard confirms cleanup:

```powershell
gh issue close $createdIssueNumber --repo 4-10/Nexa-ProductPipeline --reason "not planned" --comment "Closed during Product Pipeline output rollback: Project item creation failed before this issue was ready for the board."
```

Expected: the issue is closed as not planned and no Project item exists.

### Project Item Created But Field Update Fails

Condition: `$itemId` exists, but one or more required field updates failed or cannot be verified.

Recovery after Richard confirms cleanup:

```powershell
gh project item-delete 4 --owner 4-10 --id $itemId
gh issue close $createdIssueNumber --repo 4-10/Nexa-ProductPipeline --reason "not planned" --comment "Closed during Product Pipeline output rollback: required Project fields could not be set or verified."
```

Expected: the Project item is removed and the issue is closed as not planned.

### Wrong Labels, Fields, Or Body Discovered After Creation

Condition: the issue or Project item exists, but the title, body, labels, Work Type, Readiness Gate, or Module Boundary does not match the approved proposal.

Recovery after Richard confirms whether to correct or close:

- If the mismatch is small and Richard approves correction, update only the incorrect issue metadata or Project field, then rerun the specific issue and Project item verification.
- If the mismatch changes the approved scope, remove the Project item and close the issue:

```powershell
gh project item-delete 4 --owner 4-10 --id $itemId
gh issue close $createdIssueNumber --repo 4-10/Nexa-ProductPipeline --reason "not planned" --comment "Closed during Product Pipeline output rollback: created output did not match the approved proposal."
```

Expected: no incorrect board item remains; the mismatched issue is either corrected and verified or closed.

### Duplicate Discovered After Creation

Condition: a matching issue is discovered after `$createdIssueUrl` was created.

Recovery after Richard confirms the duplicate target:

```powershell
gh project item-delete 4 --owner 4-10 --id $itemId
gh issue close $createdIssueNumber --repo 4-10/Nexa-ProductPipeline --reason "duplicate" --duplicate-of $existingIssueNumber --comment "Closed during Product Pipeline output rollback: duplicate discovered after creation."
```

Expected: the duplicate issue is closed as a duplicate and its Project item is removed.
