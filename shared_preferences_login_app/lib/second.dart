import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String userid;
  late String userpw;

  @override
  void initState() {
    super.initState();
    userid = "";
    userpw = "";
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Second',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ID: $userid',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'PW: $userpw',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = (prefs.getString('p_userid'))!;
      userpw = (prefs.getString('p_userpw'))!;
    });
  }
}//end