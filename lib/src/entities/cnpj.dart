import 'package:br_utils/br_utils.dart';

/// {@template CNPJ}
/// [CNPJ] class is responsible for CNPJ utils methods
/// {@endtemplate}
class CNPJ implements EntitiesContract {
  @override
  String get generate => throw UnimplementedError();

  @override
  bool isValid([String? value]) {
    throw UnimplementedError();
  }

  @override
  String get mask => throw UnimplementedError();

  @override
  String? unmask([String? value]) {
    throw UnimplementedError();
  }
}
