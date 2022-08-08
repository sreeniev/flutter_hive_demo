import 'package:flutter/material.dart';
import 'package:hive_demo/functions/db_functions.dart';
import 'package:hive_demo/model/student_model.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);

  final _nameCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _ageCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Age'),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton.icon(
                  onPressed: () {
                    addClicked(context);
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add')),
            )
          ],
        ),
      )),
    );
  }

  Future<void> addClicked(BuildContext ctx) async {
    final _name = _nameCtrl.text;
    final _age = _ageCtrl.text;

    if (_name.isEmpty || _age.isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text('Please Enter Valid Data'),
        backgroundColor: Colors.red,
      ));

      return;
    }

    final _student = StudentModel(name: _name, age: _age);
    addStudent(_student, ctx);
  }
}
