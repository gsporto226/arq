import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';

extension OnceExtension<T> on ValueListenable<Async<T>> {
  /// Completes with the first [Ready] value, now if it is already ready.
  Future<T> once() {
    if (value case Ready(:final value)) return Future.value(value);
    final completer = Completer<T>();
    void onChange() {
      if (value case Ready(:final value)) {
        removeListener(onChange);
        completer.complete(value);
      }
    }

    addListener(onChange);
    return completer.future;
  }
}
