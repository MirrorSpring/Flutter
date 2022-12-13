import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('ElevatedButton is clicked'), //글자
                duration: Duration(milliseconds: 200),
                backgroundColor: Colors.green,
              ));
            },
            child: const Text('SnackBarButton')));
  }
}
