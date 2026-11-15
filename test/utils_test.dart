
import 'package:test/test.dart';

void main() {
  test('Додавання', () {
    expect(41 + 4, 45);
  });

  test('Віднімання', () {
    expect(41 - 4, 37);
  });

  test('Множення', () {
    expect(41 * 4, 164);
  });

  test('Ділення', () {
    expect(41 / 4, 10.25);
  });
}
