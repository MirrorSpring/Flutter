import 'package:flutter/material.dart';

import 'model/animal.dart';
import 'model/message.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  late TextEditingController animalnameCont;
  late String animalClass;
  late bool canFly;
  late List<String> animalimage;
  String selectedImage = "";

  @override
  void initState() {
    super.initState();
    animalnameCont = TextEditingController();
    animalClass = "양서류";
    canFly = false;
    animalimage = [
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: animalnameCont,
                  decoration: const InputDecoration(
                    labelText: '동물 이름',
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: "양서류",
                      groupValue: animalClass,
                      onChanged: (value) {
                        setState(() {
                          animalClass = value!;
                        });
                      },
                    ),
                    const Text(
                      '양서류',
                    ),
                    Radio(
                      value: "파충류",
                      groupValue: animalClass,
                      onChanged: (value) {
                        setState(() {
                          animalClass = value!;
                        });
                      },
                    ),
                    const Text(
                      '파충류',
                    ),
                    Radio(
                      value: "포유류",
                      groupValue: animalClass,
                      onChanged: (value) {
                        setState(() {
                          animalClass = value!;
                        });
                      },
                    ),
                    const Text(
                      '포유류',
                    ),
                    Radio(
                      value: "곤충",
                      groupValue: animalClass,
                      onChanged: (value) {
                        setState(() {
                          animalClass = value!;
                        });
                      },
                    ),
                    const Text(
                      '곤충',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('날 수 있나요?'),
                  const SizedBox(
                    width: 30,
                  ),
                  Checkbox(
                    value: canFly,
                    onChanged: (value) {
                      setState(() {
                        canFly = value!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: animalimage.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedImage = animalimage[index];
                      },
                      child: Image.asset(
                        animalimage[index],
                        height: 80,
                        width: 80,
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (animalnameCont.text.trim().isNotEmpty&selectedImage.isNotEmpty) {
                    addAnimal();
                  }
                },
                child: const Text(
                  'Add',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addAnimal() {
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            'Add Animal',
          ),
          content: Text(
            '이름: ${animalnameCont.text}\n분류: $animalClass\n추가하시겠습니까?',
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
                FocusScope.of(context).unfocus();
                setState(() {
                  Message.animalList.add(Animal(
                      animalName: animalnameCont.text.trim(),
                      animalImage: selectedImage,
                      canFly: canFly,
                      animalClass: animalClass));
                });
                animalnameCont.text="";
                animalClass="양서류";
                canFly=false;
                selectedImage="";
              },
              child: const Text(
                'Yes',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'No',
              ),
            ),
          ],
        );
      },
    );
  }
}
