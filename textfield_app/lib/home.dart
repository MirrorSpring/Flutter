import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String inputValue; //사용자의 입력 내용
  RegExp basicReg = RegExp(r"^[a-zA-Z]*$"); //정규식

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    inputValue = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Single Textfield',
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: '글자를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if(!basicReg.hasMatch(textEditingController.text)){ //입력한 글자가 정규식을 만족하는지 확인
                      errorSnackBar(context);
                    } else{
                      showSnackBar(context);
                    }
                  },
                  child: const Text(
                    '제출',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //---Functions---//

  // Date: 2022-12-14
  // Desc: 텍스트 필드의 입력값이 정규식을 만족하지 않을 경우
  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
        '알파벳만 입력 가능합니다.',
      ),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
      ),
    );
  }

  // Date: 2022-12-14
  // Desc: 텍스트 필드에 정규식을 만족하는 값을 입력하고 버튼을 눌렀을 경우
  showSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
        '입력한 글자는 ${textEditingController.text} 입니다.',
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
      ),
    );
  }

} //End
