import 'package:reef_router/reef_router.dart';

sealed class AppRoute with LinkVerbs<AppRoute> {
  const AppRoute();
}

final class HomeRoute extends AppRoute {
  const HomeRoute();

  static final link = Link<HomeRoute>('').build(HomeRoute.new);
}

final class NotFoundRoute extends AppRoute {
  const NotFoundRoute(this.path);

  final List<String> path;

  static final link = Link<NotFoundRoute>('').rest((r) => r.path).build(NotFoundRoute.new);
}

final appLinks = LinkTree<AppRoute>([HomeRoute.link, NotFoundRoute.link]);
