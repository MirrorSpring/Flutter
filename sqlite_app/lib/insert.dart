import 'package:flutter/material.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/students.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
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
              'Insert',
            ),
          ),
        ),
        body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Column(
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
                      addStudents().whenComplete(() {
                        _showDialog(context);
                      });
                    },
                    child: const Text('입력'),
                  ),
                ],
              );
            },
          ),
        ));
  }

  Future<int> addStudents() async {
    Students firstStudent = Students(
        code: codeCont.text,
        name: nameCont.text,
        dept: deptCont.text,
        phone: phoneCont.text);
    await handler.insertStudents(firstStudent);
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
            '입력 결과',
          ),
          content: const Text(
            '입력이 완료되었습니다',
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
