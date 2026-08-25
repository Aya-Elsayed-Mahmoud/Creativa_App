class Student {
  final String name;
  final String studentId;
  final String organization;

  const Student({
    required this.name,
    required this.studentId,
    this.organization = 'Creativa App',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'studentId': studentId,
      'organization': organization,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] as String,
      studentId: map['studentId'] as String,
      organization: map['organization'] as String? ?? 'Creativa App',
    );
  }
}
