import 'package:app_template/core/app_types.dart';
import 'package:app_template/modules/greeting/domain/greeting.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/unit.dart';

abstract interface class GreetingRepository {
  ValueListenable<Async<AppOutcome<GreetingError, Greeting>>> get $greeting;

  Future<AppOutcome<GreetingError, Unit>> save(Greeting greeting);
}
