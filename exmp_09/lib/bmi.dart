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

  @override
  void initState() {
    super.initState();
    heightCont = TextEditingController();
    weightCont = TextEditingController();
    bmiCont = TextEditingController();
    bmicategory = "";
    total = "";
    bmistr = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 측정기'),
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
              title: const Text('BMI 측정기'),
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
                            controller: heightCont,
                            decoration: const InputDecoration(
                              labelText: '키(cm)',
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (heightCont.text.trim().isEmpty |
                              weightCont.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else {
                            showResult(context);
                          }
                        },
                        child: const Text('계산하기'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          heightCont.text = "";
                          weightCont.text = "";
                          setState(() {
                            bmistr="";
                            bmicategory="";
                          });
                          FocusScope.of(context).unfocus();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
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
                    Text(
                      bmistr,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  bmicategory,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
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
      var height = double.parse(heightCont.text) / 100;
      bmi=(double.parse(weightCont.text) / (height * height)).ceil().toDouble();
      bmistr = 'BMI 계산결과: $bmi';
      if (bmi <= 18.5) {
        bmicategory = "저체중입니다.";
      } else if (bmi <= 23) {
        bmicategory = "정상입니다.";
      } else if (bmi < 25) {
        bmicategory = "과체중입니다.";
      } else if (bmi < 30) {
        bmicategory = "비만입니다.";
      } else {
        bmicategory = "고도비만입니다.";
      }

      total = "BMI 계산결과: $bmi\n$bmicategory입니다.";
      FocusScope.of(context).unfocus();
    });
  }
}
