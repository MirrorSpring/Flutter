import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _buttonState;

  @override
  void initState() {
    super.initState();
    _buttonState = 'OFF';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _onClick();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '버튼을 누르세요',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '버튼 상태: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  _buttonState,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  _onClick() {
    setState(() {
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }
} //End
