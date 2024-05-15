import 'package:ainurcake/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderNow extends StatefulWidget {
  final cartDetail;
  OrderNow({this.cartDetail});

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  int gvalue = 1;
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
        height: 60,
        color: Colors.white,
        child: Expanded(
            child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: const Text(
            'Proceed',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          color: Colors.blue,
        )),
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
                              //fontWeight: FontWeight.bold
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
                          }),
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
                          }),
                      const Text(
                          '   Instant Shipping (Pak-Only)\n   (Duration:1 Days)'),
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
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                          'Fast Shipping (Pak-Only)\n(Duration:2-3 Business Days)'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
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
                        leading: Image.asset(widget.cartDetail[index].image),
                        title: Text(widget.cartDetail[index].name),
                        subtitle: Text(
                            "Rs " + widget.cartDetail[index].price.toString()),
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
                    // Expanded(
                    //   child: ListTile(
                    //     title: Text("Shipping Fee"),
                    //     subtitle: Text("Rs 200" + shippingPrice().toString()),
                    //   ),
                    // ),
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

  allPrice() {
    int? num = 100;
    for (int i = 0; i < widget.cartDetail.length; i++) {
      num = num! + widget.cartDetail[i].price as int;
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
}
