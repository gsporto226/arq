// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_cases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(useCases)
final useCasesProvider = UseCasesProvider._();

final class UseCasesProvider
    extends
        $FunctionalProvider<
          List<UseCase<dynamic, dynamic, dynamic>>,
          List<UseCase<dynamic, dynamic, dynamic>>,
          List<UseCase<dynamic, dynamic, dynamic>>
        >
    with $Provider<List<UseCase<dynamic, dynamic, dynamic>>> {
  UseCasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'useCasesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$useCasesHash();

  @$internal
  @override
  $ProviderElement<List<UseCase<dynamic, dynamic, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<UseCase<dynamic, dynamic, dynamic>> create(Ref ref) {
    return useCases(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UseCase<dynamic, dynamic, dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<List<UseCase<dynamic, dynamic, dynamic>>>(value),
    );
  }
}

String _$useCasesHash() => r'9535db37c56f933759190d769c6ebf667edeb9ff';
