import 'package:flutter/material.dart';
import 'package:login_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController userIdController;
  late TextEditingController userPwController;
  late bool vsbt;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    userPwController = TextEditingController();
    vsbt = false;
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
              'Log In',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 200,
                    color: Color.fromARGB(255, 28, 125, 204),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (value) {
                        changeAction();
                      },
                      controller: userIdController,
                      decoration: const InputDecoration(
                        labelText: 'ID',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: userPwController,
                      onChanged: (value) {
                        changeAction();
                      },
                      decoration: const InputDecoration(
                        labelText: 'PW',
                      ),
                      obscureText: true, //For password
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Visibility(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.blue[100],
                        disabledForegroundColor: Colors.white,
                      ),
                      onPressed: vsbt ? () => onPressed(context) : null,
                      child: const Text(
                        'login',
                      ),
                    ),
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

  //-----------------------------------------//
  //Desc: Textfield Changed
  //Date: 2022-12-20
  changeAction() {
    if (userPwController.text.trim().isNotEmpty &&
        userIdController.text.trim().isNotEmpty) {
      setState(() {
        vsbt = true;
      });
    } else {
      setState(() {
        vsbt = false;
      });
    }
  }
  //-----------------------------------------//

  //-----------------------------------------//
  //Desc: Login button pressed
  //Date: 2022-12-20
  onPressed(BuildContext context) {
    if (userIdController.text.trim() == 'root' &&
        userPwController.text.trim() == 'qwer1234') {
      _showDialog(context, userIdController.text, userPwController.text);
    } else {
      checkAlert(context);
    }
  }

  //-----------------------------------------//
  //Desc: Login Success
  //Date: 2022-12-20
  _showDialog(BuildContext context, String userid, String userpw) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '환영합니다!',
          ),
          content: const Text(
            '신원이 확인되었습니다',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
                userIdController.text = "";
                userPwController.text = "";
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage(
                        id: userid,
                        pw: userpw,
                      );
                    },
                  ),
                );
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
  //-----------------------------------------//

  //-----------------------------------------//
  //Desc: Login Fail
  //Date: 2022-12-20
  checkAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '로그인 오류',
          ),
          content: const Text(
            'ID 또는 비밀번호가 일치하지 않습니다.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '뒤로',
              ),
            ),
          ],
        );
      },
    );
  }
  //-----------------------------------------//

  //-----------------------------------------//
  //Desc: If textfields are empty
  //Date: 2022-12-20
  //Deprecated: 2022-12-20
  // errorSnackBar() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Row(
  //         children: const [
  //           Padding(
  //             padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
  //             child: Icon(
  //               Icons.warning,
  //               color: Colors.white,
  //             ),
  //           ),
  //           Text(
  //             '사용자 ID와 암호를 입력하세요',
  //           ),
  //         ],
  //       ),
  //       duration: const Duration(seconds: 2),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // }
  //-----------------------------------------//
}
