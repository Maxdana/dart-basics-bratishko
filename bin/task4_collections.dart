import 'package:dart_basics_bratishko/models/student.dart';
import 'package:dart_basics_bratishko/models/university.dart';
import 'package:dart_basics_bratishko/utils/data_processor.dart';

void main() {
  print('=== Dart Collections & Data Processing Demo ===');
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

List<Student> createStudents() {
  Student trump = Student(
    id: '001',
    firstName: 'Дональд',
    lastName: 'Трамп',
    birthDate: DateTime(1946, 6, 14),
  );
  trump.enrollInCourse('C1');
  trump.enrollInCourse('C2');
  trump.addGrade('C1', 65);
  trump.addGrade('C2', 70);

  Student putin = Student(
    id: '003',
    firstName: 'Владімір',
    lastName: 'Путін',
    birthDate: DateTime(1952, 10, 7),
  );
  putin.enrollInCourse('C1');
  putin.enrollInCourse('C2');
  putin.addGrade('C1', 68);
  putin.addGrade('C2', 71);

  Student xi = Student(
    id: '004',
    firstName: 'Сі',
    lastName: 'Цзіньпін',
    birthDate: DateTime(1953, 6, 15),
  );
  xi.enrollInCourse('C1');
  xi.enrollInCourse('C2');
  xi.addGrade('C1', 85);
  xi.addGrade('C2', 80);

  return [trump, putin, xi];
}

void demonstrateLists() {
  print('\n=== Lists ===');

  List<int> numbers = [1, 2, 3, 4, 5];

  print('Список: $numbers');
  print('Парні числа: ${DataProcessor.filterEvenNumbers(numbers)}');
  print('map: ${numbers.map((n) => n * 2).toList()}');
  print('where: ${numbers.where((n) => n > 2).toList()}');
  print('fold: ${numbers.fold(0, (sum, n) => sum + n)}');
  print('reduce: ${numbers.reduce((a, b) => a + b)}');

  print('Студенти за середнім балом:');
  print(DataProcessor.sortStudentsByGPA(createStudents()));
}

void demonstrateSets() {
  print('\n=== Sets ===');

  Set<String> first = {'C1', 'C2'};
  Set<String> second = {'C2', 'C3'};

  print('Перша множина: $first');
  print('Друга множина: $second');
  print('Об’єднання: ${first.union(second)}');
  print('Перетин: ${first.intersection(second)}');

  print('Спільні курси студентів:');
  print(DataProcessor.findCommonCourses(createStudents()));
}

void demonstrateMaps() {
  print('\n=== Maps ===');

  List<Student> students = createStudents();

  print('Кількість слів:');
  print(DataProcessor.countWords('Дипломатія і політика і переговори'));

  print('Групування за роком народження:');
  DataProcessor.groupStudentsByYear(students).forEach((year, group) {
    print('$year: ${group.map((student) => student.fullName).toList()}');
  });

  print('Середні оцінки за курсами:');
  print(DataProcessor.calculateAverageGradesByCourse(students));
}

void demonstrateAdvancedOperations() {
  print('\n=== Advanced Operations ===');

  List<Student> students = createStudents();

  University university = University(
    name: 'Академія світової політики',
    students: students,
  );

  print('Звіт університету:');
  print(DataProcessor.generateReport(university));

  print('Сортування студентів:');
  print(DataProcessor.sortStudentsByGPA(students));

  print('Кількість студентів: ${university.students.length}');
  print('Середній бал університету:');
  print(university.generateStatistics()['averageGpa']);
}
