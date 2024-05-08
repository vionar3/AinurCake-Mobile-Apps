import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarSlider extends StatefulWidget {
  const CarSlider({Key? key}) : super(key: key);

  @override
  State<CarSlider> createState() => _CarSliderState();
}

class _CarSliderState extends State<CarSlider> {
  List<String> images =['images/car1.jpg','images/car2.jpg','images/car3.jpg','images/car4.jpg','images/car5.jpg'];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
            height: 200,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            reverse: false,
            enlargeCenterPage: true
        ),
      items: images.map((item) {
        return Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage('$item'),
              fit: BoxFit.cover
          ),
          ),
        );
      }).toList(),
    );
  }
}