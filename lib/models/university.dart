import 'student.dart';
import 'course.dart';

abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName;
  int get age;
  String get role;
}

class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  }) : taughtCourses = taughtCourses ?? [];

  @override
  String get fullName => '$firstName $lastName';

  @override
  int get age {
    DateTime today = DateTime.now();
    int years = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      years--;
    }

    return years;
  }

  @override
  String get role => 'Professor';

  void addCourse(String courseId) {
    if (!taughtCourses.contains(courseId)) {
      taughtCourses.add(courseId);
    }
  }
}

class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  }) : students = students ?? [],
       professors = professors ?? [],
       courses = courses ?? [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String studentId) {
    students.removeWhere((student) => student.id == studentId);
  }

  Student? findStudentById(String id) {
    for (Student student in students) {
      if (student.id == id) {
        return student;
      }
    }
    return null;
  }

  List<Student> getStudentsByCourse(String courseId) {
    return students
        .where((student) => student.enrolledCourses.contains(courseId))
        .toList();
  }

  List<Course> getAvailableCoursesForStudent(String studentId) {
    Student? student = findStudentById(studentId);

    if (student == null) {
      return [];
    }

    return courses.where((course) => course.canStudentEnroll(student)).toList();
  }

  Map<String, dynamic> generateStatistics() {
    double totalGpa = 0;

    for (Student student in students) {
      totalGpa += student.gpa;
    }

    double averageGpa = students.isEmpty ? 0 : totalGpa / students.length;

    return {
      'students': students.length,
      'professors': professors.length,
      'courses': courses.length,
      'averageGpa': averageGpa,
    };
  }
}
