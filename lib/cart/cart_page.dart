import 'package:ainurcake/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:ainurcake/screen/order_now.dart';

class Carts extends StatefulWidget {
  final List<CartModel> cartDetail;

  Carts({required this.cartDetail});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  void _updateQuantity(int index, int quantity) {
    setState(() {
      widget.cartDetail[index].quantity = quantity;
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.cartDetail.removeAt(index);
    });
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
                    subtitle: Text("Rp " + allPrice().toString()),
                  ),
                ),
              ],
            ),
            Expanded(
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  // Navigate to the order now page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OrderNow(cartDetail: widget.cartDetail),
                  ));
                },
                child: const Text(
                  'Order Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                color: Colors.blue,
              ),
            ),
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
                // leading: Image.asset(widget.cartDetail[index].image!),
                title: Text(widget.cartDetail[index].name!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rp " + widget.cartDetail[index].price.toString()),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (widget.cartDetail[index].quantity > 1) {
                              _updateQuantity(
                                  index, widget.cartDetail[index].quantity - 1);
                            }
                          },
                        ),
                        Text(widget.cartDetail[index].quantity.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _updateQuantity(
                                index, widget.cartDetail[index].quantity + 1);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int allPrice() {
    int total = 0;
    for (var item in widget.cartDetail) {
      total += item.price! * item.quantity;
    }
    return total;
  }
}
