# arq workspace

App architecture below the reef viewmodel, split like reef:

- `packages/arq`: shared primitives (`once`).
- `packages/arq_ai`: commands and queries, exposed as MCP tools.
- `packages/arq_offline`: availability and facades over N implementations.

`apps/app_template` is the reference app: every layer of reef and arq in one
feature. `bricks/arq_app` is generated from it; after changing the app, run
`fvm dart run tool/make_brick.dart` and commit both. Never edit the brick by hand.

`skills/` ships the `arq` plugin for apps. Keep each skill in sync with its
package when an app-facing rule changes.

Run Flutter and Dart through `fvm`. Packages with freezed code need
`fvm dart run build_runner build -d` after model changes.
