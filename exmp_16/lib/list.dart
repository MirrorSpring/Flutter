import 'package:flutter/material.dart';

import 'model/animal.dart';
import 'model/message.dart';

class AnimalList extends StatefulWidget {
  const AnimalList({super.key});

  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  List<String> animalname = ['벌', '고양이', '젖소', '강아지', '여우', '원숭이', '돼지', '늑대'];
  List<String> animalclass = [
    '곤충',
    '포유류',
    '포유류',
    '포유류',
    '포유류',
    '포유류',
    '포유류',
    '포유류'
  ];
  List<bool> canFly = [true, false, false, false, false, false, false, false];
  List<String> animalimage = [
    'images/bee.png',
    'images/cat.png',
    'images/cow.png',
    'images/dog.png',
    'images/fox.png',
    'images/monkey.png',
    'images/pig.png',
    'images/wolf.png'
  ];

  @override
  void initState() {
    super.initState();
    if (Message.isnew == true) {
      for (int i = 0; i < animalname.length; i++) {
        Message.animalList.add(Animal(
            animalName: animalname[i],
            animalImage: animalimage[i],
            canFly: canFly[i],
            animalClass: animalclass[i]));
      }
      Message.isnew = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: Message.animalList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showAnimal(index, context);
              },
              child: SizedBox(
                height: 120,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        Message.animalList[index].animalImage,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        Message.animalList[index].animalName,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //functions//
  showAnimal(int index, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            Message.animalList[index].animalName,
          ),
          content: Text(
            '이 동물은 ${Message.animalList[index].animalClass}입니다.\n날 수 ${Message.animalList[index].canFly == true ? '있습니다' : '없습니다'}.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                '닫기',
              ),
            ),
          ],
        );
      },
    );
  }
}
