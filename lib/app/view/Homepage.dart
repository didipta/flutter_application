import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/Home_page.dart';
import 'package:flutter_application_1/app/view/Photopage.dart';
import 'package:flutter_application_1/app/view/Postdetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Initially, the Home screen is selected.

  // Define a list of screens or widgets that will be displayed based on the selected index.
  final List<Widget> _screens = [Homepages(), Photopage()];

  // Callback function to handle the item selection in the bottom navigation bar.
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "First App",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 2,
        toolbarHeight: 50,
        toolbarOpacity: 0.9,
        elevation: 5,
        shadowColor: Color.fromRGBO(226, 226, 226, 0.253),
        backgroundColor: Color.fromARGB(255, 233, 188, 41),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              child: DrawerHeader(
                padding: EdgeInsets.zero,

                child: Image.network(
                  'https://static-00.iconduck.com/assets.00/flutter-plain-icon-1655x2048-tm6fsmjb.png',
                ),
                // child: UserAccountsDrawerHeader(

                //   decoration: BoxDecoration(

                //     color: Color.fromARGB(255, 233, 188, 41),
                //   ),
                //   accountName: Text("Rahul"),
                //   accountEmail: Text("rahul@gmail.com"),
                //   currentAccountPicture: Image.network(
                //       "https://static-00.iconduck.com/assets.00/flutter-plain-icon-1655x2048-tm6fsmjb.png"),
                // ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text("Item 1"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: const Text("Item 2"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text("person"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
