import 'dart:async';
import 'dart:convert';

import 'package:exmp_22/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //**********

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late int i;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    i = 0;
    Timer.periodic(
        const Duration(
          seconds: 2,
        ), (Timer timer) {
      setState(() {
        if (i == data.length - 1) {
          i = 0;
        } else {
          i++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Movie'),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '최신 영화',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                data[i]['image'],
                              ),
                            ),
                            Text(
                              data[i]['title'],
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Detail(
                                                title: data[i]['title'],
                                                image: data[i]['image']);
                                          },
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      '상세보기',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //--
                                    },
                                    child: const Text(
                                      '예매하기',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '인기 영화',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    data.isEmpty
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 500,
                            child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return cardBuild(context, index);
                              },
                            ),
                          ),
                  ],
                ),
        ),
      ),
    );
  }

  //Functions//
  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response =
        await http.get(url); //실행하고 나서 response로 반환하는 것을 build가 구성될 때까지 대기
    //print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result); //리스트에 전부 넣기
    });
    return true;
  }

  Widget cardBuild(BuildContext context, int index) {
    return Card(
      color: index % 2 == 0 ? Colors.white : Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                data[index]['image'],
              ),
            ),
            Text(
              data[index]['title'],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Detail(
                                title: data[index]['title'],
                                image: data[index]['image']);
                          },
                        ),
                      );
                    },
                    child: const Text(
                      '상세보기',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //--
                    },
                    child: const Text(
                      '예매하기',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
