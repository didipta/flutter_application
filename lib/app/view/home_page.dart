import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controller/Post_controller.dart';
import 'package:flutter_application_1/app/view/Carouseltwo_slider.dart';
import 'package:flutter_application_1/app/view/Commonview/Card_widget.dart';
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
    return ListView(
      children: [
        Imageslidertwo(),
        SizedBox(height: 10),
        SizedBox(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withOpacity(0.2), // Shadow color and opacity
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 1), // Offset from the bottom
                ),
              ],
            ),
            child: Row(children: [
              Text(
                "Product",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ]),
          ),
          Container(
              height: 550,
              child: FutureBuilder(
                  future: postcontroller.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('No data available'));
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns in the grid
                          childAspectRatio:
                              0.7, // Adjust as needed for your card aspect ratio
                          crossAxisSpacing: 8.0, // Adjust as needed
                          mainAxisSpacing: 8.0, // Adjust as needed
                        ),
                        itemCount: postcontroller.postdata.length,
                        itemBuilder: (context, index) {
                          return Cardwidget(
                              id: postcontroller.postdata[index]['id']
                                  .toString(),
                              title: postcontroller.postdata[index]['title']
                                  .toString(),
                              body: postcontroller.postdata[index]['body']
                                  .toString(),
                              userId: postcontroller.postdata[index]['userId']
                                  .toString());
                        },
                      );
                    }
                  }))
        ]))
        // FutureBuilder(
        //   future: postcontroller.fetchData(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (!snapshot.hasData) {
        //       return Center(child: Text('No data available'));
        //     } else {
        //       return GridView.builder(
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 3, // Number of columns in the grid
        //           childAspectRatio:
        //               0.7, // Adjust as needed for your card aspect ratio
        //           crossAxisSpacing: 8.0, // Adjust as needed
        //           mainAxisSpacing: 8.0, // Adjust as needed
        //         ),
        //         itemCount: postcontroller.postdata.length,
        //         itemBuilder: (context, index) {
        //           return Cardwidget(
        //               id: postcontroller.postdata[index]['id'].toString(),
        //               title: postcontroller.postdata[index]['title'].toString(),
        //               body: postcontroller.postdata[index]['body'].toString(),
        //               userId:
        //                   postcontroller.postdata[index]['userId'].toString());
        //         },
        //       );
        //     }
        //   },
        // )
      ],
    );
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
