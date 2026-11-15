class Student {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> enrolledCourses;
  final Map<String, double> grades;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    List<String>? enrolledCourses,
    Map<String, double>? grades,
  }) : enrolledCourses = enrolledCourses ?? [],
       grades = grades ?? {};

  String get fullName => '$firstName $lastName';

  int get age {
    DateTime today = DateTime.now();
    int years = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      years--;
    }

    return years;
  }

  double get gpa {
    if (grades.isEmpty) {
      return 0;
    }

    double sum = 0;
    for (double grade in grades.values) {
      sum += grade;
    }

    return sum / grades.length;
  }

  void enrollInCourse(String courseId) {
    if (!enrolledCourses.contains(courseId)) {
      enrolledCourses.add(courseId);
    }
  }

  void addGrade(String courseId, double grade) {
    grades[courseId] = grade;
  }

  List<String> getPassedCourses() {
    List<String> passed = [];

    grades.forEach((courseId, grade) {
      if (grade >= 60) {
        passed.add(courseId);
      }
    });

    return passed;
  }

  @override
  String toString() {
    return '$fullName (ID: $id, вік: $age, середній бал: $gpa)';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'enrolledCourses': enrolledCourses,
      'grades': grades,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: DateTime.parse(json['birthDate']),
      enrolledCourses: List<String>.from(json['enrolledCourses']),
      grades: Map<String, double>.from(json['grades']),
    );
  }
}
