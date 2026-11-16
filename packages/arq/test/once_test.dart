import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';

void main() {
  test('once is immediate when already ready', () async {
    expect(await ValueNotifier<Async<int>>(const Async.ready(1)).once(), 1);
  });

  test('once waits for the first ready value', () async {
    final source = ValueNotifier<Async<int>>(const Async.pending());
    final result = source.once();
    source.value = const Async.ready(2);
    source.value = const Async.ready(3);
    expect(await result, 2);
  });
}
