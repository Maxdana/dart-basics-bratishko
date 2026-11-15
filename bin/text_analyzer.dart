
void main() {
  String text = 'Реве та стогне Дніпр широкий.';

  int words = text.trim().split(' ').length;
  int characters = text.length;

  print('=== Текстовий аналізатор ===');
  print('Текст: $text');
  print('Кількість слів: $words');
  print('Кількість символів: $characters');
}
