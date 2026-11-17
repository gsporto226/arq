import 'package:arq/arq.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/result.dart';

class RetryAfter implements Reason {
  const RetryAfter(this.seconds);

  final int seconds;

  @override
  Map<String, dynamic> toJson() => {'code': 'retry_after', 'seconds': seconds};
}

void main() {
  test('of maps Ok to Done and Err to Failed', () {
    expect(Outcome<RetryAfter, String, int>.of(const Ok(1)), const Done<RetryAfter, String, int>(1));
    expect(Outcome<RetryAfter, String, int>.of(const Err('e')), const Failed<RetryAfter, String, int>('e'));
  });

  test('cases compare by value', () {
    const reason = RetryAfter(5);
    expect(const Blocked<RetryAfter, String, int>(reason), const Blocked<RetryAfter, String, int>(reason));
    expect(const Done<RetryAfter, String, int>(1), isNot(const Done<RetryAfter, String, int>(2)));
  });

  test('a reason reads code and payload from toJson', () {
    const reason = RetryAfter(5);
    expect(reason.code, 'retry_after');
    expect(reason.payload, {'seconds': 5});
  });
}
