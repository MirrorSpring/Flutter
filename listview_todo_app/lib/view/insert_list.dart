import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

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
                  addList();
                }
                Navigator.pop(context);
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
  addList() {
    Message.workList = textEditingController.text.trim();
    Message.imagePath = 'images/pencil.png';
    Message.isnew=true;
  }
}
