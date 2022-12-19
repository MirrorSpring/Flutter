import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add View',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.trim().isNotEmpty) {
                  _showDialog(context);
                }
              },
              child: const Text(
                '입력',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Functions
  addList(String image) {
    Message.workList = textEditingController.text.trim();
    Message.imagePath = image;
    Message.isnew = true;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            '이미지 선택',
          ),
          content: Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      addList('images/cart.png');
                      Navigator.of(ctx).pop();
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'images/cart.png',
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addList('images/pencil.png');
                      Navigator.of(ctx).pop();
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'images/pencil.png',
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addList('images/clock.png');
                      Navigator.of(ctx).pop();
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'images/clock.png',
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                '취소',
              ),
            ),
          ],
        );
      },
    );
  }
}
