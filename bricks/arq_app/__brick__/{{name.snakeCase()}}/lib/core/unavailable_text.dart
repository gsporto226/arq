import 'package:{{name.snakeCase()}}/core/app_unavailable.dart';
import 'package:{{name.snakeCase()}}/l10n/app_localizations.dart';

String unavailableText(AppLocalizations l10n, AppUnavailable reason) => switch (reason) {
  Offline() => l10n.unavailableOffline,
  NoClients() => l10n.unavailableNoClients,
};
