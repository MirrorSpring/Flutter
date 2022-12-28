import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kakao',
        ),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: const Icon(
          Icons.file_download,
        ),
      ),
    );
  }

  //Functions

  Future<String> getJSONData() async{
    var url=Uri.parse('https://dapi.kakao.com/v3/search/book?target=title&query=알고리즘');
    var response=await http.get(url, headers: {"Authorization": "8689c9fd2faa06f7a594aac654243905"}); //키
    print(response.body);

    return "success";
  }
}