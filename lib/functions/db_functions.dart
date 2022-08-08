import 'package:flutter/material.dart';
import 'package:hive_demo/model/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel student, BuildContext ctx) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final dbId = await studentDB.add(student);
  student.id = dbId;

  studentListNotifier.value.add(student);
  studentListNotifier.notifyListeners();

  showSnackBar(ctx, 'Student Added!');
  goBack(ctx);
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id, BuildContext ctx) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();

  showSnackBar(ctx, 'Student Deleted!');
}

showSnackBar(BuildContext ctx, String message) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  ));
}

goBack(BuildContext ctx) {
  Navigator.pop(ctx);
}
