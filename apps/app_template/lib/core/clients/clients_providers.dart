import 'package:app_template/core/clients/app_clients.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clients_providers.g.dart';

@Riverpod(keepAlive: true)
ValueListenable<AppClients> appClients(Ref ref) => throw UnimplementedError('Overridden by bootstrap');
