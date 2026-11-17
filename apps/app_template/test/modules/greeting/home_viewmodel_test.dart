import 'package:app_template/core/app_types.dart';
import 'package:app_template/core/app_unavailable.dart';
import 'package:app_template/modules/greeting/domain/greeting.dart';
import 'package:app_template/modules/greeting/greeting_providers.dart';
import 'package:app_template/modules/greeting/infrastructure/greeting_client.dart';
import 'package:app_template/modules/greeting/presentation/home/home_model.dart';
import 'package:app_template/modules/greeting/presentation/home/home_provider.dart';
import 'package:app_template/modules/greeting/presentation/home/home_viewmodel.dart';
import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef/reef.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/unit.dart';

ProviderContainer containerWith(List<GreetingClient> clients) => ProviderContainer(
  overrides: [greetingClientsProvider.overrideWithValue(ValueNotifier<GreetingClients>((clients: clients, online: true)))],
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
    expect(vm.$greeting.value, const Async<AppOutcome<GreetingError, Greeting>>.ready(Done(Greeting(text: 'Olá!'))));
  });

  test('typing a draft enables saving', () {
    expect(vm.$canSave.value, false);
    vm.draftController.text = 'Oi';
    expect(vm.model, const HomeModel(draft: 'Oi'));
    expect(vm.$canSave.value, true);
  });

  test('saving replaces the greeting and clears the draft', () async {
    vm.draftController.text = ' Bom dia ';
    await vm.onSave();
    expect(vm.saveTask.state, const Async<AppOutcome<GreetingError, Unit>>.ready(Done(Unit())));
    expect(vm.$greeting.value, const Async<AppOutcome<GreetingError, Greeting>>.ready(Done(Greeting(text: 'Bom dia'))));
    expect(vm.model.draft, '');
    expect(vm.draftController.text, '');
  });

  test('saving a blank draft fails without touching the greeting', () async {
    vm.draftController.text = '   ';
    await vm.onSave();
    expect(vm.saveTask.state, const Async<AppOutcome<GreetingError, Unit>>.ready(Failed(GreetingError.empty())));
    expect(vm.$greeting.value, const Async<AppOutcome<GreetingError, Greeting>>.ready(Done(Greeting(text: 'Olá!'))));
  });

  test('with no clients the greeting is blocked with a reason', () async {
    final empty = containerWith([]);
    addTearDown(empty.dispose);
    final vm = empty.read(homeViewModelProvider(bufferId: BufferId.manual('home')));
    expect(vm.$greeting.value, const Async<AppOutcome<GreetingError, Greeting>>.ready(Blocked(AppUnavailable.noClients())));

    vm.draftController.text = 'Oi';
    await vm.onSave();
    expect(vm.saveTask.state, const Async<AppOutcome<GreetingError, Unit>>.ready(Blocked(AppUnavailable.noClients())));
  });
}
