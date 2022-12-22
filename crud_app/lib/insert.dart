import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertStudent extends StatefulWidget {
  const InsertStudent({super.key});

  @override
  State<InsertStudent> createState() => _InsertStudentState();
}

class _InsertStudentState extends State<InsertStudent> {
  late TextEditingController codeCont;
  late TextEditingController nameCont;
  late TextEditingController deptCont;
  late TextEditingController phoneCont;
  List checkdata = [];

  @override
  void initState() {
    super.initState();
    codeCont = TextEditingController();
    nameCont = TextEditingController();
    deptCont = TextEditingController();
    phoneCont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Insert for CRUD',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: codeCont,
                onChanged: (value) {
                  setState(() {
                    _check();
                  });
                },
                decoration: InputDecoration(
                  fillColor: checkdata.isEmpty ? Colors.blue : Colors.red,
                  labelText: codeCont.text.trim().isEmpty
                      ? "학번을 입력하세요"
                      : checkdata.isNotEmpty
                          ? '중복된 학번입니다'
                          : codeCont.text.length < 5
                              ? '사용 가능한 학번입니다'
                              : '학번이 너무 깁니다.',
                ),
              ),
              TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  labelText: "이름을 입력하세요",
                ),
              ),
              TextField(
                controller: deptCont,
                decoration: const InputDecoration(
                  labelText: "전공을 입력하세요",
                ),
              ),
              TextField(
                controller: phoneCont,
                decoration: const InputDecoration(
                  labelText: "전화번호를 입력하세요",
                ),
              ),
              ElevatedButton(
                onPressed: checkdata.isNotEmpty
                    ? null
                    : codeCont.text.length <= 4
                        ? () {
                            getJSONData();
                            _showDialog(context);
                          }
                        : null,
                child: const Text(
                  '입력',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://192.168.10.213:8080/Flutter/student_insert_flutter.jsp?code=${codeCont.text}&name=${nameCont.text}&dept=${deptCont.text}&phone=${phoneCont.text}');
    await http.get(url);
  }

  _showDialog(BuildContext context) {
    if (checkdata.isEmpty) {
      getJSONData();
      showDialog(
        context: context,
        builder: (context) {
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
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text(
                  'ok',
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              '경고',
            ),
            content: const Text(
              '중복된 학번입니다.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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

  Future<bool> _check() async {
    checkdata.clear();
    var url = Uri.parse(
        'http://192.168.10.213:8080/Flutter/student_detail_flutter.jsp?code=${codeCont.text}');
    var response = await http.get(url);
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson['results'];

    setState(() {
      checkdata.addAll(result);
    });

    return true;
  }
}
