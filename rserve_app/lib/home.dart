import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController slCont;
  late TextEditingController swCont;
  late TextEditingController plCont;
  late TextEditingController pwCont;

  late String imageName;
  String result = "all";

  @override
  void initState() {
    super.initState();
    slCont = TextEditingController();
    swCont = TextEditingController();
    plCont = TextEditingController();
    pwCont = TextEditingController();
    imageName = "images/all";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Iris 품종 예측",
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: slCont,
                  decoration: const InputDecoration(
                    labelText: "Sepal Length",
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: swCont,
                  decoration: const InputDecoration(
                    labelText: "Sepal Width",
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: plCont,
                  decoration: const InputDecoration(
                    labelText: "Petal Length",
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: pwCont,
                  decoration: const InputDecoration(
                    labelText: "Petal Width",
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    String sl = slCont.text;
                    String sw = swCont.text;
                    String pl = plCont.text;
                    String pw = pwCont.text;
                    
                    getJSONData(sl, sw, pl, pw);
                  },
                  child: const Text(
                    '입력',
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/$result.jpg'),
                  radius: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getJSONData(String sl, String sw, String pl, String pw) async {
    var url = Uri.parse('http://192.168.10.213:8080/rserve?sl=$sl&sw=$sw&pl=$pl&pw=$pw');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });

    _showDialog(context, result);
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '품종 예측 결과',
          ),
          content: Text(
            '입력하신 품종은 $result 입니다',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  imageName = result;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
}
