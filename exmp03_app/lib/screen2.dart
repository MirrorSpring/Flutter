import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Received Mail',
          ),
          backgroundColor: Colors.yellow[900]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,50,0,0),
        child: Column(
          children: const [
            Text(
              '지우에게 보낸 메일',
            ),
            Text(
              '로사에게 보낸 메일',
            ),
            Text(
              '웅이에게 보낸 메일',
            ),
          ],
        ),
      ),
    );
  }
}
