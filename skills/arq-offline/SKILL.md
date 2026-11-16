---
name: arq-offline
description: How an app built on arq reaches its data — services, availability and facades over N implementations (online, offline, cache). Use when adding an endpoint, a service, offline support or a data source.
---

# Data access with arq_offline

```
Use case → Repository → Service → Availability → Facade → implementations (online, offline, …)
```

Done when every layer returns the shapes below and has a unit test with a
fake for the layer under it.

## Return shapes

Every layer from repository down follows one rule:

| Kind | Returns |
|---|---|
| Action (writes, side effects) | `Future<Result<E, T>>` |
| Get (may emit more than once) | `ValueListenable<Async<Result<E, T>>>` |
| Get, single use | `Future<Result<E, T>>` named `<get>Once`, via `once()` from `arq` |

Streams stay out of every signature.

## Facade

One facade per backend feature. It holds N implementations of the same
contract and decides how to combine them; the two strategies ready in
`arq_offline` order them by priority:

```dart
class NoteFacade {
  NoteFacade({this.online, this.offline});

  final NoteClient? online;
  final NoteClient? offline;

  Future<Result<NoteError, Note>> add(String text) =>
      fallback([?online, ?offline].map((c) => () => c.add(text)), none: const NoteError.unavailable());

  ValueListenable<Async<Result<NoteError, NoteList>>> watch(String filter) =>
      prioritize([?online, ?offline].map((c) => c.watch(filter)).toList(), none: const NoteError.unavailable());
}
```

- `fallback` tries actions in order until one succeeds; all fail → first error.
- `prioritize` follows gets at once: the highest-priority success wins, a
  lower one shows while higher ones load, errors wait for every source.
- A facade that needs another rule writes it; these two are defaults.

## Availability

Tells whether the facade can run right now and why not. It decides a bundle
(the implementations that exist) from app state and rebuilds the facade only
when the bundle changes, so the bundle needs value equality (`@freezed` or a
record).

```dart
final notes = Availability<NoteFacade, NoteBundle, AppState, Unavailable>(
  state: appState,
  decide: (s) => s.session == null ? const Left(Unavailable.signedOut) : Right(NoteBundle(online: s.online, offline: s.offline)),
  facade: (b) => NoteFacade(online: b.online, offline: b.offline),
);
```

Use `call` for actions, `watch` for gets, `once` for a single read. Each takes
`unavailable:` to turn the reason into the service's error type.

## Service and repository

- A **service** wraps one availability: one method per facade method, mapping
  the reason with `unavailable:`.
- A **repository** gives the domain view of one aggregate: combines services,
  maps transport data to domain types, owns caches as `ValueNotifier`s.

## Providers

Facades, availabilities, services and repositories are `keepAlive` riverpod
providers.
