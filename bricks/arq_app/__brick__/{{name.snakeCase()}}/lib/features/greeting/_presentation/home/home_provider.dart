import 'package:{{name.snakeCase()}}/features/greeting/_presentation/home/home_model.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_presentation/home/home_viewmodel.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_providers/greeting_providers.dart';
import 'package:reef/reef.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
HomeViewModel homeViewModel(Ref ref, {required BufferId bufferId, HomeModel? initial}) {
  final vm = HomeViewModel(
    initial ?? const HomeModel(),
    setGreeting: ref.watch(setGreetingCommandProvider),
    greeting: ref.watch(greetingQueryProvider),
  );
  ref.onDispose(vm.dispose);
  return vm;
}
