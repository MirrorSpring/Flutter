import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool swhitchValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Switch',
        ),
      ),
      body: Center(
        child: Switch(
          value: swhitchValue,
          onChanged: (value) {
            setState(
              () {
                swhitchValue = value;
              },
            );
          },
        ),
      ),
    );
  }
}
