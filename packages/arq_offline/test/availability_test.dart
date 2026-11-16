import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/either.dart';
import 'package:reef_fp/result.dart';

class Facade {
  Facade(this.client);
  final String client;
  final value = ValueNotifier<Async<Result<String, String>>>(const Async.pending());
}

void main() {
  late ValueNotifier<String?> client;
  late List<Facade> built;
  late Availability<Facade, String, String?, String> availability;

  setUp(() {
    client = ValueNotifier(null);
    built = [];
    availability = Availability(
      state: client,
      decide: (c) => c == null ? const Left('offline') : Right(c),
      facade: (c) => (built..add(Facade(c))).last,
    );
  });

  String unavailable(String reason) => 'unavailable: $reason';

  test('call fails with the reason while unavailable', () async {
    expect(
      await availability.call((f) async => Ok<String, String>(f.client), unavailable: unavailable),
      const Err<String, String>('unavailable: offline'),
    );
  });

  test('call runs on the facade once available', () async {
    client.value = 'a';
    expect(await availability.call((f) async => Ok<String, String>(f.client), unavailable: unavailable), const Ok<String, String>('a'));
  });

  test('watch follows availability and the facade value', () {
    final watched = availability.watch((f) => f.value, unavailable: unavailable);
    expect(watched.value, const Async<Result<String, String>>.ready(Err('unavailable: offline')));

    client.value = 'a';
    expect(watched.value, const Async<Result<String, String>>.pending());
    built.last.value.value = const Async.ready(Ok('x'));
    expect(watched.value, const Async<Result<String, String>>.ready(Ok('x')));
  });

  test('rebuilds the facade only when the bundle changes', () {
    availability.watch((f) => f.value, unavailable: unavailable);
    client.value = 'a';
    client.value = 'a';
    client.value = 'b';
    expect(built.map((f) => f.client), ['a', 'b']);
  });

  test('once completes on the first ready value', () async {
    client.value = 'a';
    final result = availability.once((f) => f.value, unavailable: unavailable);
    built.last.value.value = const Async.ready(Ok('x'));
    expect(await result, const Ok<String, String>('x'));
  });
}
