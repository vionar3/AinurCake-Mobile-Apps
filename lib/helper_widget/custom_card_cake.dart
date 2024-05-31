import 'package:flutter/material.dart';

class CustomCardCake extends StatefulWidget {
  final String? pic;
  final String? name;
  final int? price;
  final Function()? onTap;

  CustomCardCake({this.pic = '', this.name = '', this.price, this.onTap});
  // CustomCardCake({this.name = '', this.price, this.onTap});
  @override
  State<CustomCardCake> createState() => _CustomCardCakeState();
}

class _CustomCardCakeState extends State<CustomCardCake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2.0,
                blurRadius: 3.0,
              )
            ],
            color: Colors.white, // Set the background color to white
          ),
          child: Column(
            children: [
              Container(
                height: 90,
                width: 120,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20.0),
                //   image: DecorationImage(
                //     image: AssetImage(widget.pic!),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.blue,
                  height: 1.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      widget.name!,
                      style: TextStyle(
                        color: const Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      'Rp ' + widget.price!.toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 27,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                ),
                child: Center(
                  child: Text(
                    'Order Now',
                    style: TextStyle(color: Colors.blue, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
