// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(greetingClients)
final greetingClientsProvider = GreetingClientsProvider._();

final class GreetingClientsProvider
    extends
        $FunctionalProvider<
          ValueListenable<List<GreetingClient>>,
          ValueListenable<List<GreetingClient>>,
          ValueListenable<List<GreetingClient>>
        >
    with $Provider<ValueListenable<List<GreetingClient>>> {
  GreetingClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'greetingClientsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$greetingClientsHash();

  @$internal
  @override
  $ProviderElement<ValueListenable<List<GreetingClient>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<List<GreetingClient>> create(Ref ref) {
    return greetingClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<List<GreetingClient>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ValueListenable<List<GreetingClient>>>(value),
    );
  }
}

String _$greetingClientsHash() => r'385092813187c80e94aa45eaff59b8d50d865be6';

@ProviderFor(greetingRepository)
final greetingRepositoryProvider = GreetingRepositoryProvider._();

final class GreetingRepositoryProvider
    extends
        $FunctionalProvider<
          GreetingRepository,
          GreetingRepository,
          GreetingRepository
        >
    with $Provider<GreetingRepository> {
  GreetingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'greetingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$greetingRepositoryHash();

  @$internal
  @override
  $ProviderElement<GreetingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GreetingRepository create(Ref ref) {
    return greetingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GreetingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GreetingRepository>(value),
    );
  }
}

String _$greetingRepositoryHash() =>
    r'129127825a97f6a187d44d6dc0c084baf9787ebb';

@ProviderFor(setGreetingCommand)
final setGreetingCommandProvider = SetGreetingCommandProvider._();

final class SetGreetingCommandProvider
    extends
        $FunctionalProvider<
          SetGreetingCommand,
          SetGreetingCommand,
          SetGreetingCommand
        >
    with $Provider<SetGreetingCommand> {
  SetGreetingCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setGreetingCommandProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setGreetingCommandHash();

  @$internal
  @override
  $ProviderElement<SetGreetingCommand> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SetGreetingCommand create(Ref ref) {
    return setGreetingCommand(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetGreetingCommand value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetGreetingCommand>(value),
    );
  }
}

String _$setGreetingCommandHash() =>
    r'160f209a16e984ae08392622d6a805001331eca0';

@ProviderFor(greetingQuery)
final greetingQueryProvider = GreetingQueryProvider._();

final class GreetingQueryProvider
    extends $FunctionalProvider<GreetingQuery, GreetingQuery, GreetingQuery>
    with $Provider<GreetingQuery> {
  GreetingQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'greetingQueryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$greetingQueryHash();

  @$internal
  @override
  $ProviderElement<GreetingQuery> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GreetingQuery create(Ref ref) {
    return greetingQuery(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GreetingQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GreetingQuery>(value),
    );
  }
}

String _$greetingQueryHash() => r'1a1bc1dad544aa707137069bd7535c348b98e07e';
