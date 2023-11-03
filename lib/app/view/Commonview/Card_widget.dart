import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/Postdetails.dart';

class Cardwidget extends StatelessWidget {
  final String id;
  final String title;
  final String body;
  final String userId;
  final String urlimg =
      "https://www.wikihow.com/images/thumb/b/b7/Make-a-Beautiful-Handmade-Card-in-Ten-Minutes-Step-18-Version-2.jpg/v4-1200px-Make-a-Beautiful-Handmade-Card-in-Ten-Minutes-Step-18-Version-2.jpg";

  const Cardwidget(
      {Key? key,
      required this.id,
      required this.title,
      required this.body,
      required this.userId})
      : super(key: key);

  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12), // Adjust the radius as needed

  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.5), // Shadow color
  //           spreadRadius: 2, // Spread radius
  //           blurRadius: 5, // Blur radius
  //           offset: Offset(0, 2), // Offset
  //         ),
  //       ],
  //     ),
  //     child: Card(
  //       child: ListTile(
  //         tileColor: Color.fromARGB(255, 249, 247, 247),
  //         textColor: Color.fromARGB(255, 47, 45, 45),
  //         contentPadding: EdgeInsets.all(10),
  //         leading: Icon(Icons.person),
  //         title: Container(
  //           padding: EdgeInsets.all(2), // Adjust padding as needed
  //           child: Text(
  //             title,
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //             ),
  //           ),
  //         ),
  //         subtitle: Text(
  //           body,
  //           overflow: TextOverflow.ellipsis,
  //           maxLines: 3,
  //         ),
  //         trailing: Icon(Icons.delete),
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => Postdetails(
  //                 id: id,
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                urlimg,
                width: double.infinity,
                height: 150, // Adjust the image height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  body,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'User ID: $userId',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
