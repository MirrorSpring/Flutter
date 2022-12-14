import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second page',
        ),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
            '2번째 페이지입니다.',
          ),
        ),
      );
  }
}
