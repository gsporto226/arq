import 'package:app_template/core/app_unavailable.dart';
import 'package:app_template/core/clients/greeting_client.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/either.dart';

typedef AppClients = ({bool online, GreetingClient? onlineClient, GreetingClient? offlineClient});

@immutable
final class ClientsBundle {
  const ClientsBundle(this.online, this.offline);

  final GreetingClient? online;
  final GreetingClient? offline;

  @override
  int get hashCode => Object.hash(identityHashCode(online), identityHashCode(offline));

  @override
  bool operator ==(Object other) =>
      other is ClientsBundle && identical(other.online, online) && identical(other.offline, offline);
}

abstract final class ClientDeciders {
  static Either<AppUnavailable, ClientsBundle> any(AppClients state) =>
      switch ((state.online ? state.onlineClient : null, state.offlineClient)) {
        (null, null) => Left(state.online ? const AppUnavailable.noClients() : const AppUnavailable.offline()),
        (final online, final offline) => Right(ClientsBundle(online, offline)),
      };
}
