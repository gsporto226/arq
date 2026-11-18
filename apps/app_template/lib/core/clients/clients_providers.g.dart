// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appClients)
final appClientsProvider = AppClientsProvider._();

final class AppClientsProvider
    extends
        $FunctionalProvider<
          ValueListenable<AppClients>,
          ValueListenable<AppClients>,
          ValueListenable<AppClients>
        >
    with $Provider<ValueListenable<AppClients>> {
  AppClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appClientsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appClientsHash();

  @$internal
  @override
  $ProviderElement<ValueListenable<AppClients>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<AppClients> create(Ref ref) {
    return appClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<AppClients> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueListenable<AppClients>>(value),
    );
  }
}

String _$appClientsHash() => r'9ac5b250994488c11f731998fa225bf2612f5eaf';
