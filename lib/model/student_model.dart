import 'package:hive/hive.dart';

//note: first execute the command "flutter packages pub run build_runner watch --use-polling-watcher --delete-conflicting-outputs" and then add below line.
part 'student_model.g.dart'; // refer: https://www.youtube.com/watch?v=W4e0r4m-1GY&list=PLY-ecO2csVHcUlBVvIMAa3dbja12TFJiN&index=20

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  StudentModel({required this.name, required this.age, this.id});
}
