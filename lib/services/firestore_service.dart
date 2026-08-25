import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class FirestoreService {
  final CollectionReference _studentsRef =
      FirebaseFirestore.instance.collection('students');

  Future<void> registerStudent(Student student) async {
    await _studentsRef.doc(student.studentId).set(student.toMap());
  }

  Future<Student?> getStudent(String studentId) async {
    final doc = await _studentsRef.doc(studentId).get();
    if (!doc.exists) return null;
    return Student.fromMap(doc.data() as Map<String, dynamic>);
  }
}
