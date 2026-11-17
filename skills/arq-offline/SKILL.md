---
name: arq-offline
description: How an app built on arq reaches its data — availability and facades over N implementations (online, offline, cache). Use when adding an endpoint, offline support, a data source or an unavailability reason.
---

# Data access with arq_offline

```
Use case → Repository (port) → adapter: Availability → Facade → implementations (online, offline, …)
```

Done when each layer returns the shapes below and has a unit test with a fake
for the layer under it.

## Return shapes

| Layer | Action | Get |
|---|---|---|
| Facade and implementations | `Future<Result<E, T>>` | `ValueListenable<Async<Result<E, T>>>` |
| Availability | `ValueListenable<Either<R, F>>` | `ValueListenable<Async<Outcome<R, E, T>>>` |
| Repository and use case | `Future<Outcome<R, E, T>>` | `ValueListenable<Async<Outcome<R, E, T>>>` |

Streams stay out of every signature.

## Facade

One facade per backend feature. It holds N implementations and decides how
to combine them; the facade never sees the reason.

```dart
class NoteFacade {
  NoteFacade(ClientsBundle b) : _online = b.online, _offline = b.offline;

  final NoteClient? _online;
  final NoteClient? _offline;

  Future<Result<NoteError, NoteId>> add(String text) =>
      fallback([?_online, ?_offline].map((c) => () => c.add(text)), none: const NoteError.unavailable());

  ValueListenable<Async<Result<NoteError, NoteList>>> watch(String filter) =>
      prioritize([?_online, ?_offline].map((c) => c.watch(filter)).toList(), none: const NoteError.unavailable());
}
```

- `fallback` tries actions in order until one succeeds; all fail → first error.
- `prioritize` follows gets at once: the highest-priority success wins.

## Reason

Why a call cannot run now: a code plus a JSON payload, never free text. One
freezed union per app state:

```dart
@Freezed(unionKey: 'code', unionValueCase: FreezedUnionCase.snake)
sealed class AppUnavailable with _$AppUnavailable implements Reason {
  const factory AppUnavailable.offline() = Offline;
  const factory AppUnavailable.signedOut() = SignedOut;
  factory AppUnavailable.fromJson(Map<String, dynamic> json) => _$AppUnavailableFromJson(json);
}
```

`code` and `payload` come from `toJson`; the UI turns a reason into text
with an exhaustive `switch`.

## Availability

Decides from reactive app state whether the facade can run and, if not, why.
The state is one per app (`core/clients/app_clients.dart`: network plus the
clients), shared by every availability, like ciapp's `AuthGuardState`. Each
`method` and `watch` builds its own facade and rebuilds it only when the
decided bundle changes, so the bundle compares its clients by identity, like
ciapp's `AuthBundle`.

```dart
class NoteAvailability extends Availability<NoteFacade, ClientsBundle, AppClients, AppUnavailable> {
  NoteAvailability(ValueListenable<AppClients> state)
    : super(state: state, decide: ClientDeciders.any, facade: NoteFacade.new);

  late final $add = method((f) => f.add);
  late final $sync = method((f) => f.sync, decide: ClientDeciders.online);
  ValueListenable<Async<AppOutcome<NoteError, NoteList>>> watch(String filter) => super.watch((f) => f.watch(filter));
}
```

- `method` gives `Either<R, F>` with `F` typed: a caller gets the function
  only after handling the reason.
- `watch` gives a get as `Async<Outcome>`, `Blocked` while unavailable.
- `decide:` overrides the default decider for one method.

A caller of `method`:

```dart
switch (_availability.$add.value) {
  Left(:final value) => Blocked(value),
  Right(value: final add) => Outcome.of(await add(text)),
};
```

## Providers

Availabilities and repositories are `keepAlive` riverpod providers.
