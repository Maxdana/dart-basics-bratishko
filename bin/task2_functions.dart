
void main() {
  print('=== Функції Dart ===');

  testBasicFunctions();
  testAdvancedFunctions();
}

int calculateSum(int a, int b) {
  return a + b;
}

double calculateAverage(List<double> numbers) {
  double sum = 0;

  for (double number in numbers) {
    sum += number;
  }

  return sum / numbers.length;
}

String formatName(
  String firstName,
  String lastName, {
  String? middleName,
  bool uppercase = false,
}) {
  String fullName = '$firstName $lastName';

  if (middleName != null) {
    fullName = '$firstName $middleName $lastName';
  }

  if (uppercase) {
    return fullName.toUpperCase();
  }

  return fullName;
}

void testBasicFunctions() {
  print('\n--- Основні функції ---');

  print('Сума: ${calculateSum(35, 3)}');
  print('Середнє значення: ${calculateAverage([35.0, 3.0])}');

  print('ПІБ: ${formatName('Степан', 'Бандера')}');
  print('Великими літерами: ${formatName('Степан', 'Бандера', uppercase: true)}');
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) {
    return 1;
  }

  return n * factorial(n - 1);
}

void testAdvancedFunctions() {
  print('\n--- Рекурсивні функції ---');

  print('Число Фібоначчі для 5: ${fibonacci(5)}');
  print('Факторіал числа 4: ${factorial(4)}');
}
