# Nexa Product Pipeline - DECISION LOG

Record durable decisions in reverse chronological order.

## 2026-05-16 - Use a temporary module-build KB, not a final runtime KB

**Tags:** architecture, parent-kb-integration, module-boundary

**Context:** The module needs durable working memory while it is being designed, but Richard explicitly noted that the end Product Pipeline module should be tied to the parent KB rather than owning its own KB.

**Options considered:**

- A: Give Product Pipeline its own runtime KB forever.
- B: Use no KB while designing the module.
- C: Use this repo as a temporary build KB, while designing the final module to read/write the parent KB.

**Decision:** Choose C.

**Why:** The build process needs continuity, audit, and routing. The final module should still preserve the Nexa operating model where project context lives in the active parent KB.

**Consequences:**

- This repo can store module-build research, decisions, and tasks.
- The final module contract must define parent KB inputs and outputs.
- Future agents should not assume every Product Pipeline run creates a new KB.

## 2026-05-16 - Keep design as a collaboration boundary for initial planning

**Tags:** design-collaboration, module-boundary, product-strategy

**Context:** Product Pipeline may need to involve a designer later. The current uncertainty is whether design should be embedded or kept separate.

**Options considered:**

- A: Fully merge design into Product Pipeline.
- B: Keep Product Pipeline separate and create a design handoff gate.
- C: Ignore design until implementation tasks need it.

**Decision:** Start with B while preserving the option to add a lightweight design brief.

**Why:** Product Pipeline should own product direction and readiness. Design should be able to consume that direction without forcing this module to become a design module too early.

**Consequences:**

- Product artifacts should include design-relevant context.
- Implementation tasks that need visual direction should not pass ready-for-dev until design output exists.
- A future module design can decide whether the design brief is internal or delegated.

## 2026-05-16 - Use GitHub Project 4 as the live tracker for this module

**Tags:** github-project, task-tracking, backlog-generation

**Context:** Richard requested a Project directly under the Nexa-ProductPipeline repo to track tasks and work.

**Decision:** Create `Nexa Product Pipeline` at `https://github.com/users/4-10/projects/4` and link it to `4-10/Nexa-ProductPipeline`.

**Consequences:**

- GitHub Issues and Project items should own live task status.
- This KB should explain process and durable reasoning, not duplicate the whole board.
- Project fields should support work type, readiness, and module boundary.
