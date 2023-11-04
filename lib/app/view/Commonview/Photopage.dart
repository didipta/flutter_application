import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controller/photo_controller.dart';

import 'package:get/get.dart';

class Photopage extends StatelessWidget {
  Photopage({super.key});

  final Photocontroller photocontroller = Get.put(Photocontroller());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: photocontroller.fetchdata(),
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
              crossAxisCount: 4, // Number of columns in the grid
              childAspectRatio:
                  0.7, // Adjust as needed for your card aspect ratio
              crossAxisSpacing: 3, // Adjust as needed
              mainAxisSpacing: 5, // Adjust as needed
            ),
            itemCount: photocontroller.photolist.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(2),
                child: Card(
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2017/07/18/23/23/user-2517433_640.png",
                          height: 50,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 32,
                          child: Text(
                            photocontroller.photolist[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
