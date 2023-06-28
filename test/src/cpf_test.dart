import 'package:br_utils/br_utils.dart';
import 'package:test/test.dart';

void main() {
  test('Valid CPF', () {
    expect(const CPF('12345678909').isValid(), isTrue);
    expect(const CPF('11144477735').isValid(), isTrue);
    expect(const CPF('01234567890').isValid(), isTrue);
  });

  test('Invalid CPF', () {
    expect(const CPF('12345678900').isValid(), isFalse);
    expect(const CPF('11111111111').isValid(), isFalse);
    expect(const CPF('00000000000').isValid(), isFalse);
  });

  test('CPF with non-numeric characters', () {
    expect(const CPF('123.456.789-09').isValid(), isTrue);
    expect(const CPF('111-444-777-35').isValid(), isTrue);
    expect(const CPF('012 345 678 90').isValid(), isTrue);
  });

  test('CPF with incorrect length', () {
    expect(const CPF('12345').isValid(), isFalse);
    expect(const CPF('123456789012').isValid(), isFalse);
  });

  test('CPF with repeating digits', () {
    expect(const CPF('00000000000').isValid(), isFalse);
    expect(const CPF('99999999999').isValid(), isFalse);
  });

  test('Valid CPF', () {
    const cpf = CPF('123.456.789-09');
    expect(cpf.isValid(), isTrue);
  });

  test('Invalid CPF', () {
    const cpf = CPF('123.456.789-00');
    expect(cpf.isValid(), isFalse);
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
  });
}
