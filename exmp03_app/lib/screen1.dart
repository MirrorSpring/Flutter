import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Mail',
        ),
        backgroundColor: Colors.yellow[900],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,50,0,0),
        child: Column(
          children: const [
            Text(
              '지우에게서 온 메일',
            ),
            Text(
              '로사에게서 온 메일',
            ),
            Text(
              '웅이에게서 온 메일',
            ),
          ],
        ),
      ),
    );
  }
}
