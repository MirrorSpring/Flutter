import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver {
  //***
  late AppLifecycleState _appLifecycleState;
  late TextEditingController idCont;
  late TextEditingController pwCont;

  @override
  void initState() {
    super.initState();
    idCont = TextEditingController();
    pwCont = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
    _initSharedPreferences(); //SharedPreferences 초기화
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached: //앱이 메모리에서 없어진 상태
        print('detatched');
        break;
      case AppLifecycleState.resumed: //다시 돌아왔을 때
        print('resume');
        break;
      case AppLifecycleState.inactive: //앱 비활성화(최소화 버튼 누르기), 꺼짐
        _disposeSharedPreferences();
        print('inactive');
        break;
      case AppLifecycleState.paused:
        print('pause');
        break;
    }
    _appLifecycleState = state;
    super.didChangeAppLifecycleState(state);
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
              '로그인',
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 35,
                  child: CupertinoTextField(
                    controller: idCont,
                    placeholder: "ID",
                    // decoration:,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 35,
                  child: CupertinoTextField(
                    controller: pwCont,
                    obscureText: true,
                    placeholder: "PW",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoButton.filled(
                onPressed: () {
                  _showDialog(context);
                },
                child: const Text(
                  'Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idCont.text = (prefs.getString('p_userid') ?? "");
      pwCont.text = (prefs.getString('p_userpw') ?? "");
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '환영합니다',
          ),
          content: const Text(
            '신원이 확인되었습니다',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveSharedPreferences();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SecondPage();
                    },
                  ),
                );
              },
              child: const Text(
                'OK',
              ),
            )
          ],
        );
      },
    );
  }

  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', idCont.text);
    pref.setString('p_userpw', pwCont.text);
  }

  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear(); //세션의 정보 전부 지우기
    //pref.remove('p_userpw'); //특정 키만 지우기
  }
}//End
