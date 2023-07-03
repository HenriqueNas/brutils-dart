import 'dart:math';

import 'package:br_utils/br_utils.dart';

/// {@template CNPJ}
/// [CNPJ] class is responsible for validating CNPJ
///
/// ```dart
///   final cnpj = CNPJ.unmask('12.345.678/0001-90');
///   cnpj.isValid(); // false
///   cnpj.unmask(); // 12345678000190
/// ```
/// {@endtemplate}
class CNPJ implements EntitiesContract {
  /// {@macro CNPJ}
  const CNPJ(this.cnpj);

  /// Removes all non-numeric characters from [cnpj]
  /// and returns a [CNPJ] instance
  ///
  /// {@macro CNPJ}
  CNPJ.unmask(String cnpj) : cnpj = unmaskCNPJ(cnpj);

  /// Creates an empty [CNPJ] instance
  const CNPJ.empty() : cnpj = null;

  /// The CNPJ number
  final String? cnpj;

  /// Returns true if [cnpj] is valid
  @override
  bool isValid([String? cnpjParam]) {
    final cnpj = cnpjParam ?? this.cnpj;
    if (cnpj == null || cnpj.isEmpty) return false;

    return isValidCNPJ(unmaskCNPJ(cnpj));
  }

  /// Removes all non-numeric characters from [cnpj]
  @override
  String? unmask([String? cnpjParam]) {
    final cnpj = cnpjParam ?? this.cnpj;
    if (cnpj == null || cnpj.isEmpty) return null;

    return unmaskCNPJ(cnpj);
  }

  @override
  String get generate => generateCNPJ();

  @override
  String get mask => maskCNPJ;

  /// Generates a random CNPJ
  static String generateCNPJ() {
    final numbers = StringBuffer();

    for (var i = 0; i < 12; i += 1) {
      numbers.write(Random().nextInt(9));
    }

    numbers
      ..write(_verifierDigit(numbers.toString()))
      ..write(_verifierDigit(numbers.toString()));

    return numbers.toString();
  }

  /// Removes all non-numeric characters from [cnpj]
  static String unmaskCNPJ(String cnpj) {
    return cnpj.replaceAll(RegExp(digitsOnlyRegex), '');
  }

  static int _verifierDigit(String cnpj) {
    var index = 2;

    final reverse = cnpj.split('').map(int.parse).toList().reversed.toList();

    var sum = 0;

    for (final number in reverse) {
      sum += number * index;
      index = index == 9 ? 2 : index + 1;
    }

    final mod = sum % 11;

    return mod < 2 ? 0 : 11 - mod;
  }

  /// Returns true if [cnpj] is valid
  static bool isValidCNPJ(String cnpj) {
    if (cnpj.isEmpty || cnpj.length != 14) return false;

    var numbers = cnpj.substring(0, 12);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        cnpj.substring(cnpj.length - 2);
  }

  /// Returns the mask for [cnpj]
  static const String maskCNPJ = '##.###.###/####-##';
}
