import 'package:exmp_18/model/lamp.dart';
import 'package:exmp_18/update.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool lampon;
  late bool lampred;

  @override
  void initState() {
    super.initState();
    lampon = false;
    lampred = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Main',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const UpdateLamp();
                  },
                ),
              ).then((value) {
                setState(() {
                  lampon = Lamp.ison;
                  lampred = Lamp.isred;
                });
              });
            },
            icon: const Icon(
              Icons.create,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          lampon
              ? lampred
                  ? 'images/lamp_red.png'
                  : 'images/lamp_on.png'
              : 'images/lamp_off.png',
          width: 200,
        ),
      ),
    );
  }
}
