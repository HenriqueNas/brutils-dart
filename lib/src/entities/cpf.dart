import 'dart:math';

import 'package:br_utils/br_utils.dart';

/// {@template CPF}
/// [CPF] class is responsible for validating CPF
///
/// ```dart
///   final cpf = CPF.unmask('123.456.789-00');
///   cpf.isValid(); // false
///   cpf.unmask(); // 12345678900
/// ```
/// {@endtemplate}
class CPF implements EntitiesContract {
  /// {@macro CPF}
  const CPF(this.cpf);

  /// Removes all non-numeric characters from [cpf]
  /// and returns a [CPF] instance
  ///
  /// {@macro CPF}
  CPF.unmask(String cpf) : cpf = unmaskCPF(cpf);

  /// Creates an empty [CPF] instance
  const CPF.empty() : cpf = null;

  /// The CPF number
  final String? cpf;

  /// {@macro isValidCPF}
  @override
  bool isValid([String? cpfParam]) {
    final cpf = this.cpf ?? cpfParam;
    if (cpf == null || cpf.isEmpty) return false;

    return isValidCPF(cpf);
  }

  /// {@macro unmaskCPF}
  @override
  String? unmask([String? cpfParam]) {
    final cpf = this.cpf ?? cpfParam;
    if (cpf == null || cpf.isEmpty) return null;

    return unmaskCPF(cpf);
  }

  /// {@macro generateCPF}
  @override
  String get generate => generateCPF();

  /// {@macro maskCPF}
  @override
  String get mask => maskCPF;

  /// {@template isValidCPF}
  /// Returns true if [cpf] is valid
  /// {@endtemplate}
  static bool isValidCPF(String cpf) {
    final cpfDigits = unmaskCPF(cpf);

    if (cpfDigits.length != 11) return false;

    if (RegExp(r'^(\d)\1*$').hasMatch(cpfDigits)) {
      return false;
    }

    // first digit validation
    var sum = 0;
    for (var i = 0; i < 9; i++) {
      sum += int.parse(cpfDigits[i]) * (10 - i);
    }
    var firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;

    // second digit validation
    sum = 0;
    for (var i = 0; i < 10; i++) {
      sum += int.parse(cpfDigits[i]) * (11 - i);
    }
    var secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;

    final firstDigitIsValid = firstDigit == int.parse(cpfDigits[9]);
    final secondDigitIsValid = secondDigit == int.parse(cpfDigits[10]);

    return firstDigitIsValid && secondDigitIsValid;
  }

  /// {@template unmaskCPF}
  /// Removes all non-numeric characters from [cpf]
  /// {@endtemplate}
  static String unmaskCPF(String cpf) {
    return cpf.replaceAll(RegExp(digitsOnlyRegex), '');
  }

  /// {@template generateCPF}
  /// Generates a random CPF
  /// {@endtemplate}
  static String generateCPF() {
    final random = Random();
    final digits = List.generate(9, (_) => random.nextInt(9));

    var sum = 0;
    for (var i = 0; i < 9; i++) {
      sum += digits[i] * (10 - i);
    }
    var firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;

    sum = 0;
    for (var i = 0; i < 10; i++) {
      sum += digits[i] * (11 - i);
    }
    var secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;

    return '${digits.join()}$firstDigit$secondDigit';
  }

  /// {@template maskCPF}
  /// Returns the mask for [cpf]
  /// {@endtemplate}
  static String maskCPF = '###.###.###-##';
}
