import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  late TextEditingController heightCont;
  late TextEditingController weightCont;
  late TextEditingController bmiCont;
  late String total;
  late String bmicategory;
  late var bmi;
  late String bmistr;
  late var icon;
  late bool vsty;
  late var iconclr;
  late double mingoal;
  late double maxgoal;

  @override
  void initState() {
    super.initState();
    heightCont = TextEditingController();
    weightCont = TextEditingController();
    bmiCont = TextEditingController();
    bmicategory = "";
    total = "";
    bmistr = "";
    icon = Icons.check;
    vsty = false;
    iconclr = Colors.green;
    mingoal = 0;
    maxgoal = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
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
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.straighten,
                                  size: 50,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: heightCont,
                                  decoration: const InputDecoration(
                                    labelText: '키(cm)',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.scale,
                                  size: 50,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: weightCont,
                                  decoration: const InputDecoration(
                                    labelText: '체중(kg)',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
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
                            if (heightCont.text.trim().isEmpty |
                                weightCont.text.trim().isEmpty) {
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
                            heightCont.text = "";
                            weightCont.text = "";
                            setState(() {
                              vsty = false;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          icon: const Icon(
                            Icons.refresh,
                          ),
                          label: const Text(
                            '초기화',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: vsty,
                        child: Text(
                          bmistr,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: vsty,
                    child: const SizedBox(
                      height: 30,
                    ),
                  ),
                  Visibility(
                    visible: vsty,
                    child: Text(
                      bmicategory,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: vsty,
                      child: Icon(
                        icon,
                        size: 50,
                        color: iconclr,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: vsty,
                      child: Text(
                        '키 ${heightCont.text}cm에서의 정상 체중: ${mingoal.round()}kg~${maxgoal.round()}kg',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
      var height = double.parse(heightCont.text) / 100;
      bmi =
          (double.parse(weightCont.text) / (height * height)).ceil().toDouble();
      bmistr = 'BMI 계산결과: $bmi';
      if (bmi <= 18.5) {
        bmicategory = "저체중입니다.";
        icon = Icons.warning;
        iconclr = Colors.yellow[700];
      } else if (bmi <= 23) {
        bmicategory = "정상입니다.";
        iconclr = Colors.green[800];
      } else if (bmi < 25) {
        bmicategory = "과체중입니다.";
        icon = Icons.warning;
        iconclr = Colors.orange[600];
      } else if (bmi < 30) {
        bmicategory = "비만입니다.";
        icon = Icons.warning;
        iconclr = Colors.red;
      } else {
        bmicategory = "고도비만입니다.";
        icon = Icons.warning;
        iconclr = Colors.red[900];
      }
      vsty = true;
      mingoal = 18.5 * height * height;
      maxgoal = 22.9 * height * height;

      total = "BMI 계산결과: $bmi\n$bmicategory입니다.";
      FocusScope.of(context).unfocus();
    });
  }
}
