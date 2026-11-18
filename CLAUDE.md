# arq workspace

App architecture below the reef viewmodel, split like reef:

- `packages/arq`: `Outcome`, `Reason`, `Command`/`Query` and `once`.
- `packages/arq_ai`: `McpTool` and `ArqMcpServer`, putting use cases in front of agents.
- `packages/arq_offline`: availability and facades over N implementations.
- `packages/arq_widgets`: widgets for outcomes (only `flutter/widgets`).

`apps/app_template` is the reference app: every layer of reef and arq in one
feature. `bricks/arq_app` is generated from it; after changing the app, run
`fvm dart run tool/make_brick.dart` and commit both. Never edit the brick by hand.

`skills/` ships the `arq` plugin for apps. Keep each skill in sync with its
package when an app-facing rule changes.

Run Flutter and Dart through `fvm`. Packages with freezed code need
`fvm dart run build_runner build -d` after model changes.
