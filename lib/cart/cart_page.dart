import 'package:ainurcake/model/cake_model.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:ainurcake/model/order_model.dart';
import 'package:ainurcake/model/product_model.dart';
import 'package:ainurcake/model/user_model.dart';
import 'package:ainurcake/screen/homepage.dart';
import 'package:ainurcake/screen/order_now.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  final cartDetail;

  Carts({this.cartDetail});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cake Craft'),
        ),
        bottomNavigationBar: Container(
          height: 130,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Total Price"),
                      subtitle: Text("Rs " + allPrice().toString()),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderNow(cartDetail: widget.cartDetail,)));
                  saveDetailToFireStore();
                },
                child: const Text(
                  'Order Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                color: Colors.blue,
              ))
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: widget.cartDetail.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 100,
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Image.asset(widget.cartDetail[index].image),
                  title: Text(widget.cartDetail[index].name),
                  subtitle:
                      Text("Rs " + widget.cartDetail[index].price.toString()),
                ),
              ),
            );
          },
        ));
  }

  allPrice() {
    int? num = 0;
    for (int i = 0; i < widget.cartDetail.length; i++) {
      num = num! + widget.cartDetail[i].price as int;
    }
    return num;
  }

  cakePrice() {
    int? num = 0;
    for (int i = 0; i < widget.cartDetail.length; i++) {
      num + widget.cartDetail[i].price as int;
    }
    return num;
  }

  allItem() {
    int num = 0;
    for (int i = 0; i < widget.cartDetail.length; i++) {
      num += widget.cartDetail[i].price as int;
    }
    return num;
  }

  allItemCount() {
    int val1 = 0;
    int val2 = widget.cartDetail.length;
    int sum = val1 + val2;
    return sum;
  }

  saveDetailToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<OrderModel> orders = [];
    print('widget.cartDetail');
    print(widget.cartDetail);

    for (int i = 0; i < widget.cartDetail.length; i++) {
      orders.add(
        OrderModel(
            cakename: widget.cartDetail[i].name,
            cakepic: widget.cartDetail[i].image,
            totalprice: allPrice().toString(),
            cakeprice: widget.cartDetail[i].price.toString(),
            username: loggedInUser.username.toString(),
            location: loggedInUser.address.toString(),
            date: DateTime.now().toString()),
      );
    }
    print(orders);

    await firebaseFirestore.collection("orders").add({
      'order': orders.map((e) => e.toMap()).toList(),
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Order Successfully",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    ));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
