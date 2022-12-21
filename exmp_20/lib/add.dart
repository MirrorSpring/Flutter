import 'package:exmp_20/model/opening.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  RegExp basicReg = RegExp(r"^[A-Z]{1}[A-Za-z|\s|'|-]+$"); //정규식
  late TextEditingController cont;
  late bool isable;
  late int selectedItem;
  late List<String> firstmove;
  late List<Widget> widgetlist;

  @override
  void initState() {
    super.initState();
    cont = TextEditingController();
    isable = false;
    selectedItem = 0;
    firstmove = ["1. e4", "1. d4", "1. c4", "1. Nf3", "1. f4", "1. b3", "Others"];
    widgetlist = [];
    for (int i = 0; i < firstmove.length; i++) {
      widgetlist.add(
        SizedBox(
          height: 30,
          child: Text(
            firstmove[i],
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add Opening',
            ),
          ),
        ),

        //---------------BODY---------------//
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: cont,
                  onChanged: (value) {
                    if (basicReg.hasMatch(cont.text)) {
                      setState(() {
                        isable = true;
                      });
                    } else {
                      setState(() {
                        isable = false;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: '오프닝 이름',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '첫 수',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 200,
                      child: CupertinoPicker(
                        itemExtent: 25, //선택된 공간의 크기
                        scrollController: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedItem = value;
                          });
                        },
                        children: widgetlist,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: isable ? () => addAction(context) : null,
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

  addAction(BuildContext context) {
    Message.name = cont.text;
    Message.firstmove = firstmove[selectedItem];
    Message.isnew = true;
    Navigator.pop(context);
  }
}
