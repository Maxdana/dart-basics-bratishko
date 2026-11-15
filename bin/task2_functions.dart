
void main() {
  print('=== Функції Dart ===');

  testBasicFunctions();
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
