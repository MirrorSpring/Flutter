import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imageName;
  late int currentImage;

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
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Swiping',
        ),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onSwipe,
        onVerticalSwipe: _onSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 350,
                  //height: 600,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (currentImage > 0) {
                          currentImage--;
                        } else {
                          currentImage = imageName.length - 1;
                        }
                      });
                    },
                    child: const Text(
                      '<< 이전',
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (currentImage < imageName.length - 1) {
                          currentImage++;
                        } else {
                          currentImage = 0;
                        }
                      });
                    },
                    child: const Text(
                      '다음 >>',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //---Functions---//
  _onSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left || direction == SwipeDirection.up) {
        if (currentImage < imageName.length - 1) {
          currentImage++;
        } else {
          currentImage = 0;
        }
      }
      if (direction == SwipeDirection.right ||
          direction == SwipeDirection.down) {
        if (currentImage > 0) {
          currentImage--;
        } else {
          currentImage = imageName.length - 1;
        }
      }
    });
  }
}//end
