# Epic Map - Nodera Launch Intake

## Product Direction

- Opportunity brief: [Nodera Launch Intake](opportunity-brief.md)
- Target user: Richard first; future founders/operators later.
- First wedge: Launch packet contract that can become a UI later.

## Epics

### Epic 1: Launch Packet Contract

- Goal: Define the smallest durable packet that turns a raw idea into Product Pipeline, KB Core, and AppBuilder-ready context.
- Non-goal: Do not build a generic form builder or public portal.
- User or agent outcome: A fresh session can read one packet and know target user, pain, first wedge, risks, and next gate.
- Dependencies: Product Pipeline artifact templates and Overwatch Integration Contract v0.
- Readiness: Draft Ready after this proposal is reviewed.

### Epic 2: Pilot KB Bootstrap

- Goal: Use the accepted Nexa-AOS bootstrap path to initialize a pilot KB only after the launch packet is accepted.
- Non-goal: Do not create a new GitHub repo until the pilot path requires it.
- User or agent outcome: The pilot has durable `CURRENT-STATE`, audit, decisions, and product artifacts.
- Dependencies: Nexa-AOS D4/D5 productization, already complete.
- Readiness: Draft Ready; can become Dev Ready after the pilot substrate decision.

### Epic 3: Optional Command-Center Intake Surface

- Goal: Add a small screen or panel that captures the launch packet fields using the AppBuilder proof.
- Non-goal: Do not add auth, persistence, payments, or public sharing in the first pass.
- User or agent outcome: Richard can see and exercise the launch intake shape in a real app surface.
- Dependencies: Decision on using the local AppBuilder proof as-is versus promoting/backing up the domain-neutral packet first.
- Readiness: Blocked on AppBuilder substrate decision.

## Sequencing

- First: Review and accept the launch packet contract.
- Second: Generate/init the pilot KB using the accepted KB bootstrap path.
- Later: Build the optional command-center intake surface if the packet proves useful.

## Notes

- Design-needed items: Visible intake screen layout and tone if Epic 3 starts.
- Research-needed items: Minimum viable fields after first real use.
- Parent KB updates: Overwatch `#7` current state, audit log, issue artifact, and roadmap should point to this run.
