import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: () {
              print('Shopping Cart is clicked');
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search is clicked');
            },
            icon: const Icon(
              Icons.search,
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
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/p2.jpg',
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/p3.jpg',
                  ),
                ),
              ],
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
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                print("Home was clicked");
              },
              trailing: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
