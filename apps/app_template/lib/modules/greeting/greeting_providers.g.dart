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
          ValueListenable<GreetingClients>,
          ValueListenable<GreetingClients>,
          ValueListenable<GreetingClients>
        >
    with $Provider<ValueListenable<GreetingClients>> {
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
  $ProviderElement<ValueListenable<GreetingClients>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<GreetingClients> create(Ref ref) {
    return greetingClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<GreetingClients> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueListenable<GreetingClients>>(
        value,
      ),
    );
  }
}

String _$greetingClientsHash() => r'40cfc2509a07e151fee0357c99ec17e7dbcfb299';

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
    r'78071181311f06f5e69423ea979bfb587edcd7d5';

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

@ProviderFor(getGreetingQuery)
final getGreetingQueryProvider = GetGreetingQueryProvider._();

final class GetGreetingQueryProvider
    extends
        $FunctionalProvider<
          GetGreetingQuery,
          GetGreetingQuery,
          GetGreetingQuery
        >
    with $Provider<GetGreetingQuery> {
  GetGreetingQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGreetingQueryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGreetingQueryHash();

  @$internal
  @override
  $ProviderElement<GetGreetingQuery> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetGreetingQuery create(Ref ref) {
    return getGreetingQuery(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGreetingQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGreetingQuery>(value),
    );
  }
}

String _$getGreetingQueryHash() => r'ea1824cd9d5cdc024aefeebcf0a531ee3bd4b814';
