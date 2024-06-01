import 'package:ainurcake/cart/cart_page.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:ainurcake/screen/order_now.dart';
import 'package:flutter/material.dart';
import 'package:ainurcake/api/api_service.dart';

class ProductDetail extends StatefulWidget {
  final pr_picture;
  final pr_name;
  final price;
  final cartdetail;

  ProductDetail({this.pr_picture, this.pr_name, this.price, this.cartdetail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final ApiService _apiService = ApiService();
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
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(
                  "${_apiService.imageurl}${widget.pr_picture}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.pr_name!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs " + widget.price!.toString(),
                        style: TextStyle(
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Product Detail ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: Text(
                    "Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies.",
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: TextButton(
                          onPressed: () {
                            widget.cartdetail.add(CartModel(
                                image: widget.pr_picture,
                                name: widget.pr_name,
                                price: widget.price));
                            // print("carddetail");
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Carts(cartDetail: widget.cartdetail)));
                          },
                          child: const Center(
                              child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
                            onPressed: () {
                              widget.cartdetail.add(CartModel(
                                  image: widget.pr_picture,
                                  name: widget.pr_name,
                                  price: widget.price));
                              // print("cardetail");
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => OrderNow(
                                          cartDetail: widget.cartdetail)));
                            },
                            child: const Text(
                              'Order Now',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
