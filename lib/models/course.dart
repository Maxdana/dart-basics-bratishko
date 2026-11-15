import 'student.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final int credits;
  final String instructor;
  final List<String> prerequisites;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.credits,
    required this.instructor,
    List<String>? prerequisites,
  }) : prerequisites = prerequisites ?? [];

  bool hasPrerequisites() {
    return prerequisites.isNotEmpty;
  }

  bool canStudentEnroll(Student student) {
    for (String courseId in prerequisites) {
      if (!student.getPassedCourses().contains(courseId)) {
        return false;
      }
    }
    return true;
  }

  @override
  String toString() {
    return '$name (ID: $id, кредити: $credits, викладач: $instructor)';
  }
}
