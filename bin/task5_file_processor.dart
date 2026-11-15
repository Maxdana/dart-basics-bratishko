import 'dart:io';
import 'dart:convert';

import 'package:dart_basics_bratishko/models/student.dart';

Future<void> main() async {
  print('=== Async File Processor ===');

  // 1. Читання JSON
  String content = await File('students.json').readAsString();

  List<dynamic> data = jsonDecode(content);

  List<Student> students = data.map((item) => Student.fromJson(item)).toList();

  print('Завантажено студентів: ${students.length}');

  // 2. Послідовна обробка
  Stopwatch sequentialTimer = Stopwatch()..start();

  List<Map<String, dynamic>> sequentialResults = [];

  for (Student student in students) {
    sequentialResults.add(await processStudent(student));
  }

  sequentialTimer.stop();

  // 3. Паралельна обробка
  Stopwatch parallelTimer = Stopwatch()..start();

  List<Map<String, dynamic>> parallelResults = await Future.wait(
    students.map(processStudent),
  );

  parallelTimer.stop();

  // 4. Збереження результатів
  Map<String, dynamic> report = {
    'studentsCount': students.length,
    'sequentialTime': sequentialTimer.elapsedMilliseconds,
    'parallelTime': parallelTimer.elapsedMilliseconds,
    'results': parallelResults,
  };

  await File('students_processed.json')
      .writeAsString(const JsonEncoder.withIndent('  ').convert(report));

  // 5. Виведення статистики
  print('\nПослідовна обробка:');
  print('Час: ${sequentialTimer.elapsedMilliseconds} мс');

  print('\nПаралельна обробка:');
  print('Час: ${parallelTimer.elapsedMilliseconds} мс');

  print('\nРезультати обробки:');

  for (var result in parallelResults) {
    print('${result['name']}: ${result['gpa']}');
  }

  print('\nЗвіт збережено у students_processed.json');
}

Future<Map<String, dynamic>> processStudent(Student student) async {
  await Future.delayed(Duration(milliseconds: 300));

  return {
    'name': student.fullName,
    'age': student.age,
    'gpa': student.gpa,
    'courses': student.enrolledCourses,
  };
}
