import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert Dialog with Gesture',
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _showDialog(context);
          },
          child: const Text(
            'Hello, World!',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  // ---Functions --- //
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            'Alert Title',
          ),
          content: const Text(
            'Hello World Touched',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                '종료',
              ),
            ),
          ],
        );
      },
    );
  }
} //End