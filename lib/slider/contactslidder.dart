import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ContactusSlidder extends StatefulWidget {
  const ContactusSlidder({Key? key}) : super(key: key);

  @override
  State<ContactusSlidder> createState() => _ContactusSlidderState();
}

class _ContactusSlidderState extends State<ContactusSlidder> {
  List<String> images =['images/clo.png','images/nmbr.png','images/loc.png'];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          aspectRatio: 16/9,
          autoPlayCurve: Curves.fastOutSlowIn,
          reverse: false,
          enlargeCenterPage: true,

      ),
      items: images.map((item) {
        return Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage('$item'),
                fit: BoxFit.cover,

            ),
          ),
        );
      }).toList(),
    );
  }
}