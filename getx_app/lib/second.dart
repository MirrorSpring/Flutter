import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var value = Get.arguments ?? "_"; //데이터 받기
  //??: Null Safety(After version 3)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Page',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back( //pop()
                  result: "Good", //데이터 주기
                );
              },
              child: const Text(
                'Back',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third');
              },
              child: const Text(
                'Third',
              ),
            ),
            Text(
              'Multiple Arguments#1: ${value[0]}', //데이터 출력
            ),
            Text(
              'Multiple Arguments#2: ${value[1]}',
            ),
          ],
        ),
      ),
    );
  }
}
