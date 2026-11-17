// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tools)
final toolsProvider = ToolsProvider._();

final class ToolsProvider
    extends $FunctionalProvider<List<McpTool>, List<McpTool>, List<McpTool>>
    with $Provider<List<McpTool>> {
  ToolsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toolsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toolsHash();

  @$internal
  @override
  $ProviderElement<List<McpTool>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<McpTool> create(Ref ref) {
    return tools(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<McpTool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<McpTool>>(value),
    );
  }
}

String _$toolsHash() => r'2ececb21b09d79568082078532badd47ff5fa4f2';
