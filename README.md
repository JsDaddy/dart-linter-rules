# jsdaddy_custom_lints

`jsdaddy_custom_lints` is a Dart package designed to enforce a custom lint rule that ensures file names follow the kebab-case convention. This package is useful for maintaining consistent file naming conventions across your Dart and Flutter projects.

## Features

- Enforces file names to be in lowercase and use hyphens (`-`) instead of underscores (`_`).
- Integrates with the `custom_lint` package to provide real-time linting in your IDE.

## Installation

Add `jsdaddy_custom_lints` to your `pubspec.yaml` file:

```yaml
dev_dependencies:
  jsdaddy_custom_lints:
    git:
        url: https://github.com/JsDaddy/dart-linter-rules
```
## Usage

To use the custom lint rule, add the following configuration to your `analysis_options.yaml` file:

```yaml
analyzer:
  plugins:
    - custom_lint
custom_lint:
  enable_all_lint_rules: false
  rules:
    - file_naming_kebab_case
```
This configuration will enable the file_naming_kebab_case rule, ensuring that all Dart files are checked for compliance with the kebab-case naming convention.