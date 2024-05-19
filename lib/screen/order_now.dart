import 'package:ainurcake/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ainurcake/model/cart_model.dart';

class OrderNow extends StatefulWidget {
  final List<CartModel> cartDetail;

  OrderNow({required this.cartDetail});

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  int gvalue = 1;
  UserModel loggedInUser = UserModel();

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
        height: 60,
        color: Colors.white,
        child: Expanded(
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              // Implement order saving functionality here
            },
            child: const Text(
              'Proceed',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                color: Colors.blue.shade600, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "${loggedInUser.address}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Shipping Method',
                          style: TextStyle(
                              color: Colors.blue.shade600, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: gvalue,
                        onChanged: (value) {
                          setState(() {
                            gvalue = value as int;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                          'Standard Shipping (Pak-Only)\n(Duration:3-5 Business Days)'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 2,
                        groupValue: gvalue,
                        onChanged: (value) {
                          setState(() {
                            gvalue = value as int;
                          });
                        },
                      ),
                      const Text(
                          '   Instant Shipping (Pak-Only)\n   (Duration:1 Day)'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 3,
                        groupValue: gvalue,
                        onChanged: (value) {
                          setState(() {
                            gvalue = value as int;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                          'Fast Shipping (Pak-Only)\n(Duration:2-3 Business Days)'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Order Detail',
                    style: TextStyle(color: Colors.blue.shade600, fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
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
                        leading: Image.asset(widget.cartDetail[index].image!),
                        title: Text(widget.cartDetail[index].name!),
                        subtitle: Text("Rs " +
                            widget.cartDetail[index].price.toString() +
                            " x " +
                            widget.cartDetail[index].quantity.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: SizedBox(
                height: 320,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: TextStyle(
                                color: Colors.blue.shade600, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Item Count"),
                        subtitle: Text(allItemCount().toString()),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Item Price"),
                        subtitle: Text("Rs " + allItem().toString()),
                      ),
                    ),
                    const Expanded(
                      child: ListTile(
                        title: Text("Tax"),
                        subtitle: Text("Rs 100"),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Total Price"),
                        subtitle: Text("Rs " + allPrice().toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int allPrice() {
    int total = 100; // Fixed tax
    for (var item in widget.cartDetail) {
      total += item.price! * item.quantity;
    }
    return total;
  }

  int allItem() {
    int total = 0;
    for (var item in widget.cartDetail) {
      total += item.price! * item.quantity;
    }
    return total;
  }

  int allItemCount() {
    int totalCount = 0;
    for (var item in widget.cartDetail) {
      totalCount += item.quantity;
    }
    return totalCount;
  }
}
