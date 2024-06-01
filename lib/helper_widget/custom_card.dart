import 'package:flutter/material.dart';
import 'package:ainurcake/api/api_service.dart';

class CustomCard extends StatefulWidget {
  final String? cpic;
  final String? cname;
  final Function()? onTap;

  CustomCard({this.cpic, this.cname, this.onTap});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final ApiService _apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: InkWell(
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
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image:
                        NetworkImage("${_apiService.imageurl}${widget.cpic}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.blue,
                  height: 1.5,
                ),
              ),
              Center(
                child: Text(
                  widget.cname!,
                  style: TextStyle(
                      color: const Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
