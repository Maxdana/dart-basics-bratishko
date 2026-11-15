import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
  // Робота зі списками
  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((number) => number.isEven).toList();
  }

  static Map<String, int> countWords(String text) {
    Map<String, int> result = {};

    for (String word in text.toLowerCase().split(' ')) {
      if (word.isNotEmpty) {
        result[word] = (result[word] ?? 0) + 1;
      }
    }

    return result;
  }

  static List<Map<String, dynamic>> sortStudentsByGPA(List<Student> students) {
    List<Student> sorted = List.from(students);
    sorted.sort((a, b) => b.gpa.compareTo(a.gpa));

    return sorted.map((student) {
      return {'name': student.fullName, 'gpa': student.gpa};
    }).toList();
  }

  // Робота з множинами
  static Set<String> getUniqueSkills(List<Student> students) {
    return {};
  }

  static Set<String> findCommonCourses(List<Student> students) {
    if (students.isEmpty) {
      return {};
    }

    Set<String> common = students.first.enrolledCourses.toSet();

    for (Student student in students.skip(1)) {
      common = common.intersection(student.enrolledCourses.toSet());
    }

    return common;
  }

  // Робота зі словниками
  static Map<String, List<Student>> groupStudentsByYear(
    List<Student> students,
  ) {
    Map<String, List<Student>> result = {};

    for (Student student in students) {
      String year = student.birthDate.year.toString();
      result.putIfAbsent(year, () => []);
      result[year]!.add(student);
    }

    return result;
  }

  static Map<String, double> calculateAverageGradesByCourse(
    List<Student> students,
  ) {
    Map<String, List<double>> grades = {};

    for (Student student in students) {
      student.grades.forEach((courseId, grade) {
        grades.putIfAbsent(courseId, () => []);
        grades[courseId]!.add(grade);
      });
    }

    Map<String, double> result = {};

    grades.forEach((courseId, values) {
      double sum = values.reduce((a, b) => a + b);
      result[courseId] = sum / values.length;
    });

    return result;
  }

  // Формування звіту
  static List<Map<String, dynamic>> generateReport(University university) {
    return university.students.map((student) {
      return {
        'name': student.fullName,
        'age': student.age,
        'gpa': student.gpa,
        'courses': student.enrolledCourses,
      };
    }).toList();
  }
}
