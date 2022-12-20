import 'package:exmp_18/model/lamp.dart';
import 'package:flutter/material.dart';

class UpdateLamp extends StatefulWidget {
  const UpdateLamp({super.key});

  @override
  State<UpdateLamp> createState() => _UpdateLampState();
}

class _UpdateLampState extends State<UpdateLamp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Main',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Red',
                ),
                Switch(
                  value: Lamp.isred,
                  onChanged: (value) {
                    setState(() {
                      Lamp.isred = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'On',
                ),
                Switch(
                  value: Lamp.ison,
                  onChanged: (value) {
                    setState(() {
                      Lamp.ison = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
