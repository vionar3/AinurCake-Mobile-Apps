import 'package:flutter/material.dart';

class CustomCardCake extends StatefulWidget {
  final String? pic;
  final String? name;
  final int? price;
  final Function()? onTap;

   CustomCardCake({this.pic='',this.name='',this.price,this.onTap});
  @override
  State<CustomCardCake> createState() => _CustomCardCakeState();
}

class _CustomCardCakeState extends State<CustomCardCake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: widget.onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              SizedBox(
                height: 125,
                child: Center(child: Image.asset(widget.pic!)),
              ),
              const Divider(
                height: 10,
                color: Colors.blue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10),
                    child: Text(widget.name!,),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10),
                    child: Text('Rs '+widget.price!.toString(),style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 27,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blue
                  )
                ),
                child: const Center(child: Text('Order Now',style: TextStyle(color: Colors.blue,fontSize: 10),))),
            ],
          ),
          elevation: 15,
          shadowColor: Colors.blue,
        ),
      ),
    );
  }

}