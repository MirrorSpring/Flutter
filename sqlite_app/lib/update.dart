import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/students.dart';

class UpdatePage extends StatefulWidget {
  final sid;
  const UpdatePage({super.key, required this.sid});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController codeCont;
  late TextEditingController nameCont;
  late TextEditingController deptCont;
  late TextEditingController phoneCont;
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    codeCont = TextEditingController();
    nameCont = TextEditingController();
    deptCont = TextEditingController();
    phoneCont = TextEditingController();
    handler = DatabaseHandler();
    handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Update',
          ),
        ),
      ),
      body: FutureBuilder(
        future: handler.selectStudents(widget.sid),
        builder:
            (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
          codeCont.text = snapshot.data![0].code;
          nameCont.text = snapshot.data![0].name;
          deptCont.text = snapshot.data![0].dept;
          phoneCont.text = snapshot.data![0].phone;
          return Center(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: codeCont,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: nameCont,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: deptCont,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: phoneCont,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    updateStudents().whenComplete(() {
                      _showDialog(context);
                    });
                  },
                  child: const Text(
                    '수정',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<int> updateStudents() async {
    Students firstStudent = Students(
        code: codeCont.text,
        name: nameCont.text,
        dept: deptCont.text,
        phone: phoneCont.text,
        id: widget.sid);
    await handler.updateStudents(firstStudent);
    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            '수정 결과',
          ),
          content: const Text(
            '수정이 완료되었습니다',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.pop(context);
              },
              child: const Text(
                '종료',
              ),
            ),
          ],
        );
      },
    );
  }
}
