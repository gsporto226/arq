// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeViewModel)
final homeViewModelProvider = HomeViewModelFamily._();

final class HomeViewModelProvider
    extends $FunctionalProvider<HomeViewModel, HomeViewModel, HomeViewModel>
    with $Provider<HomeViewModel> {
  HomeViewModelProvider._({
    required HomeViewModelFamily super.from,
    required ({BufferId bufferId, HomeModel? initial}) super.argument,
  }) : super(
         retry: null,
         name: r'homeViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @override
  String toString() {
    return r'homeViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<HomeViewModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeViewModel create(Ref ref) {
    final argument = this.argument as ({BufferId bufferId, HomeModel? initial});
    return homeViewModel(
      ref,
      bufferId: argument.bufferId,
      initial: argument.initial,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeViewModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HomeViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$homeViewModelHash() => r'deeb399e53d642acfb3e60923094f54e675b7def';

final class HomeViewModelFamily extends $Family
    with
        $FunctionalFamilyOverride<
          HomeViewModel,
          ({BufferId bufferId, HomeModel? initial})
        > {
  HomeViewModelFamily._()
    : super(
        retry: null,
        name: r'homeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeViewModelProvider call({
    required BufferId bufferId,
    HomeModel? initial,
  }) => HomeViewModelProvider._(
    argument: (bufferId: bufferId, initial: initial),
    from: this,
  );

  @override
  String toString() => r'homeViewModelProvider';
}
