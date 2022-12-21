import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'GetX Route Management',
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Get.to(
                  const SecondPage(),
                  arguments: ["First", "Second"],
                  transition: Transition.circularReveal, //화면 전환 효과
                  duration: const Duration(seconds: 1), //화면 전환 시간
                );
              },
              child: const Text(
                '데이터 넘기기',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var returnValue = await Get.to(
                  const SecondPage(),
                  arguments: ["First", "Second"],
                );
                Get.snackbar(
                  "Return Value",
                  '$returnValue',
                  snackPosition: SnackPosition.BOTTOM, //스낵바 위치: 기본값은 상단
                  backgroundColor: Colors.amber,
                );
              },
              child: const Text(
                '데이터 넘기고 받기',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "SnackBar", //Title
                  "Message", //Message
                  backgroundColor: Colors.red[50],
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'SnackBar',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  barrierDismissible: false,
                  backgroundColor: Colors.blue[50],
                  title: "Dialog",
                  middleText: 'Message',
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Exit',
                      ),
                    ),
                  ],
                );
              },
              child: const Text(
                'Dialog',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 100,
                    color: Colors.purple[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Line1',
                        ),
                        Text(
                          'Line2',
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text(
                'Bottom Sheet',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  '/third?id=root&name=루트',
                );
              },
              child: const Text(
                'Getpages 방식으로 넘기기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
