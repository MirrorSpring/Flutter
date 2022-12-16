import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage; //Image Name
  late double _lampWidth; //Image Width
  late double _lampHeight; //Image Height
  late String _buttonName; //Button Title
  late bool _switch; //Status of the Switch
  late String _lampSizeStatus; //Size of Lamp in Current Screen

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = '이미지 확대';
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Image Zoom',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 650,
                child: Column( //child는 무조건 독점, children은 공용
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      decisionLampSize();
                    },
                    child: Text(
                      _buttonName,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Switch(
                        value: _switch,
                        onChanged: (value) {
                          setState(() {
                            _switch = value;
                            decisionOnOff();
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  // -- Functions -- //
  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      setState(() {
        _lampWidth = _lampWidth * 2;
        _lampHeight = _lampHeight * 2;
        _buttonName = '이미지 축소';
        _lampSizeStatus = 'large';
      });
    } else {
      setState(() {
        _lampWidth = _lampWidth / 2;
        _lampHeight = _lampHeight / 2;
        _buttonName = '이미지 확대';
        _lampSizeStatus = 'small';
      });
    }
  }

  decisionOnOff() {
    if (_switch == false) {
      _lampImage = 'images/lamp_off.png';
    } else {
      _lampImage = 'images/lamp_on.png';
    }
  }
}
