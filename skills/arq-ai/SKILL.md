---
name: arq-ai
description: How to write commands and queries with arq and expose them to agents as MCP tools with arq_ai. Use when adding or changing a use case, its input or output, or the app's MCP tools.
---

# Use cases and MCP tools

A use case is a `Command` (changes state) or a `Query` (reads state, never
changes it), from `arq`. Both are interfaces with one `call` and know
nothing about MCP. The viewmodel calls them; an `McpTool` from `arq_ai`
puts one in front of agents. Done when the use case has a unit test and, if
agents need it, a tool.

## Command

```dart
class AddNoteCommand implements AppCommand<AddNoteInput, NoteId, NoteError> {
  AddNoteCommand(this._notes);

  final NoteRepository _notes;

  @override
  Future<AppOutcome<NoteError, NoteId>> call(AddNoteInput input) => _notes.add(input.text);
}
```

A command returns the result of its own write (`Unit`, the generated id, or
the server's answer about that write), never a projection of the aggregate.

## Query

```dart
class NotesQuery implements AppQuery<NotesInput, NoteList, NoteError> {
  NotesQuery(this._notes);

  final NoteRepository _notes;

  @override
  ValueListenable<Async<AppOutcome<NoteError, NoteList>>> call(NotesInput input) => _notes.watch(input.filter);
}
```

`query.once(input)` reads it a single time.

## Outcome

Every use case ends in an `Outcome<R, E, T>`: `Done(value)`,
`Failed(error)` with a domain error, or `Blocked(reason)` when the app
cannot run it now. The app fixes `R` once:

```dart
typedef AppOutcome<E, T> = Outcome<AppUnavailable, E, T>;
typedef AppCommand<I, O, E> = Command<I, O, E, AppUnavailable>;
typedef AppQuery<I, O, E> = Query<I, O, E, AppUnavailable>;
```

## MCP tools

The module's tools live in one file, `mcp/<module>_tools.dart`:

```dart
List<McpTool> notesTools(Ref ref) => [
  McpTool.command(
    ref.watch(addNoteCommandProvider),
    name: 'add_note',
    description: 'Adds a note with the given text.',
    inputSchema: AddNoteInput.schema,
    decodeInput: AddNoteInput.fromJson,
  ),
];
```

- The input is `@freezed` with `@JsonSerializable(createJsonSchema: true)` on
  its factory; the schema is `_$_<Input>JsonSchema`. Run `build_runner` after
  every change.
- Outputs, errors and reasons encode with `jsonEncode` (freezed `toJson`).
- `name` is `snake_case` English; `description` tells an agent when to call it.
- Replies: `Done` → the value; `Failed` → `{"error": e}`; `Blocked` →
  `{"unavailable": {"code", "payload"}}`; bad input → a tool error.
- Pass every tool to `ArqMcpServer(channel, tools: [...])`.
