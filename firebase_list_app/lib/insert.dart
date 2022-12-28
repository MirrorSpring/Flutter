import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late TextEditingController codeCont;
  late TextEditingController nameCont;
  late TextEditingController deptCont;
  late TextEditingController phoneCont;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeCont = TextEditingController();
    nameCont = TextEditingController();
    deptCont = TextEditingController();
    phoneCont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: codeCont,
              decoration: const InputDecoration(labelText: "학번"),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: nameCont,
              decoration: const InputDecoration(labelText: "이름"),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: deptCont,
              decoration: const InputDecoration(labelText: "학과"),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: phoneCont,
              decoration: const InputDecoration(labelText: "전화번호"),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                String code = codeCont.text;
                String name = nameCont.text;
                String dept = deptCont.text;
                String phone = phoneCont.text;

                addAction(code, name, dept, phone);
              },
              child: const Text('입력'),
            ),
          ],
        ),
      ),
    );
  }

  //Functions//
  addAction(String code, String name, String dept, String phone) {
    FirebaseFirestore.instance
        .collection('student')
        .add({'code': code, 'name': name, 'dept': dept, 'phone': phone});
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '입력 결과',
          ),
          content: const Text(
            '입력되었습니다',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }
}
