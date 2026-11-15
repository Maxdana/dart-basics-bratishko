import 'package:dart_basics_bratishko/models/student.dart';
import 'package:dart_basics_bratishko/models/course.dart';
import 'package:dart_basics_bratishko/models/university.dart';

void main() {
  print('=== University Management System Demo ===');
  runUniversityDemo();
}

void runUniversityDemo() {
  // 1. Створюємо університет
  University university = University(name: 'Академія світової політики');
  print('Університет: ${university.name}');

  // 2. Додаємо студента та професора
  Student student = Student(
    id: '001',
    firstName: 'Дональд',
    lastName: 'Трамп',
    birthDate: DateTime(1946, 6, 14),
  );

  Professor professor = Professor(
    id: '002',
    firstName: 'Степан',
    lastName: 'Пупка',
    birthDate: DateTime(1977, 12, 21),
    department: 'Міжнародні відносини',
    salary: 50000,
  );

  university.addStudent(student);
  university.professors.add(professor);

  print('Студент: ${student.fullName}, вік: ${student.age}');
  print('Професор: ${professor.fullName}, вік: ${professor.age}');

  // 3. Створюємо курси
  Course course1 = Course(
    id: 'C1',
    name: 'Основи дибілізму',
    description: 'Початковий курс дибілізму',
    credits: 3,
    instructor: professor.fullName,
  );

  Course course2 = Course(
    id: 'C2',
    name: 'Міжнародні переговори з терористами',
    description: 'Курс міжнародних переговорів з терористами',
    credits: 4,
    instructor: professor.fullName,
    prerequisites: ['C1'],
  );

  university.courses.add(course1);
  university.courses.add(course2);
  professor.addCourse('C1');
  professor.addCourse('C2');

  print('Курси: ${course1.name}, ${course2.name}');

  // 4. Записуємо студента на курси
  student.enrollInCourse('C1');
  print('Студент записаний на: ${course1.name}');

  // 5. Додаємо оцінку
  student.addGrade('C1', 65);
  print('Оцінка за ${course1.name}: ${student.grades['C1']}');

  if (course2.canStudentEnroll(student)) {
    student.enrollInCourse('C2');
    print('Студент записаний на: ${course2.name}');
  }

  student.addGrade('C2', 70);
  print('Оцінка за ${course2.name}: ${student.grades['C2']}');

  // 6. Показуємо статистику
  print('Статистика університету:');
  print(university.generateStatistics());
  print('Середній бал студента: ${student.gpa}');
}
