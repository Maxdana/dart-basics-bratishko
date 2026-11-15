import 'dart:io';

void main() {
  print('=== Аналіз даних студентів ===');

  File file = File('students.csv');
  List<String> lines = file.readAsLinesSync();

  List<Map<String, dynamic>> students = [];

  for (String line in lines.skip(1)) {
    List<String> data = line.split(',');

    double grade1 = double.parse(data[4]);
    double grade2 = double.parse(data[5]);

    students.add({
      'name': '${data[1]} ${data[2]}',
      'year': data[3].substring(0, 4),
      'average': (grade1 + grade2) / 2,
    });
  }

  students.sort((a, b) => b['average'].compareTo(a['average']));

  print('Кількість студентів: ${students.length}');
  print('\nРейтинг студентів:');

  for (var student in students) {
    print('${student['name']}: ${student['average']}');
  }

  double total = 0;
  for (var student in students) {
    total += student['average'];
  }

  print('\nСередній бал університету: ${total / students.length}');

  print('\nГрупування за роком народження:');
  for (var student in students) {
    print('${student['year']}: ${student['name']}');
  }
}
