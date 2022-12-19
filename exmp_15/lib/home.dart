import 'package:exmp_15/model/animal.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Animal> animal;
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
    animal=[];
    for (int i = 0; i < animalname.length; i++) {
      animal.add(Animal(
          animalName: animalname[i],
          animalImage: animalimage[i],
          canFly: canFly[i],
          animalClass: animalclass[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List View Test',
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: animal.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showAnimal(index, context);
              },
              child: SizedBox(
                height:120,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        animalimage[index],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        animalname[index],
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
  showAnimal(int index, BuildContext context){
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            animal[index].animalName,
          ),
          content: Text(
            '이 동물은 ${animal[index].animalClass}입니다.\n날 수 ${animal[index].canFly==true?'있습니다':'없습니다'}.',
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
