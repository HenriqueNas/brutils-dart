# BR Utils Dart

[![pub package][pub_badge]][pub_badge_link]
[![License: MIT][license_badge]][license_badge_link]
[![style: very good analysis][badge]][badge_link]

Utils library for specific Brazilian businesses

## Installation 💻

**❗ In order to start using brutils-dart you must have the [Dart SDK][dart_install_link] installed on your machine.**

Add `br_utils` to your `pubspec.yaml`:

```yaml
dependencies:
  br_utils:
```

Or install it with `pub` cli:

```sh
dart pub add br_utils
```

## Usage 📖

### BRUtils

```dart
import 'package:br_utils/br_utils.dart';

void main() {
  final String cpf = BRUtils.cpf.generate();
  final bool validCpf = BRUtils.cpf.isValid(cpf);
  final String cpfMask = BRUtils.cnpj.mask();

  final String cnpj = BRUtils.cnpj.generate();
  final bool validCnpj = BRUtils.cnpj.isValid(cnpj);
  final String cnpjMask = BRUtils.cnpj.mask();
}
```

### CPF

```dart
import 'package:br_utils/br_utils.dart';

void main() {
  // Create a new CPF instance
  final cpf = CPF('12345678909');
  print(cpf.isValid); // true
  print(cpf.unmask()); // 12345678909

  // Use CPF static methods
  print(CPF.isValidCPF('12345678909')); // true
  print(CPF.generateCPF()); // 12345678909
}
```


### CNPJ

```dart
import 'package:br_utils/br_utils.dart';

void main() {
  // Create a new CNPJ instance
  final cnpj = CNPJ('12345678000190');
  print(cnpj.isValid); // true
  print(cnpj.unmask()); // 12345678000190

  // Use CNPJ static methods
  print(CNPJ.isValidCNPJ('12345678000190')); // true
  print(CNPJ.generateCNPJ()); // 12345678000190
}
```

### Authors 🧑‍💻

- [**Henrique Nascimento**](http://github.com/henriquenas) (@HenriqueNas)

[badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[badge_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_badge_link]: https://opensource.org/licenses/MIT
[pub_badge]: https://img.shields.io/pub/v/very_good_analysis.svg
[pub_badge_link]: https://pub.dev/packages/br_utils
[dart_install_link]: https://dart.dev/get-dart
[analysis_options_yaml]: https://github.com/VeryGoodOpenSource/very_good_analysis/blob/main/lib/analysis_options.4.0.0.yaml