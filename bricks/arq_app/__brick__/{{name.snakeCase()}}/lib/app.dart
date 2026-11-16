import 'package:{{name.snakeCase()}}/features/greeting/_presentation/home/home_page.dart';
import 'package:{{name.snakeCase()}}/l10n/app_localizations.dart';
import 'package:{{name.snakeCase()}}/links.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reef/reef.dart';
import 'package:reef_router/reef_router.dart';

Widget pageFor(BuildContext context, BufferId id) => switch (appLinks.routeOfBuffer(id)) {
  HomeRoute() => HomePage(bufferId: id),
  NotFoundRoute() => const HomePage(),
};

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _controller = WindowingController();
  late final _navigator = LinkNavigator<AppRoute>(appLinks, _controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
    localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
    supportedLocales: AppLocalizations.supportedLocales,
    home: LinkScope<AppRoute>(
      navigator: _navigator,
      child: WindowingRoot(
        controller: _controller,
        bufferBuilder: pageFor,
        child: WindowingLinkSync(
          tree: appLinks,
          child: WindowingSystemBack(child: ShellProjection(_controller.doc.value.focusedShellId)),
        ),
      ),
    ),
  );
}
