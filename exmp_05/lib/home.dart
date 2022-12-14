import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _text = 'Hello';
  late var _clrs = Colors.blue[900];
  late bool _status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change button color & text on switch',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _clrs,
              ),
              child: Text(
                _text,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Switch(
              value: _status,
              onChanged: (value) {
                setState(
                  () {
                    _onClick();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ---Fucntions ---
  _onClick() {
    setState(() {
      if (_text == 'Hello') {
        _text = 'Flutter';
        _clrs = Colors.yellow[900];
        _status = true;
      } else {
        _text = 'Hello';
        _clrs = Colors.blue[900];
        _status = false;
      }
    });
  }
}
