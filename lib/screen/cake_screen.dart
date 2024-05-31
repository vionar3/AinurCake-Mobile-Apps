import 'package:ainurcake/cake_detail/product_detail.dart';
import 'package:ainurcake/helper_widget/custom_card_cake.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:ainurcake/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:ainurcake/model/product_model.dart';
import 'package:ainurcake/api/api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:badges/badges.dart' as badges;

class CakeScreen extends StatefulWidget {
  final int categoryId;
  final cartDetail;

  CakeScreen({required this.categoryId, this.cartDetail});

  @override
  State<CakeScreen> createState() => _CakeScreenState();
}

class _CakeScreenState extends State<CakeScreen> {
  List<ProductModel> mylist = [];
  final List<CartModel> cart = CartModel.cart();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<List<ProductModel>> fetchProductsByCategory(int categoryId) async {
    // final String baseUrl = "http://192.168.100.50/api";

    var apiService = ApiService();
    final response = await http.get(
        Uri.parse('${apiService.baseUrl}/categories/$categoryId/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void fetchProducts() async {
    try {
      List<ProductModel> products =
          await fetchProductsByCategory(widget.categoryId);
      setState(() {
        mylist = products;
      });
    } catch (e) {
      print('Failed to load products: $e');
    }
  }

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
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop(cart.length);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              child: const Icon(Icons.shopping_cart_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Carts(cartDetail: cart)),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 230),
              scrollDirection: Axis.vertical,
              itemCount: mylist.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CustomCardCake(
                  // pic: mylist[index].image,
                  name: mylist[index].name,
                  price: mylist[index].price,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetail(
                              // pr_picture: mylist[index].image,
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
}
