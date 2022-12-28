import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  late TextEditingController nameCont;
  late TextEditingController addressCont;

  @override
  void initState() {
    super.initState();
    nameCont=TextEditingController();
    addressCont=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  hintText: "이름",
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: addressCont,
                decoration: const InputDecoration(
                  hintText: "주소",
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _insert();
                Navigator.pop(context);
              },
              child: const Text(
                '입력',
              ),
              ),
          ],
        ),
      )
    );
  }

  _insert() async {

    var url = Uri.parse(
        'http://192.168.10.213:8080/InsertDao?name=${nameCont.text}&address=${addressCont.text}');
    await http.get(url);
  }
}