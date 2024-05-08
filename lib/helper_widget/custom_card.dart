import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String? cpic;
  final String? cname;
  final Function()? onTap;

  CustomCard({this.cpic,this.cname,this.onTap});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 100,
      child: InkWell(
        onTap: widget.onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.white,
                child: Center(child: Image.asset(widget.cpic!)),
              ),
              const Divider(
                height: 10,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(widget.cname!,style: const TextStyle(fontSize: 12),),
              ),
            ],
          ),
          elevation: 2,
          shadowColor: Colors.blue,
        ),
      ),
    );
  }
}