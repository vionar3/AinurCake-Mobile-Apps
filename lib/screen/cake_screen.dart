import 'dart:core';
import 'package:ainurcake/cake_detail/product_detail.dart';
import 'package:ainurcake/helper_widget/custom_card_cake.dart';
import 'package:ainurcake/model/cake_model.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:flutter/material.dart';

class CakeScreen extends StatefulWidget {
  final String temp;
  final cartDetail;
  CakeScreen({required this.temp, this.cartDetail});
  @override
  State<CakeScreen> createState() => _CakeScreenState();
}

class _CakeScreenState extends State<CakeScreen> {
  List<CakeModel> mylist = [];
  final List<CartModel> cart = CartModel.cart();
  List<CakeModel> All = [
    CakeModel(
        id: 1,
        image: 'images/all/all1.png',
        name: 'Black Forest Cake',
        price: 1000),
    CakeModel(
        id: 2,
        image: 'images/all/all2.png',
        name: 'Two in one Cake',
        price: 1200),
    CakeModel(
        id: 3,
        image: 'images/all/all3.png',
        name: 'Pineapple Cake',
        price: 1000),
    CakeModel(
        id: 4,
        image: 'images/all/all4.png',
        name: 'Real Chocolate Cake',
        price: 1200),
    CakeModel(
        id: 5,
        image: 'images/all/all5.png',
        name: 'Special Black Forest Cake',
        price: 1700),
    CakeModel(
        id: 6,
        image: 'images/all/all6.png',
        name: 'Coffee Chocolate Cake',
        price: 1700),
    CakeModel(
        id: 8,
        image: 'images/all/all7.png',
        name: 'Hulk Face Cake',
        price: 6000),
    CakeModel(
        id: 9, image: 'images/all/all8.png', name: 'Heart Cake', price: 12000),
    CakeModel(
        id: 10,
        image: 'images/all/all9.png',
        name: 'Coconut Cake',
        price: 1500),
    CakeModel(
        id: 11,
        image: 'images/all/all10.png',
        name: 'Barbie Cake',
        price: 10000),
    CakeModel(
        id: 11,
        image: 'images/all/all11.png',
        name: 'Batmen Logo Cake',
        price: 9000),
    CakeModel(
        id: 12,
        image: 'images/all/all12.png',
        name: 'Almond Syrup dry Cake',
        price: 1000),
    CakeModel(
        id: 13,
        image: 'images/all/all13.png',
        name: 'Pineapple Pastry',
        price: 80),
    CakeModel(
        id: 14,
        image: 'images/all/all14.png',
        name: 'Black Forest Pastry',
        price: 80),
    CakeModel(
        id: 15,
        image: 'images/all/all15.png',
        name: 'Unicorn Cake',
        price: 6000),
  ];
  List<CakeModel> IceCreamCake = [
    CakeModel(
        id: 1,
        image: 'images/icecrem/ice1.png',
        name: 'Vanilla Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 2,
        image: 'images/icecrem/ice2.png',
        name: 'Kulfa Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 3,
        image: 'images/icecrem/ice3.png',
        name: 'Chocolate Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 4,
        image: 'images/icecrem/ice4.png',
        name: 'Mango Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 5,
        image: 'images/ice.png',
        name: 'Chocolate Ice Cream Cake',
        price: 1700),
  ];
  List<CakeModel> TeaCakes = [
    CakeModel(
        id: 1,
        image: 'images/teacake/cake1.png',
        name: 'Fruit Slab Cake',
        price: 200),
    CakeModel(
        id: 2,
        image: 'images/teacake/cake2.png',
        name: 'Plain Slab Cake',
        price: 190),
    CakeModel(
        id: 3,
        image: 'images/teacake/cake3.png',
        name: 'Chocolate Slab Cake',
        price: 220),
    CakeModel(
        id: 4,
        image: 'images/teacake/cake4.png',
        name: 'Marble Slab Cake',
        price: 190),
  ];
  List<CakeModel> SignatureCake = [
    CakeModel(
        id: 1,
        image: 'images/s1.png',
        name: 'Death By Chocolate Cake',
        price: 1000),
    CakeModel(
        id: 2,
        image: 'images/s2.png',
        name: 'Double Chocolate Fudge',
        price: 1500),
    CakeModel(
        id: 3, image: 'images/s3.png', name: 'Red Valvet Cake', price: 2000),
    CakeModel(
        id: 3,
        image: 'images/sig.png',
        name: 'Vanilla Chocolate Cake',
        price: 3000),
  ];
  List<CakeModel> FreshCreamCake = [
    CakeModel(
        id: 1,
        image: 'images/all/all1.png',
        name: 'Black Forest Cake',
        price: 1000),
    CakeModel(
        id: 2,
        image: 'images/all/all2.png',
        name: 'Two in one Cake',
        price: 1200),
    CakeModel(
        id: 3,
        image: 'images/all/all3.png',
        name: 'Pineapple Cake',
        price: 1000),
    CakeModel(
        id: 4,
        image: 'images/all/all4.png',
        name: 'Real Chocolate Cake',
        price: 1200),
    CakeModel(
        id: 5,
        image: 'images/all/all5.png',
        name: 'Special Black Forest Cake',
        price: 1700),
    CakeModel(
        id: 6,
        image: 'images/all/all6.png',
        name: 'Coffee Chocolate Cake',
        price: 1700),
    CakeModel(
        id: 7, image: 'images/all/all9.png', name: 'Coconut Cake', price: 1500),
  ];
  List<CakeModel> Pastries = [
    CakeModel(
        id: 13,
        image: 'images/all/all13.png',
        name: 'Pineapple Pastry',
        price: 80),
    CakeModel(
        id: 14,
        image: 'images/all/all14.png',
        name: 'Black Forest Pastry',
        price: 80),
  ];
  List<CakeModel> Designer = [
    CakeModel(
        id: 1,
        image: 'images/all/all10.png',
        name: 'Barbie Cake',
        price: 10000),
    CakeModel(
        id: 2,
        image: 'images/all/all11.png',
        name: 'Batmen Logo Cake',
        price: 9000),
    CakeModel(
        id: 3,
        image: 'images/all/all15.png',
        name: 'Unicorn Cake',
        price: 6000),
    CakeModel(
        id: 4,
        image: 'images/all/all7.png',
        name: 'Hulk Face Cake',
        price: 6000),
    CakeModel(
        id: 5, image: 'images/all/all8.png', name: 'Heart Cake', price: 12000),
  ];
  List<CakeModel> DryCake = [
    CakeModel(
        id: 1,
        image: 'images/all/all12.png',
        name: 'Almond Syrup Dry Cake',
        price: 1000),
    CakeModel(
        id: 2, image: 'images/almo.png', name: 'Almond Dry Cake', price: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Craft'),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop(cart.length);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 230),
              scrollDirection: Axis.vertical,
              itemCount: gettlistlength(),
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CustomCardCake(
                  pic: mylist[index].image,
                  name: mylist[index].name,
                  price: mylist[index].price,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetail(
                              pr_picture: mylist[index].image,
                              pr_name: mylist[index].name,
                              price: mylist[index].price,
                              cartdetail: cart,
                            )));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  gettlistlength() {
    if (widget.temp == "All") {
      mylist = All;
    } else if (widget.temp == "Signature Cakes") {
      mylist = SignatureCake;
    } else if (widget.temp == "Ice Cream Cakes") {
      mylist = IceCreamCake;
    } else if (widget.temp == "Fresh Cream Cakes") {
      mylist = FreshCreamCake;
    } else if (widget.temp == "Signature") {
      mylist = SignatureCake;
    } else if (widget.temp == "Tea Cakes") {
      mylist = TeaCakes;
    } else if (widget.temp == "Pastries") {
      mylist = Pastries;
    } else if (widget.temp == "Designer Cake") {
      mylist = Designer;
    } else {
      mylist = DryCake;
    }
    return mylist.length;
  }
}
