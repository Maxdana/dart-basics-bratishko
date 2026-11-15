
import 'package:test/test.dart';
import 'package:dart_basics_bratishko/models/student.dart';

void main() {
  test('Повне ім’я студента', () {
    final student = Student(
      id: '001',
      firstName: 'Іван',
      lastName: 'Петренко',
      birthDate: DateTime(2005, 5, 10),
    );

    expect(student.fullName, 'Іван Петренко');
  });

  test('Обчислення середнього бала', () {
    final student = Student(
      id: '002',
      firstName: 'Олена',
      lastName: 'Коваль',
      birthDate: DateTime(2004, 3, 15),
    );

    student.addGrade('C1', 80);
    student.addGrade('C2', 90);

    expect(student.gpa, 85);
  });

  test('Запис студента на курс без дублювання', () {
    final student = Student(
      id: '003',
      firstName: 'Андрій',
      lastName: 'Мельник',
      birthDate: DateTime(2005, 7, 20),
    );

    student.enrollInCourse('C1');
    student.enrollInCourse('C1');

    expect(student.enrolledCourses.length, 1);
  });

  test('Визначення складених курсів', () {
    final student = Student(
      id: '004',
      firstName: 'Марія',
      lastName: 'Шевченко',
      birthDate: DateTime(2005, 2, 12),
    );

    student.addGrade('C1', 75);
    student.addGrade('C2', 45);

    expect(student.getPassedCourses(), ['C1']);
  });
}
