import 'dart:convert';
import 'package:ainurcake/cake_detail/product_detail.dart';
import 'package:ainurcake/cart/cart_page.dart';
import 'package:ainurcake/helper_widget/custom_card_cake.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:ainurcake/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ainurcake/api/api_service.dart';
import 'package:http/http.dart' as http;

class ViewCake extends StatefulWidget {
  const ViewCake({Key? key}) : super(key: key);

  @override
  State<ViewCake> createState() => _CakeScreenState();
}

class _CakeScreenState extends State<ViewCake> {
  TextEditingController searchController = TextEditingController();
  List<CartModel> cartdetail = [];
  List<ProductModel> allCakes = [];

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    var apiService = ApiService();
    // final String baseUrl = "http://192.168.100.50/api";
    final response = await http.get(Uri.parse('${apiService.baseUrl}/product'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        allCakes =
            jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load products');
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
              // pic: allCakes[index].image,
              name: allCakes[index].name,
              price: allCakes[index].price,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      // pr_picture: allCakes[index].image,
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
