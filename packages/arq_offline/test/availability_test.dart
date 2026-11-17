import 'package:arq/arq.dart';
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

  Future<Result<String, String>> echo(String text) async => Ok('$client:$text');
}

class Unavailable implements Reason {
  const Unavailable(this._code);
  final String _code;

  @override
  Map<String, dynamic> toJson() => {'code': _code};
}

const offline = Unavailable('offline');
const onlineRequired = Unavailable('online_required');

void main() {
  late ValueNotifier<String?> client;
  late List<Facade> built;
  late Availability<Facade, String, String?, Unavailable> availability;

  setUp(() {
    client = ValueNotifier(null);
    built = [];
    availability = Availability(
      state: client,
      decide: (c) => c == null ? const Left(offline) : Right(c),
      facade: (c) => (built..add(Facade(c))).last,
    );
  });

  test('method is Left with the reason while unavailable', () {
    expect(availability.method((f) => f.echo).value, const Left<Unavailable, Never>(offline));
  });

  test('method hands the typed function once available, and follows changes', () async {
    final echo = availability.method((f) => f.echo);
    client.value = 'a';
    final call = switch (echo.value) {
      Right(:final value) => value,
      Left() => fail('expected Right'),
    };
    expect(await call('x'), const Ok<String, String>('a:x'));

    client.value = null;
    expect(echo.value, isA<Left<Unavailable, Future<Result<String, String>> Function(String)>>());
  });

  test('a per-method decider overrides the default', () {
    final online = availability.method((f) => f.echo, decide: (c) => c == 'online' ? Right(c!) : const Left(onlineRequired));
    client.value = 'cache';
    expect(online.value, isA<Left<Unavailable, Object?>>().having((l) => l.value, 'reason', onlineRequired));
    client.value = 'online';
    expect(online.value, isA<Right<Unavailable, Object?>>());
  });

  test('watch is Blocked while unavailable and follows the facade once available', () {
    final watched = availability.watch((f) => f.value);
    expect(watched.value, const Async<Outcome<Unavailable, String, String>>.ready(Blocked(offline)));

    client.value = 'a';
    expect(watched.value, const Async<Outcome<Unavailable, String, String>>.pending());
    built.last.value.value = const Async.ready(Ok('x'));
    expect(watched.value, const Async<Outcome<Unavailable, String, String>>.ready(Done('x')));
    built.last.value.value = const Async.ready(Err('e'));
    expect(watched.value, const Async<Outcome<Unavailable, String, String>>.ready(Failed('e')));
  });

  test('methods and watches with the same decider share one facade', () {
    final echo = availability.method((f) => f.echo);
    final watched = availability.watch((f) => f.value);
    client.value = 'a';
    echo.value;
    watched.value;
    expect(built, hasLength(1));
  });

  test('rebuilds the facade only when the bundle changes', () {
    availability.watch((f) => f.value);
    client.value = 'a';
    client.value = 'a';
    client.value = 'b';
    expect(built.map((f) => f.client), ['a', 'b']);
  });
}
