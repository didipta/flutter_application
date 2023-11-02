import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controller/Post_controller.dart';
import 'package:flutter_application_1/app/view/Postdetails.dart';
import 'package:flutter_application_1/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model.dart';

class Homepages extends StatefulWidget {
  const Homepages({Key? key}) : super(key: key);
  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  // List<postdata> postdate = [];
  final Postcontroller postcontroller = Get.put(Postcontroller());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postcontroller.fetchData(),
        builder: (context, sanpshot) {
          if (sanpshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: postcontroller.postdata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 194, 75, 75),
                    textColor: const Color.fromARGB(255, 240, 237, 237),
                    contentPadding: EdgeInsets.all(10),
                    leading: Icon(Icons.person),
                    title: Container(
                      padding: EdgeInsets.all(2), // Adjust padding as needed
                      child: Text(
                        postcontroller.postdata[index]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    subtitle: Text(postcontroller.postdata[index]['body']),
                    trailing: Icon(Icons.delete),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Postdetails(
                                  id: postcontroller.postdata[index]['id']
                                      .toString())))
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  // Future<List<postdata>> getdata() async {
  //   final response =
  //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  //   var stringdata = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> item in stringdata) {
  //       postdate.add(postdata.fromJson(item));
  //     }
  //     return postdate;
  //   } else {
  //     return [];
  //   }
  // }
}
