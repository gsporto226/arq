import 'package:{{name.snakeCase()}}/modules/greeting/greeting_providers.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/presentation/home/home_model.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/presentation/home/home_viewmodel.dart';
import 'package:reef/reef.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
HomeViewModel homeViewModel(Ref ref, {required BufferId bufferId, HomeModel? initial}) {
  final vm = HomeViewModel(
    initial ?? const HomeModel(),
    setGreeting: ref.watch(setGreetingCommandProvider),
    greeting: ref.watch(getGreetingQueryProvider),
  );
  ref.onDispose(vm.dispose);
  return vm;
}
