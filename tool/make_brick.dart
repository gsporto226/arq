import 'dart:convert';
import 'dart:io';

const source = 'apps/app_template';
const brick = 'bricks/arq_app';

const generated = ['.g.dart', '.freezed.dart'];
const skipped = ['pubspec.lock', '.metadata'];

const replacements = {
  'br.com.conceito': 'org',
  'App Template': 'name.titleCase()',
  'AppTemplate': 'name.pascalCase()',
  'appTemplate': 'name.camelCase()',
  'app_template': 'name.snakeCase()',
};

const gitPackages = {
  'reef': ('reef', 'packages/reef', 'main'),
  'reef_fp': ('reef', 'packages/reef_fp', 'main'),
  'reef_router': ('reef', 'packages/reef_router', 'main'),
  'reef_utils': ('reef', 'packages/reef_utils', 'main'),
  'arq': ('arq', 'packages/arq', 'main'),
  'arq_ai': ('arq', 'packages/arq_ai', 'main'),
  'arq_offline': ('arq', 'packages/arq_offline', 'main'),
  'listenable_plus': ('listenable_plus', '.', 'main'),
  'task_graph': ('task_graph', '.', 'main'),
  'formularium': ('formularium', 'packages/formularium', 'intl-localization-migration'),
  'formularium_localization': ('formularium', 'packages/formularium_localization', 'intl-localization-migration'),
};

void main() {
  final files = (Process.runSync('git', ['ls-files', '-co', '--exclude-standard', source]).stdout as String)
      .split('\n')
      .where((path) => path.isNotEmpty)
      .where((path) => !generated.any(path.endsWith))
      .where((path) => !skipped.any((name) => path.endsWith('/$name')))
      .where((path) => !path.contains('/lib/l10n/app_localizations'));

  final root = Directory('$brick/__brick__');
  if (root.existsSync()) root.deleteSync(recursive: true);

  for (final path in files) {
    final relative = path.substring(source.length + 1);
    final target = File('${root.path}/{{name.snakeCase()}}/${template(relative, '{{', '}}')}');
    target.parent.createSync(recursive: true);
    final bytes = File(path).readAsBytesSync();
    final String text;
    try {
      text = utf8.decode(bytes);
    } on FormatException {
      target.writeAsBytesSync(bytes);
      continue;
    }
    target.writeAsStringSync(render(relative, text));
  }
  stdout.writeln('Wrote ${files.length} files to ${root.path}');
}

String render(String relative, String text) {
  final body = relative == 'pubspec.yaml' ? standalonePubspec(text) : text;
  if (!body.contains('{{')) return template(body, '{{', '}}');
  return '{{=<% %>=}}${template(body, '<%', '%>')}';
}

String template(String text, String open, String close) => replacements.entries.fold(
  text,
  (text, entry) => text.replaceAll(entry.key, '$open${entry.value}$close'),
);

String standalonePubspec(String pubspec) {
  final overrides = StringBuffer('\ndependency_overrides:\n');
  for (final MapEntry(key: name, value: (repo, path, ref)) in gitPackages.entries) {
    overrides
      ..writeln('  $name:')
      ..writeln('    git:')
      ..writeln('      url: https://github.com/gsporto226/$repo.git')
      ..writeln('      path: $path')
      ..writeln('      ref: $ref');
  }
  return pubspec.replaceFirst('resolution: workspace\n\n', '') + overrides.toString();
}
