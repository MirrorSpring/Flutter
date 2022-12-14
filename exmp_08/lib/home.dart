import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Cont;
  late TextEditingController num2Cont;
  late TextEditingController addCont;
  late TextEditingController subtCont;
  late TextEditingController multCont;
  late TextEditingController divCont;

  @override
  void initState() {
    super.initState();
    num1Cont = TextEditingController();
    num2Cont = TextEditingController();
    addCont = TextEditingController();
    subtCont = TextEditingController();
    multCont = TextEditingController();
    divCont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (num1Cont.text.trim().isEmpty |
                                num2Cont.text.trim().isEmpty) {
                              errorSnackBar(context);
                            } else {
                              showResult(context);
                            }
                          },
                          child: const Text('계산하기'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              num1Cont.text = "";
                              num2Cont.text = "";
                              addCont.text = "";
                              subtCont.text = "";
                              multCont.text = "";
                              divCont.text = "";
                              FocusScope.of(context).unfocus();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('지우기')),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: addCont,
                      decoration: const InputDecoration(
                        labelText: '덧셈 결과',
                      ),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: subtCont,
                      decoration: const InputDecoration(
                        labelText: '뺄셈 결과',
                      ),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: multCont,
                      decoration: const InputDecoration(
                        labelText: '곱셈 결과',
                      ),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: divCont,
                      decoration: const InputDecoration(
                        labelText: '나눗셈 결과',
                      ),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
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
  }

  // Date: 2022-12-14
  showResult(BuildContext context) {
    setState(() {
      addCont.text = (double.parse(num1Cont.text) + double.parse(num2Cont.text))
          .toString(); //숫자를 문자로 변환
      subtCont.text =
          (double.parse(num1Cont.text) - double.parse(num2Cont.text))
              .toString();
      multCont.text =
          (double.parse(num1Cont.text) * double.parse(num2Cont.text))
              .toString();
      if (int.parse(num2Cont.text) == 0) {
        divCont.text = '0으로는 나눌 수 없습니다';
      } else {
        divCont.text =
            (double.parse(num1Cont.text) / double.parse(num2Cont.text))
                .toString();
      }
      FocusScope.of(context).unfocus();
    });
  }
}
