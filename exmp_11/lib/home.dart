import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _imageName;
  late String _onName;
  late double _imageHeight;
  late double _imageWidth;
  late bool _switchValue;
  late double _rotateValue;
  late bool _colorValue;
  late double _zoom;
  late TextEditingController rCont;

  @override
  void initState() {
    super.initState();
    rCont = TextEditingController();
    _imageName = 'images/lamp_on.png';
    _onName = 'images/lamp_on.png';
    _imageHeight = 200;
    _imageWidth = 100;
    _switchValue = true;
    _rotateValue = 0;
    _colorValue = false;
    _zoom=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Zoom',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(_rotateValue), //육십분법
                      child: Image.asset(
                        _imageName,
                        height: _imageHeight*(_zoom+1),
                        width: _imageWidth*(_zoom+1),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('전구 회전'),
                  Slider(
                    value: _rotateValue,
                    onChanged: (value) {
                      setState(() {
                        _rotateValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 50,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            rotationSetup(context);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: Text('${(_rotateValue * 360).round()}º'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('전구  확대'),
                  Slider(
                    value: _zoom,
                    onChanged: (value) {
                      setState(() {
                        _zoom=value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 50,
                    child: Column(
                      children: [
                        Text(
                          '× ${(_zoom+1).toStringAsFixed(1)}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height:20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text('전구 색깔'),
                      CupertinoSwitch(
                        value: _colorValue,
                        onChanged: (value) {
                          setState(() {
                            _colorValue = value;
                          });
                          _colorStatus(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    width:50,
                  ),
                  Column(
                    children: [
                      const Text('전구 스위치'),
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                          _switchStatus(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _switchStatus(bool value) {
    if (value == false) {
      setState(() {
        _imageName = 'images/lamp_off.png';
      });
    } else {
      _imageName = _onName;
    }
  }

  _colorStatus(bool value) {
    if (value == true) {
      setState(() {
        _onName = 'images/lamp_red.png';
        if (_switchValue == true) {
          _imageName = _onName;
        }
      });
    } else {
      setState(() {
        _onName = 'images/lamp_on.png';
        if (_switchValue == true) {
          _imageName = _onName;
        }
      });
    }
  }

  rotationSetup(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            '회전 각도 설정',
          ),
          content: TextField(
            controller: rCont,
            decoration: const InputDecoration(labelText: '각도(0~360)',),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                '취소',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                setState(() {
                  _rotateValue=double.parse(rCont.text)/360;
                  rCont.text="";
                });
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }
}
