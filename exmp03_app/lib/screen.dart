import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Mail',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/1st');
            },
            icon: const Icon(
              Icons.email,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2nd');
            },
            icon: const Icon(
              Icons.email_outlined,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/p1.jpg'),
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('pikapika@pokemon.com'),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.email,
                color: Colors.black,
              ),
              title: const Text('보낸 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/1st');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              title: const Text('받은 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/2nd');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text(
                '보낸 편지함',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2nd');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text(
                '받은 편지함',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
