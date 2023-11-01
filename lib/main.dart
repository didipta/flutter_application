import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeActivity());
  }
}

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
      drawer: const Drawer(
        child: Text("Hello World"),
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
      body: const Text(
        "Hello World",
      ),
    );
  }
}
