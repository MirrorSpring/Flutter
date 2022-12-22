import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final String selectedcode;
  const Detail({super.key, required this.selectedcode});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late TextEditingController codeCont;
  late TextEditingController nameCont;
  late TextEditingController deptCont;
  late TextEditingController phoneCont;
  late List data;
  List checkdata = [];

  @override
  void initState() {
    super.initState();
    data = [];
    getJsonData();
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
            'Update for CRUD',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: codeCont,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "학번",
                ),
              ),
              TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  labelText: "이름",
                ),
              ),
              TextField(
                controller: deptCont,
                decoration: const InputDecoration(
                  labelText: "전공",
                ),
              ),
              TextField(
                controller: phoneCont,
                decoration: const InputDecoration(
                  labelText: "전화번호",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _check();
                  print('before: ${checkdata.length}');
                  if (checkdata.isEmpty) {
                    _showDialog(context);
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            '오류',
                          ),
                          content: const Text(
                            '중복된 코드입니다.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                print('click: ${checkdata.length}');
                                
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
                  print('after: ${checkdata.length}');
                },
                child: const Text(
                  '수정',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showDialogDelete(context);
                },
                child: const Text(
                  '삭제',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> getJsonData() async {
    var url = Uri.parse(
        'http://192.168.10.213:8080/Flutter/student_detail_flutter.jsp?code=${widget.selectedcode}');
    var response = await http.get(url);
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson['results'];

    setState(() {
      data.addAll(result);
    });

    codeCont.text = data[0]['code'];
    nameCont.text = data[0]['name'];
    deptCont.text = data[0]['dept'];
    phoneCont.text = data[0]['phone'];

    return true;
  }

  _update() async {
    var url = Uri.parse(
        'http://192.168.10.213:8080/Flutter/student_update_flutter.jsp?code=${codeCont.text}&name=${nameCont.text}&dept=${deptCont.text}&phone=${phoneCont.text}&original=${widget.selectedcode}');
    await http.get(url);
  }

  _delete() async {
    var url = Uri.parse(
        'http://192.168.10.213:8080/Flutter/student_delete_flutter.jsp?code=${widget.selectedcode}');
    await http.get(url);
  }

  _check() async {
    
    var url = Uri.parse(
        'http://192.168.10.213:8080/Flutter/student_check_flutter.jsp?code=${codeCont.text}&original=${widget.selectedcode}');
    var response = await http.get(url);
    checkdata.clear();
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson['results'];

    setState(() {
      checkdata.addAll(result);
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '수정',
          ),
          content: const Text(
            '수정하시겠습니까?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                print('No: ${checkdata.length}');
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
              ),
            ),
            TextButton(
              onPressed: () {
                _update();
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: const Text(
                'Yes',
              ),
            ),
          ],
        );
      },
    );
  }

  _showDialogDelete(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '삭제',
          ),
          content: const Text(
            '삭제하시겠습니까?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                _delete();
              },
              child: const Text(
                'Yes',
              ),
            ),
          ],
        );
      },
    );
  }
}
