
void main() {
  print('=== Змінні та типи даних Dart ===');

  demonstrateNumbers();
  demonstrateStrings();
}

void demonstrateNumbers() {
  print('\n--- Робота з числами ---');

  int a = 22;
  int b = 4;
  double price = 22.4;
  num number = 4;

  print('Перше число: $a');
  print('Друге число: $b');

  print('Додавання: ${a + b}');
  print('Віднімання: ${a - b}');
  print('Множення: ${a * b}');
  print('Ділення: ${a / b}');

  print('Дробове число: $price');
  print('Тип num: $number');

  double converted = a.toDouble();
  int rounded = price.toInt();

  print('Перетворення int у double: $converted');
  print('Перетворення double у int: $rounded');
}

void demonstrateStrings() {
  print('\n--- Робота з текстом ---');

  String text = 'Все буде Україна!';
  String word = 'Україна';

  print('Текст: $text');
  print('Кількість символів: ${text.length}');
  print('Великі літери: ${text.toUpperCase()}');
  print('Малі літери: ${text.toLowerCase()}');
  print('Чи містить слово Україна: ${text.contains(word)}');

  print('Об\'єднання рядків: ' + text + ' Ми переможемо!');

  String multiLine = '''
Все буде Україна!
Все буде добре!
''';

  print('Багаторядковий текст:\n$multiLine');
}
