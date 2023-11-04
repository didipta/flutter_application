import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router/app_page.dart';
import 'package:flutter_application_1/app/view/home_page.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 233, 41, 159),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color.fromARGB(255, 233, 41, 159),
          )),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.blue,
      // ),
      // debugShowCheckedModeBanner: false,
      // home: HomeActivity());
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: Apppages.routes,
    );
  }
}

var stringdata;

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  MySnackBar(message, context) {
    var snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Future apicall() async {
  //   http.Response response;
  //   response =
  //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  //   if (response.statusCode == 200) {
  //     stringdata = response.body;
  //   } else {
  //     stringdata = "Error";
  //   }
  // }

  // void initState() {
  //   apicall();
  // }

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
          IconButton(
              onPressed: () {
                MySnackBar("Hello World", context);
              },
              icon: const Icon(Icons.shopping_bag)),
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
              onTap: () {
                MySnackBar("Item 1", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: const Text("Item 2"),
              onTap: () {
                MySnackBar("Item 2", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text("person"),
              onTap: () {
                MySnackBar("Item 3", context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 46, 46, 34),
        onPressed: () {
          MySnackBar("Hello World", context);
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 228, 224, 224),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBar("Home", context);
          } else if (index == 1) {
            MySnackBar("Search", context);
          } else if (index == 2) {
            MySnackBar("Profile", context);
          }
        },
      ),
      body: Homepages(),
    );
  }
}
