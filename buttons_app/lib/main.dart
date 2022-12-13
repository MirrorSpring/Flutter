import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key}); //constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //눌렀을 때
              },
              onLongPress: () {
                //길게 눌렀을 때
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.green[600],
              ),
              child: const Text('Text Button',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), //20이 최대, 음이 아닌 수
                ),
              ),
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(
                      color: Colors.green,
                      width: 3.0,
                    )),
                child: const Text('Outlined Button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.green,
                ),
                label: const Text('Go Home'),
                style: TextButton.styleFrom(foregroundColor: Colors.green)),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: const Text(
                  "Go Home",
                ),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black)),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: const Text(
                  'Go Home',
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                )),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  "Home",
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(100, 40))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      minimumSize: const Size(100, 30)),
                  child: const Text('TextButton'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 30)),
                  child: const Text('ElevatedButton'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
