---
name: arq-ai
description: How to write commands and queries with arq_ai so an agent can call them over MCP. Use when adding or changing a use case, its input or output, or the app's MCP tools.
---

# Use cases with arq_ai

Every use case of the app is a `Command` (changes state) or a `Query`
(reads state, never changes it). The viewmodel calls it; `ArqMcpServer`
exposes the same object to agents as a tool. Done when the use case has a
freezed input with a generated schema, a JSON-encodable output and error,
and a unit test.

## Input, output, error

```dart
@freezed
abstract class AddNoteInput with _$AddNoteInput {
  @JsonSerializable(createJsonSchema: true)
  const factory AddNoteInput({required String text}) = _AddNoteInput;

  factory AddNoteInput.fromJson(Map<String, dynamic> json) => _$AddNoteInputFromJson(json);

  static const schema = _$_AddNoteInputJsonSchema;
}
```

- The input is `@freezed` with `@JsonSerializable(createJsonSchema: true)` on
  its factory. The generated schema is named after the private class:
  `_$_<Input>JsonSchema`.
- Outputs and errors are `@freezed` with `fromJson`, or JSON primitives. The
  server encodes them with `jsonEncode`.
- Codecs and schemas come from codegen only: run `build_runner` after every
  change to an input or output.
- The package's `analysis_options.yaml` sets
  `errors: invalid_annotation_target: ignore` and excludes `**/*.g.dart` and
  `**/*.freezed.dart`.

## Command

```dart
class AddNoteCommand extends Command<AddNoteInput, Note, NoteError> {
  AddNoteCommand(this._notes)
    : super(
        name: 'add_note',
        description: 'Adds a note with the given text.',
        inputSchema: AddNoteInput.schema,
        decodeInput: AddNoteInput.fromJson,
      );

  final NoteRepository _notes;

  @override
  Future<Result<NoteError, Note>> call(AddNoteInput input) => _notes.add(input.text);
}
```

## Query

```dart
class NotesQuery extends Query<NotesInput, NoteList, NoteError> {
  NotesQuery(this._notes)
    : super(name: 'notes', description: 'Lists notes.', inputSchema: NotesInput.schema, decodeInput: NotesInput.fromJson);

  final NoteRepository _notes;

  @override
  ValueListenable<Async<Result<NoteError, NoteList>>> call(NotesInput input) => _notes.watch(input.filter);
}
```

`once(input)` reads a query a single time; agents always get this form.

## Rules

- `name` is `snake_case` English after the use case; `description` tells an
  agent when to call it.
- One use case per class, one `call`, no state of its own. It orchestrates
  the app's repositories.
- A query never changes state; the server marks it read-only.
- Register every use case in the app's `ArqMcpServer(channel, useCases: [...])`.
