---
name: arq-architecture
description: The architecture of an app built on reef and arq — hexagonal layers, vertical slices and a rich domain. Use when creating a module, a use case, an aggregate, a port or an adapter, or when deciding where code goes.
---

# Architecture of an arq app

Hexagonal, with vertical slices and a rich domain. Done when a change keeps
every dependency pointing inward and the domain carries its own rules.

## Layout

```text
lib/
  core/                         # AppUnavailable, aliases, NoInput
  modules/<context>/            # one bounded context
    domain/                     # aggregates, value objects, errors
    application/
      <aggregate>_repository.dart          # port
      <use_case>/<use_case>_command.dart   # slice: input + handler
    infrastructure/             # facade, availability, port adapters
    presentation/<screen>/      # reef quartet
    mcp/<context>_tools.dart    # McpTool list
    <context>_providers.dart
  tools.dart                    # every module's tools
```

## Rules

- Dependencies point inward: domain ← application ← infrastructure,
  presentation and mcp. The domain imports no Flutter and no arq.
- Rich domain: an invariant lives in the aggregate, never in its caller.
  Creation that validates is a static `create` returning `Result<E, T>`.
  Value objects are immutable and compared by value (freezed, extension types).
- A use case only orchestrates: build value objects, drive the aggregate,
  call the port. Chain pure steps; compose effects imperatively, one
  variable per step with an early return.
- A command returns the result of its own write — `Unit`, the generated id,
  or the server's answer about that write — never a projection of the
  aggregate. Reading is a query's job.
- One port per aggregate, declared in `application/`. Split reads into
  `<Aggregate>Queries` only when the port mixes many reads with its writes.
- Unavailability is an application concern: ports and use cases return
  `Outcome`; the domain returns `Result`.
- MCP is an adapter. Use cases know nothing about it; tools live in `mcp/`.
- `arq` gains a type only when two apps need it. A base class in `arq`
  holds only mechanism, never dependencies or business rules.

See the `arq-ai` and `arq-offline` skills for use cases and data access, and
`docs/DECISIONS.md` for why.
