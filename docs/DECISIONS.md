# Decisions

Each entry: context, decision, why. Newest last.

## D1 — Hexagonal + vertical slices + rich domain, a subset of Salesman's EvolutionBackend rules

- Context: Salesman's EvolutionBackend applies these with a full DDD rule set.
- Decision: keep what costs nothing in Dart — inward dependencies, invariants
  in the aggregate, validating `create` returning `Result`, immutable value
  objects, orchestrating handlers, chain pure / imperative effects, shared
  types only with two consumers. Drop backend-only rules: domain and
  integration events, outbox, transactions per aggregate, HTTP status on
  errors, `Common`/`Contracts` projects, `Entity.Change`, event sourcing.
- Why: the app has no broker, no database of its own and no HTTP surface.

## D2 — Unavailability is a typed reason, separate from the domain error

- Decision: `Outcome<R, E, T>` with `Done`, `Failed` and `Blocked`. `R`
  implements `Reason`: a stable `code` plus a JSON `payload`, read from a
  freezed union's `toJson` (`unionKey: 'code'`). Never free text.
- Why: one flat `switch` instead of `Either<R, Result<E, T>>`; the code is a
  public contract for agents and the UI localizes it.
- Constraint: freezed writes `code` only for unions with two or more variants.

## D3 — Availability hands the function only through `Right`

- Decision: `Availability.method` returns `ValueListenable<Either<R, F>>`
  with `F` typed, as ciapp's guards do.
- Why: a caller cannot call a function without handling why it may be
  unavailable. Availability state is reactive.

## D4 — MCP is an adapter, outside CQRS

- Decision: `Command` and `Query` are interfaces with one `call`. Tool name,
  description and input contract live in `McpTool` (`arq_ai`).
- Why: commands and queries are input ports; MCP is one adapter in front of
  them, like the viewmodel. Without metadata the base is empty, so it is an
  interface.

## D5 — A command returns the result of its own write

- Context: CQS (Meyer) and EvolutionBackend's ADR 0011 (commands return
  `Unit` or the generated id).
- Decision: `Unit`, the generated id, or the server's answer about that
  write — never a projection of the aggregate.
- Why: keeps reads out of writes and the contract small, without adding a
  query only to read back what the write just answered (common when a write
  talks to an online-only server).

## D6 — One port per aggregate

- Context: EvolutionBackend's ADR 0012 splits `Queries` from `Repository`
  because of EF change tracking and a growing write port.
- Decision: one port per aggregate; split reads into `<Aggregate>Queries`
  when the port mixes many reads with its writes.
- Why: aggregates are immutable (no tracking) and return types already tell
  reads (`ValueListenable`) from writes (`Future`).
