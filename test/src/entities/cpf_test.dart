import 'package:br_utils/br_utils.dart';
import 'package:test/test.dart';

void main() {
  group('CPF', () {
    test('Valid CPF', () {
      const cpf = CPF('123.456.789-09');
      expect(cpf.isValid(), isTrue);
      expect(cpf.unmask(), '12345678909');
    });

    test('Invalid CPF', () {
      const cpf = CPF('123.456.789-00');
      expect(cpf.isValid(), isFalse);
      expect(cpf.unmask(), '12345678900');
    });

    test('CPF with non-numeric characters', () {
      final cpf = CPF.unmask('123.456.789-09');
      expect(cpf.isValid(), isTrue);
      expect(cpf.unmask(), '12345678909');
    });

    test('Empty CPF', () {
      const emptyCpf = CPF.empty();
      expect(emptyCpf.isValid(), isFalse);
      expect(emptyCpf.unmask(), isNull);
    });

    test('Null CPF', () {
      const nullCpf = CPF(null);
      expect(nullCpf.isValid(), isFalse);
      expect(nullCpf.unmask(), isNull);
    });

    test('CPF with incorrect length', () {
      const cpf = CPF('123456789012');
      expect(cpf.isValid(), isFalse);
      expect(cpf.unmask(), '123456789012');
    });

    test('Generate CPF', () {
      final cpf = CPF.generateCPF();
      final unmaskedCpf = const CPF.empty().generate;

      expect(CPF.isValidCPF(cpf), isTrue);
      expect(CPF.isValidCPF(unmaskedCpf), isTrue);
    });

    test('mask should return the correct CPF mask', () {
      expect(CPF.maskCPF, '###.###.###-##');
      expect(const CPF.empty().mask, '###.###.###-##');
    });
  });
}
