import 'package:{{name.snakeCase()}}/core/app_types.dart';
import 'package:{{name.snakeCase()}}/core/unavailable_text.dart';
import 'package:{{name.snakeCase()}}/l10n/app_localizations.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/presentation/home/home_provider.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/presentation/home/home_viewmodel.dart';
import 'package:arq_widgets/arq_widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reef/reef.dart';
import 'package:reef_fp/async.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.bufferId});

  final BufferId? bufferId;

  @override
  Widget build(BuildContext context) => ReefWindow<HomeViewModel>(
    bufferId: bufferId,
    viewModel: (id) => homeViewModelProvider(bufferId: id),
    builder: (context, vm) => ScreenTypeLayout(mobile: (_) => _HomeLayout(viewModel: vm)),
  );
}

class _HomeLayout extends StatelessWidget {
  const _HomeLayout({required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            ValueListenableBuilder<Async<AppOutcome<GreetingError, Greeting>>>(
              valueListenable: viewModel.$greeting,
              builder: (context, greeting, _) => OutcomeBuilder(
                value: greeting,
                sample: const Greeting(text: '...'),
                done: (context, greeting) => Text(greeting.text, style: Theme.of(context).textTheme.headlineMedium),
                failed: (context, error) => Text(switch (error) {
                  GreetingEmpty() => l10n.greetingEmpty,
                  GreetingNoSource() => l10n.greetingUnavailable,
                }),
                unavailable: (context, reason) => Text(unavailableText(l10n, reason)),
              ),
            ),
            TextField(
              controller: viewModel.draftController,
              decoration: InputDecoration(labelText: l10n.greetingDraftLabel),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: viewModel.$canSave,
              builder: (context, canSave, _) => FilledButton(
                onPressed: canSave ? viewModel.onSave : null,
                child: Text(l10n.greetingSave),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
