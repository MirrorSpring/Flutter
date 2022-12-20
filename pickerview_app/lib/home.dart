import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Picker View',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Picker View로 이미지 선택',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.red[100],
                itemExtent: 20, //선택된 공간의 크기
                scrollController: FixedExtentScrollController(
                  initialItem: 0,
                ),
                onSelectedItemChanged: (value) {
                  setState(() {
                    selectedItem=value;
                  });
                },
                children: [
                  Text(
                    imageName[0],
                  ),
                  Text(
                    imageName[1],
                  ),
                  Text(
                    imageName[2],
                  ),
                  Text(
                    imageName[3],
                  ),
                  Text(
                    imageName[4],
                  ),
                  Text(
                    imageName[5],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Selected Item: ${imageName[selectedItem]}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Image.asset(
              'images/${imageName[selectedItem]}',
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
