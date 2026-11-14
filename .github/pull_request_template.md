## Summary

<What changed and why, in 2 to 3 sentences. Link the issue or ADR.>

## Scope check

- [ ] Every changed line traces to the request
- [ ] Out of scope noticed but not touched: <list>
- [ ] No core-stack change without an ADR

## Verification gates

<Paste the table from `python skills/pipeline/scripts/run_gate.py . --run --out evidence.md`>

| Gate | Required | Status | Evidence |
| :-- | :-: | :-: | :-- |

## Tests

- Failing test before the fix: <name / link>
- Command and result: `<command>` -> <summary line>

## Risk and rollback

- What could break:
- Rollback: <exact procedure>

## Agent action log (if an agent worked on this)

`python skills/pipeline/scripts/action_log.py summary` -> <paste>

## Dependencies added or changed

<Adoption gate result per dependency, or "none">
