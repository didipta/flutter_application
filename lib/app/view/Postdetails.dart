import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controller/Post_controller.dart';
import 'package:get/get.dart';

class Postdetails extends StatefulWidget {
  final String id;

  const Postdetails({Key? key, required this.id}) : super(key: key);

  @override
  State<Postdetails> createState() => _PostdetailsState();
}

class _PostdetailsState extends State<Postdetails> {
  final Postcontroller postcontroller = Get.put(Postcontroller());
  var postdetails;
  @override
  void initState() {
    super.initState();
    // Fetch the data asynchronously
    _fetchPostData();
  }

  _fetchPostData() async {
    try {
      postdetails = await postcontroller.getpostdata(widget.id);
    } catch (error) {
      // Handle errors here
      print("Error fetching data: $error");
    }
    // Notify the widget that the data has changed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: postdetails == null
          ? Center(child: CircularProgressIndicator())
          : _buildPostDetails(),
      // body: Container(
      //     child: Column(
      //   children: [
      //     Text(
      //       postdetails['title'],
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20,
      //       ),
      //     ),
      //     Text(postdetails['body']),
      //   ],
      // )),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Text(
      //         postcontroller.postdetails['title'],
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //       Text(postcontroller.postdetails['body']),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildPostDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZym-0DTwrWfHnoXNTw0pESZOadoFYyP0VtA&usqp=CAU', // Replace with the URL of your image
              fit: BoxFit.cover,
              width: double
                  .infinity, // To make the image fill the width of the card
              // You can adjust the image fit as needed
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postdetails['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    postdetails['body'],
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
