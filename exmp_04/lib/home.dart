import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert and Push',
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _showDialog(context);
          },
          child: const Text(
            'Move to the 2nd page',
            style: TextStyle(
              fontSize: 30,
            )
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            'Page 이동',
          ),
          content: const Text(
            '아래의 버튼을 누르면 페이지를 이동합니다.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.pushNamed(context, '/1st');
              },
              child: const Text(
                'Page 이동',
              ),
            ),
          ],
        );
      },
    );
  }
}
