import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ImagePicker _picker;
  XFile? image = XFile("");
  late String _pickedImage;
  late bool uploadable;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _pickedImage = "";
    uploadable = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '파일 업로드 테스트',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                _pickedImage == ''
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.blue[50],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '이미지 미리보기',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          File(
                            _pickedImage,
                          ),
                          height: 300,
                          width: 300,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickImage();
                        },
                        child: const Text(
                          '이미지 선택',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: uploadable
                            ? () {
                                _upLoad().whenComplete(() {
                                  _showUploaded();
                                });
                              }
                            : null,
                        child: const Text(
                          '업로드',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //이미지 고르기
  Future<void> _pickImage() async {
    image = await _picker.pickImage(
        source: ImageSource.gallery); //gallery, camera 중 선택 가능
    int size = await image!.length();
    if (size <= 100000000) { //대략 100MB보다 작은 사이즈(Spring의 application.properties에서 설정 가능)
      setState(() {
        uploadable = true;
      });
    }
    setState(() {
      _pickedImage = image!.path;
    });
  }

  //이미지 올리기
  Future<void> _upLoad() async {
    if (image != null) {
      _showLoading();
      var url = Uri.parse("http://192.168.10.213:8080/upload");
      var request = http.MultipartRequest("POST", url);
      request.files
          .add(await http.MultipartFile.fromPath('image', image!.path));
      await request.send().whenComplete(() {
        Navigator.of(context).pop();
      });
    }
  }

  //업로드 중
  _showLoading() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator.adaptive(
                backgroundColor: Colors.red,
                semanticsValue: "업로드 중",
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '업로드 중',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //업로드 완료
  _showUploaded() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '파일 업로드 결과',
          ),
          content: const Text(
            '업로드가 완료되었습니다.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _pickedImage = '';
                  uploadable = false;
                });
              },
              child: const Text(
                '닫기',
              ),
            ),
          ],
        );
      },
    );
  }
}
