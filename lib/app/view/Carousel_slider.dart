import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Imageslider extends StatelessWidget {
  const Imageslider({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      "https://strapi.dhiwise.com/uploads/618fa90c201104b94458e1fb_64fed7e52376fb53adcec634_Flutter_Tootip_Main_Image_ca243cda21.jpg",
      "https://miro.medium.com/v2/resize:fit:1200/1*0SITRH-UNx9GuKhpa3oCUg.png",
      // Add more image URLs as needed
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Set the height of the carousel
        viewportFraction: 0.8, // Set the visible portion of each image
        autoPlay: true, // Enable auto-play
        autoPlayInterval: Duration(seconds: 3), // Set auto-play interval
        autoPlayAnimationDuration:
            Duration(milliseconds: 800), // Animation duration
        autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
        enlargeCenterPage: true, // Enlarge the center image
      ),
      items: imageList.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image:
                      NetworkImage(imageUrl), // Use the imageUrl from the list
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
