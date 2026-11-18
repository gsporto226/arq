// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'c76c3cdcdf464e6a4cbb39654db6ffd2f14adecd';

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
