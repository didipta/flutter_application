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
              crossAxisCount: 3, // Number of columns in the grid
              childAspectRatio:
                  0.7, // Adjust as needed for your card aspect ratio
              crossAxisSpacing: 8.0, // Adjust as needed
              mainAxisSpacing: 8.0, // Adjust as needed
            ),
            itemCount: photocontroller.photolist.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      photocontroller.photolist[index]['url'],
                      height: 100,
                      width: 100,
                    ),
                    Text(photocontroller.photolist[index]['title']),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
