import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Cont;
  late TextEditingController num2Cont;
  late String num1input;
  late String num2input;
  late String resultText;

  @override
  void initState() {
    super.initState();
    num1Cont = TextEditingController();
    num2Cont = TextEditingController();
    resultText = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('덧셈 구하기'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  Text(resultText,
                      style: const TextStyle(
                        fontSize: 25,
                      )),
                  Container(
                    width: 120,
                    child: Column(
                      children: [
                        TextField(
                          controller: num1Cont,
                          decoration: const InputDecoration(
                            labelText: '첫 번째 숫자를 입력하세요',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: num2Cont,
                          decoration: const InputDecoration(
                            labelText: '두 번째 숫자를 입력하세요',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (num1Cont.text.trim().isEmpty |
                            num2Cont.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          showAddResult(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(1000, 40)),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add,
                          ),
                          Text('덧셈 계산'),
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Date: 2022-12-14
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '숫자를 입력하세요',
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
    setState(() {
      resultText = "";
    });
  }

  // Date: 2022-12-14
  showAddResult(BuildContext context) {
    setState(() {
      resultText =
          '덧셈 결과: ${int.parse(num1Cont.text) + int.parse(num2Cont.text)}';
    });
  }
}
