import 'package:br_utils/br_utils.dart';
import 'package:test/test.dart';

void main() {
  group('CNPJ', () {
    test('Valid CNPJ', () {
      const cnpj = CNPJ('38.877.367/0001-60');
      expect(cnpj.isValid(), isTrue);
      expect(cnpj.unmask(), '38877367000160');
    });

    test('Invalid CNPJ', () {
      const cnpj = CNPJ('12.345.678/0001-00');
      expect(cnpj.isValid(), isFalse);
      expect(cnpj.unmask(), '12345678000100');
    });

    test('CNPJ with non-numeric characters', () {
      final cnpj = CNPJ.unmask('38.877.367/0001-60');
      expect(cnpj.isValid(), isTrue);
      expect(cnpj.unmask(), '38877367000160');
    });

    test('Empty CNPJ', () {
      const emptyCnpj = CNPJ.empty();
      expect(emptyCnpj.isValid(), isFalse);
      expect(emptyCnpj.unmask(), isNull);
    });

    test('Null CNPJ', () {
      const nullCnpj = CNPJ(null);
      expect(nullCnpj.isValid(), isFalse);
      expect(nullCnpj.unmask(), isNull);
    });

    test('CNPJ with incorrect length', () {
      const cnpj = CNPJ('123456789012345');
      expect(cnpj.isValid(), isFalse);
      expect(cnpj.unmask(), '123456789012345');
    });

    test('Generate CNPJ', () {
      final cnpj = CNPJ.generateCNPJ();
      final unmaskedCnpj = const CNPJ.empty().generate;

      expect(CNPJ.isValidCNPJ(cnpj), isTrue);
      expect(CNPJ.isValidCNPJ(unmaskedCnpj), isTrue);
    });

    test('mask should return the correct CNPJ mask', () {
      expect(CNPJ.maskCNPJ, '##.###.###/####-##');
      expect(const CNPJ.empty().mask, '##.###.###/####-##');
    });
  });
}
