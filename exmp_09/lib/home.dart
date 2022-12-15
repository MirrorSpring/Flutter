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
  late bool addvalue;
  late bool subtvalue;
  late bool multvalue;
  late bool divvalue;

  @override
  void initState() {
    super.initState();
    num1Cont = TextEditingController();
    num2Cont = TextEditingController();
    addCont = TextEditingController();
    subtCont = TextEditingController();
    multCont = TextEditingController();
    divCont = TextEditingController();
    addvalue = false;
    subtvalue = false;
    multvalue = false;
    divvalue = false;
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
        drawer: Drawer(
          child: ListView(
            //padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.calculate,
                  color: Colors.black,
                ),
                title: const Text('간단한 계산기'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.scale,
                  color: Colors.black,
                ),
                title: const Text('BMI 계산기'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/1st');
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: num1Cont,
                              decoration: const InputDecoration(
                                labelText: '첫 번째 숫자',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: num2Cont,
                              decoration: const InputDecoration(
                                labelText: '두 번째 숫자',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (num1Cont.text.trim().isEmpty |
                                num2Cont.text.trim().isEmpty) {
                              errorSnackBar(context);
                            } else {
                              showResult(context);
                            }
                          },
                          icon: const Icon(
                            Icons.calculate,
                          ),
                          label: const Text('계산하기'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              num1Cont.text = "";
                              num2Cont.text = "";
                              addCont.text = "";
                              subtCont.text = "";
                              multCont.text = "";
                              divCont.text = "";
                              addvalue = false;
                              subtvalue = false;
                              multvalue = false;
                              divvalue = false;
                              FocusScope.of(context).unfocus();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            icon: const Icon(
                              Icons.refresh,
                            ),
                            label: const Text('초기화')),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('덧셈'),
                          Switch(
                            value: addvalue,
                            onChanged: (value) {
                              setState(() {
                                addvalue = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const Text('뺄셈'),
                          Switch(
                            value: subtvalue,
                            onChanged: (value) {
                              setState(() {
                                subtvalue = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const Text('곱셈'),
                          Switch(
                            value: multvalue,
                            onChanged: (value) {
                              setState(() {
                                multvalue = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const Text('나눗셈'),
                          Switch(
                            value: divvalue,
                            onChanged: (value) {
                              setState(() {
                                divvalue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Visibility(
                    visible: addvalue,
                    child: Padding(
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
                  ),
                  Visibility(
                    visible: subtvalue,
                    child: Padding(
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
                  ),
                  Visibility(
                    visible: multvalue,
                    child: Padding(
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
                  ),
                  Visibility(
                    visible: divvalue,
                    child: Padding(
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
      SnackBar(
        content: Row(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.warning_amber,
                color: Colors.white,
              ),
            ),
            Text(
              '숫자를 입력하세요',
            ),
          ],
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Date: 2022-12-14
  showResult(BuildContext context) {
    setState(() {
      if (addvalue == true) {
        addCont.text =
            (double.parse(num1Cont.text) + double.parse(num2Cont.text))
                .toString(); //숫자를 문자로 변환
      } else {
        addCont.text = "";
      }

      if (subtvalue == true) {
        subtCont.text =
            (double.parse(num1Cont.text) - double.parse(num2Cont.text))
                .toString();
      } else {
        subtCont.text = "";
      }

      if (multvalue == true) {
        multCont.text =
            (double.parse(num1Cont.text) * double.parse(num2Cont.text))
                .toString();
      } else {
        multCont.text = "";
      }

      if (divvalue == true) {
        if (int.parse(num2Cont.text) == 0) {
          divCont.text = '0으로는 나눌 수 없습니다';
        } else {
          divCont.text =
              (double.parse(num1Cont.text) / double.parse(num2Cont.text))
                  .toString();
        }
      } else {
        divCont.text = "";
      }

      FocusScope.of(context).unfocus();
    });
  }
}
