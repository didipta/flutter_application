import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/Carousel_slider.dart'; // Make sure to import your Imageslider widget
import 'package:flutter_application_1/app/view/Commonview/Photopage.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          height: 250,
          child: Imageslider(), // Replace with your image slider widget
        )),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
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
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Photopage(), // Your product list widget
        ),
      ],
    );
  }
}
