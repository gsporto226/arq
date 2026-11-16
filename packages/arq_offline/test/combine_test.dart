import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

typedef R = Result<String, int>;

void main() {
  Future<R> ok(int v) async => Ok(v);
  Future<R> err(String e) async => Err(e);

  group('fallback', () {
    test('returns the first success', () async {
      expect(await fallback([() => err('a'), () => ok(2), () => ok(3)], none: 'none'), const Ok<String, int>(2));
    });

    test('stops at the first success', () async {
      var ran = false;
      await fallback([() => ok(1), () { ran = true; return ok(2); }], none: 'none');
      expect(ran, false);
    });

    test('returns the first error when all fail', () async {
      expect(await fallback([() => err('a'), () => err('b')], none: 'none'), const Err<String, int>('a'));
    });

    test('fails with none when empty', () async {
      expect(await fallback<String, int>([], none: 'none'), const Err<String, int>('none'));
    });
  });

  group('prioritized', () {
    const pending = Async<R>.pending();
    Async<R> ready(R r) => Async.ready(r);

    test('highest priority success wins', () {
      expect(prioritized([ready(const Ok(1)), ready(const Ok(2))]), ready(const Ok(1)));
    });

    test('a lower success shows while higher sources load', () {
      expect(prioritized([pending, pending, ready(const Ok(3))]), ready(const Ok(3)));
    });

    test('an error waits for every source', () {
      expect(prioritized([ready(const Err('a')), pending]), pending);
      expect(prioritized([pending, ready(const Err('b'))]), pending);
    });

    test('first error wins when all fail', () {
      expect(prioritized([ready(const Err('a')), ready(const Err('b'))]), ready(const Err('a')));
    });
  });

  test('prioritize follows its sources', () {
    final high = ValueNotifier<Async<R>>(const Async.pending());
    final low = ValueNotifier<Async<R>>(const Async.pending());
    final watched = prioritize([high, low], none: 'none')..addListener(() {});

    low.value = const Async.ready(Ok(2));
    expect(watched.value, const Async<R>.ready(Ok(2)));
    high.value = const Async.ready(Ok(1));
    expect(watched.value, const Async<R>.ready(Ok(1)));
  });

  test('prioritize fails with none when empty', () {
    expect(prioritize<String, int>([], none: 'none').value, const Async<R>.ready(Err('none')));
  });
}
