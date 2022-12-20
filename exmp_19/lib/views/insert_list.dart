import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late int selectedItem;
  late List selectedImage;
  late bool emp;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    selectedItem = 0;
    selectedImage = [
      'images/cart.png',
      'images/clock.png',
      'images/pencil.png'
    ];
    emp = false;
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
            'Add View',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    selectedImage[selectedItem],
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoPicker(
                      backgroundColor: Colors.blue[100],
                      itemExtent: 50, //선택된 공간의 크기
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                      children: [
                        SizedBox(
                          child: Image.asset(
                            'images/cart.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        SizedBox(
                          child: Image.asset(
                            'images/clock.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        SizedBox(
                          child: Image.asset(
                            'images/pencil.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      if (textEditingController.text.trim().isNotEmpty) {
                        emp = true;
                      } else {
                        emp = false;
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: '목록을 입력하세요',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: emp ? () => addList(context) : null,
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

  //Functions
  addList(BuildContext context) {
    Message.workList = textEditingController.text.trim();
    Message.imagePath = selectedImage[selectedItem];
    Message.isnew = true;
    Navigator.pop(context);
  }
}
