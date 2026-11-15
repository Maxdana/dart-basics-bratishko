
void main() {
  print('=== Змінні та типи даних Dart ===');

  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
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
  print('Об\'єднання рядків: $text Ми переможемо!');


  String multiLine = '''
Все буде Україна!
Все буде добре!
''';

  print('Багаторядковий текст:\n$multiLine');
}

void demonstrateBooleans() {
  print('\n--- Логічні значення ---');

  int a = 22;
  int b = 4;

  bool isGreater = a > b;
  bool isEqual = a == b;

  print('22 більше за 4: $isGreater');
  print('22 дорівнює 4: $isEqual');
  print('22 не дорівнює 4: ${a != b}');
  print('Обидва числа додатні: ${a > 0 && b > 0}');
  print('Хоча б одне число більше за 20: ${a > 20 || b > 20}');
  print('Заперечення рівності: ${!isEqual}');

  if (a > b) {
    print('Перше число більше за друге');
  } else {
    print('Друге число більше або дорівнює першому');
  }

  String result = a > b ? 'Так' : 'Ні';
  print('Чи перше число більше: $result');
}

void demonstrateCollections() {
  print('\n--- Колекції ---');

  List<int> numbers = [22, 4, 10];
  print('Список чисел: $numbers');

  numbers.add(8);
  print('Список після додавання: $numbers');
  print('Перший елемент: ${numbers.first}');
  print('Кількість елементів: ${numbers.length}');

  Set<int> uniqueNumbers = {22, 4, 10};
  print('Множина без повторень: $uniqueNumbers');

  uniqueNumbers.add(8);
  print('Множина після додавання: $uniqueNumbers');

  Map<String, int> values = {
    'Перше число': 22,
    'Друге число': 4,
  };

  print('Словник: $values');
  print('Перше число зі словника: ${values['Перше число']}');

  values['Третє число'] = 10;
  print('Словник після додавання: $values');
}


void demonstrateNullSafety() {
  print('\n--- Null Safety ---');

  String? city;
  print('Початкове значення: $city');

  print('Місто: ${city ?? 'Місто невідоме'}');

  city ??= 'Київ';
  print('Після присвоєння: $city');

  late String description;
  description = 'Київ — столиця України';
  print('Опис: $description');

  showCity(name: 'Київ');
}
void showCity({required String name}) {
  print('Обов\'язковий параметр: $name');
}
