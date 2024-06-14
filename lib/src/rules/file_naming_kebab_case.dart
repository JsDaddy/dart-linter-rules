import 'dart:async';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/error/listener.dart';

class FileNamingKebabCaseLint extends DartLintRule {
  const FileNamingKebabCaseLint()
      : super(
          code: const LintCode(
            name: 'file_naming_kebab_case',
            problemMessage:
                'File names should use hyphens (-) instead of underscores (_) and be in lowercase.',
            correctionMessage:
                'Rename the file to use hyphens and lowercase letters.',
          ),
        );

  @override
  List<String> get filesToAnalyze => const <String>['**.dart'];

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    print('FileNamingLint rule is running');

    final ResolvedUnitResult unit = await resolver.getResolvedUnitResult();
    final String fileName = unit.unit.declaredElement?.source.shortName ?? '';
    if (!_isValidFileName(fileName)) {
      const int offset = 0;
      final int length = fileName.length;
      reporter.reportErrorForOffset(
        code,
        offset,
        length,
      );
    }
  }

  bool _isValidFileName(String fileName) {
    final regExp =
        RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+)*(\_test)?\.dart$');
    return regExp.hasMatch(fileName);
  }
}
