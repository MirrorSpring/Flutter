import 'package:exmp_17/model/text.dart';
import 'package:exmp_17/update.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lamponoff;
  late TextEditingController hometxtCont;

  @override
  void initState() {
    super.initState();
    lamponoff = 'images/lamp_off.png';
    hometxtCont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                      return const UpdateTxt();
                    },
                  ),
                ).then((value) {
                  setState(() {
                    lamponoff = InputText.lamp
                        ? 'images/lamp_on.png'
                        : 'images/lamp_off.png';
                    hometxtCont.text = InputText.txt;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: hometxtCont,
                  readOnly: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                lamponoff,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
