# arq_app

A Flutter app on reef and arq: a task_graph bootstrap, one feature through
every layer (page → viewmodel → command/query → repository → service →
availability → facade) and its use cases registered for MCP.

Generated from `apps/app_template` by `dart run tool/make_brick.dart`. Edit the
app, not this brick.

## Use

```sh
mason make arq_app --name my_app
cd my_app
fvm flutter pub get
fvm dart run build_runner build -d
fvm flutter test
```
