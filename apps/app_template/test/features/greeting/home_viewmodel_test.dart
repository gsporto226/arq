import 'package:app_template/features/greeting/_data_types/greeting.dart';
import 'package:app_template/features/greeting/_facades/greeting_client.dart';
import 'package:app_template/features/greeting/_presentation/home/home_model.dart';
import 'package:app_template/features/greeting/_presentation/home/home_provider.dart';
import 'package:app_template/features/greeting/_presentation/home/home_viewmodel.dart';
import 'package:app_template/features/greeting/_providers/greeting_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef/reef.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

ProviderContainer containerWith(List<GreetingClient> clients) => ProviderContainer(
  overrides: [greetingClientsProvider.overrideWithValue(ValueNotifier(clients))],
);

void main() {
  late ProviderContainer container;
  late HomeViewModel vm;

  setUp(() {
    container = containerWith([MemoryGreetingClient('Olá!')]);
    vm = container.read(homeViewModelProvider(bufferId: BufferId.manual('home')));
  });

  tearDown(() => container.dispose());

  test('shows the current greeting', () {
    expect(vm.$greeting.value, const Async<Result<GreetingError, Greeting>>.ready(Ok(Greeting(text: 'Olá!'))));
  });

  test('typing a draft enables saving', () {
    expect(vm.$canSave.value, false);
    vm.draftController.text = 'Oi';
    expect(vm.model, const HomeModel(draft: 'Oi'));
    expect(vm.$canSave.value, true);
  });

  test('saving replaces the greeting and clears the draft', () async {
    vm.draftController.text = 'Bom dia';
    await vm.onSave();
    expect(vm.$greeting.value, const Async<Result<GreetingError, Greeting>>.ready(Ok(Greeting(text: 'Bom dia'))));
    expect(vm.model.draft, '');
    expect(vm.draftController.text, '');
  });

  test('saving a blank draft fails without touching the greeting', () async {
    vm.draftController.text = '   ';
    await vm.onSave();
    expect(vm.saveOp.state, const Async<Result<GreetingError, Greeting>>.ready(Err(GreetingError.empty())));
    expect(vm.$greeting.value, const Async<Result<GreetingError, Greeting>>.ready(Ok(Greeting(text: 'Olá!'))));
  });

  test('with no clients the greeting is unavailable', () {
    final empty = containerWith([]);
    addTearDown(empty.dispose);
    final vm = empty.read(homeViewModelProvider(bufferId: BufferId.manual('home')));
    expect(vm.$greeting.value, const Async<Result<GreetingError, Greeting>>.ready(Err(GreetingError.unavailable())));
  });
}
