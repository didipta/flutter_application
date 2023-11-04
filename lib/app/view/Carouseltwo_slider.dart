import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Imageslidertwo extends StatefulWidget {
  const Imageslidertwo({super.key});

  @override
  State<Imageslidertwo> createState() => _ImageslidertwoState();
}

class _ImageslidertwoState extends State<Imageslidertwo> {
  final CarouselController carouselController = CarouselController();
  int currntIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      "https://strapi.dhiwise.com/uploads/618fa90c201104b94458e1fb_64fed7e52376fb53adcec634_Flutter_Tootip_Main_Image_ca243cda21.jpg",
      "https://miro.medium.com/v2/resize:fit:1200/1*0SITRH-UNx9GuKhpa3oCUg.png",
      // Add more image URLs as needed
    ];

    return Stack(
      children: [
        InkWell(
            onTap: () {
              carouselController.nextPage();
            },
            child: CarouselSlider(
                items: imageList
                    .map((e) => Image.network(
                          e,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 3,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currntIndex = index;
                    });
                  },
                )
                // carouselController: carouselController,
                )),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currntIndex == entry.key ? 17 : 7,
                    height: 7,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currntIndex == entry.key
                          ? const Color.fromARGB(255, 41, 54, 65)
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList()),
        )
      ],
    );
  }
}
