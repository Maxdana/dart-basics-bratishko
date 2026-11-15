import 'dart:io';
import 'dart:convert';

import 'package:dart_basics_bratishko/models/student.dart';

Future<void> main() async {
  print('=== Dart Async Programming Demo ===');

  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(Duration(seconds: 1));
  return 'Отримано дані студента з ID: $studentId';
}

Future<List<Student>> loadStudentsFromFile(String filename) async {
  String content = await File(filename).readAsString();
  List<dynamic> data = jsonDecode(content);

  return data.map((item) => Student.fromJson(item)).toList();
}

Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  List<Map<String, dynamic>> data = students
      .map((student) => student.toJson())
      .toList();

  await File(filename).writeAsString(jsonEncode(data));
}

Stream<Student> studentStream() async* {
  List<String> lines = await File('students.csv').readAsLines();

  for (String line in lines.skip(1)) {
    List<String> data = line.split(',');

    Student student = Student(
      id: data[0],
      firstName: data[1],
      lastName: data[2],
      birthDate: DateTime.parse(data[3]),
    );

    student.enrollInCourse('C1');
    student.enrollInCourse('C2');
    student.addGrade('C1', double.parse(data[4]));
    student.addGrade('C2', double.parse(data[5]));

    yield student;
  }
}

Future<void> demonstrateFutures() async {
  print('\n=== Futures ===');

  List<String> results = await Future.wait([
    fetchStudentData('001'),
    fetchStudentData('003'),
    fetchStudentData('004'),
  ]);

  for (String result in results) {
    print(result);
  }

  try {
    String result = await fetchStudentData('001').timeout(Duration(seconds: 2));
    print('Успішний запит: $result');
  } catch (error) {
    print('Помилка: $error');
  }

  try {
    await fetchStudentData('003').timeout(Duration(milliseconds: 100));
  } catch (error) {
    print('Перевірка тайм-ауту: $error');
  }
}

Future<void> demonstrateStreams() async {
  print('\n=== Streams ===');

  await for (Student student in studentStream()) {
    print('${student.fullName}: ${student.gpa}');
  }

  print('Студенти із середнім балом від 70:');

  await for (Student student in studentStream().where(
    (student) => student.gpa >= 70,
  )) {
    print(student.fullName);
  }
}

Future<void> demonstrateFileOperations() async {
  print('\n=== File Operations ===');

  List<Student> students = await studentStream().toList();

  await saveStudentsToFile(students, 'students.json');
  print('Дані збережено у students.json');

  List<Student> loaded = await loadStudentsFromFile('students.json');

  print('Завантажено студентів: ${loaded.length}');

  for (Student student in loaded) {
    print('${student.fullName}: ${student.gpa}');
  }
}
