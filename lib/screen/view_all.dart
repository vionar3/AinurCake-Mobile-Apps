import 'dart:core';
import 'package:ainurcake/cake_detail/product_detail.dart';
import 'package:ainurcake/cart/cart_page.dart';
import 'package:ainurcake/helper_widget/custom_card_cake.dart';
import 'package:ainurcake/model/cake_model.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:flutter/material.dart';

class ViewCake extends StatefulWidget {
  const ViewCake({Key? key}) : super(key: key);

  @override
  State<ViewCake> createState() => _CakeScreenState();
}

class _CakeScreenState extends State<ViewCake> {
  TextEditingController searchController = TextEditingController();
  List<CartModel> cartdetail = [];

  List<CakeModel> allCakes = [
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
    CakeModel(
        id: 16,
        image: 'images/icecrem/ice1.png',
        name: 'Vanilla Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 17,
        image: 'images/icecrem/ice2.png',
        name: 'Kulfa Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 18,
        image: 'images/icecrem/ice3.png',
        name: 'Chocolate Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 19,
        image: 'images/icecrem/ice4.png',
        name: 'Mango Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 20,
        image: 'images/ice.png',
        name: 'Chocolate Ice Cream Cake',
        price: 1700),
    CakeModel(
        id: 21,
        image: 'images/teacake/cake1.png',
        name: 'Fruit Slab Cake',
        price: 200),
    CakeModel(
        id: 22,
        image: 'images/teacake/cake2.png',
        name: 'Plain Slab Cake',
        price: 190),
    CakeModel(
        id: 23,
        image: 'images/teacake/cake3.png',
        name: 'Chocolate Slab Cake',
        price: 220),
    CakeModel(
        id: 24,
        image: 'images/teacake/cake4.png',
        name: 'Marble Slab Cake',
        price: 190),
    CakeModel(
        id: 25,
        image: 'images/all/all10.png',
        name: 'Barbie Cake',
        price: 10000),
    CakeModel(
        id: 26,
        image: 'images/all/all11.png',
        name: 'Batmen Logo Cake',
        price: 9000),
    CakeModel(
        id: 27,
        image: 'images/all/all15.png',
        name: 'Unicorn Cake',
        price: 6000),
    CakeModel(
        id: 28,
        image: 'images/all/all7.png',
        name: 'Hulk Face Cake',
        price: 6000),
    CakeModel(
        id: 29, image: 'images/all/all8.png', name: 'Heart Cake', price: 12000),
    CakeModel(
        id: 30,
        image: 'images/all/all13.png',
        name: 'Pineapple Pastry',
        price: 80),
    CakeModel(
        id: 31,
        image: 'images/all/all14.png',
        name: 'Black Forest Pastry',
        price: 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Ainur Cake',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              child: const Icon(Icons.shopping_cart_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Carts(cartDetail: cartdetail)),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 230),
          scrollDirection: Axis.vertical,
          itemCount: allCakes.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return CustomCardCake(
              pic: allCakes[index].image,
              name: allCakes[index].name,
              price: allCakes[index].price,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      pr_picture: allCakes[index].image,
                      pr_name: allCakes[index].name,
                      price: allCakes[index].price,
                      cartdetail: cartdetail,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
