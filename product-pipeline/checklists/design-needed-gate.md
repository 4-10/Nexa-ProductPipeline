# Design-Needed Gate

Use this gate when Product Pipeline output might require visual, interaction, or brand direction before implementation.

## Questions

- Does the task require layout, visual hierarchy, or brand tone?
- Does the user need to inspect a UI before build work starts?
- Would implementation create visible product commitments without design input?
- Are brand adjectives, anti-adjectives, or emotional tone missing?
- Does the task affect a primary workflow or first impression?

## Outcomes

### No Design Needed

The task can proceed with existing design conventions or no visible UI.

### Lightweight Design Brief Needed

Create `product-pipeline/templates/design-brief.md` output and keep the work at Draft Ready until reviewed.

### Dedicated Design Issue Needed

Create a design issue candidate and keep dependent implementation tasks Blocked.

## Rule

Do not mark a visible implementation task Dev Ready when required design direction is missing.
