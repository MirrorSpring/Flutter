import 'package:example_02_app/main.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Navigator_AppBar',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/1st');
            },
            icon: const Icon(
              Icons.email,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2nd');
            },
            icon: const Icon(
              Icons.email_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                '보낸 편지함',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2nd');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                '받은 편지함',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
