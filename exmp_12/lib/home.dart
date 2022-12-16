import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_off.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'Show Messages with Alert',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _lampImage,
              height: 400,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    lightOn();
                  },
                  child: const Text(
                    'On',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    lightOff();
                  },
                  child: const Text(
                    'Off',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  lightOn() {
    if (_lampImage == 'images/lamp_off.png') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '램프 켜기',
            ),
            content: const Text('램프를 켜시겠습니까?'),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text(
                        'No',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        setState(() {
                          _lampImage = 'images/lamp_on.png';
                        });
                      },
                      child: const Text(
                        'Yes',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '경고',
            ),
            content: const Text('램프가 켜져 있습니다.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    '확인',
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  lightOff() {
    if (_lampImage == 'images/lamp_on.png') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '램프 끄기',
            ),
            content: const Text('램프를 끄시겠습니까?'),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text(
                        'No',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        setState(() {
                          _lampImage = 'images/lamp_off.png';
                        });
                      },
                      child: const Text(
                        'Yes',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '경고',
            ),
            content: const Text('램프가 꺼져 있습니다.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    '확인',
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
