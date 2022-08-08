import 'package:flutter/material.dart';
import 'package:hive_demo/add_student.dart';
import 'package:hive_demo/functions/db_functions.dart';
import 'package:hive_demo/model/student_model.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return Scaffold(
        appBar: AppBar(
          title: Text('Student List'),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddStudent()),
                    );
                  },
                  child: Icon(Icons.add),
                )),
          ],
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: ValueListenableBuilder(
                valueListenable: studentListNotifier,
                builder: (BuildContext ctx, List<StudentModel> stuList,
                    Widget? child) {
                  return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final s = stuList[index];
                        return ListTile(
                          title: Text(s.name),
                          subtitle: Text(s.age),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    deleteStudent(index, ctx);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red[400],
                                  )),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount: stuList.length);
                },
              )),
        ));
  }
}
