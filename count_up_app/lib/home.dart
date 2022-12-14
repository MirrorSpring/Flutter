import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Counter',
          ),
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
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
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        if (count > 0) {
                          count--;
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('????????? ????????? ??? ??? ????????????.'),
                            duration: Duration(milliseconds: 1000),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _showDialog(context);
                      });
                    },
                    child: const Icon(
                      Icons.refresh,
                      size: 40,
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

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //Users must tap the button to make it disappear
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            '?????? ?????????',
          ),
          content: const Text(
            '????????? ????????? ???????????????????',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'No',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                setState(() {
                  count = 0;
                });
              },
              child: const Text(
                'Yes',
              ),
            ),
          ],
        );
      },
    );
  }
}//End
