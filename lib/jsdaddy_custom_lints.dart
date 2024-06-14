library jsdaddy_custom_lints;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'src/rules/file_naming_kebab_case.dart';

PluginBase createPlugin() {
  print('Custom lint plugin loaded');
  return _CustomLints();
}

class _CustomLints extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs config) {
    print('Getting lint rules');
    return <LintRule>[
      const FileNamingKebabCaseLint(),
    ];
  }
}
