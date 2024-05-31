import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ainurcake/button/animated_button.dart';
import 'package:ainurcake/helper_widget/custom_card.dart';
// import 'package:ainurcake/map/google_map.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:ainurcake/model/product_model.dart';
import 'package:ainurcake/screen/cake_screen.dart';
// import 'package:cakecraft/screen/checkloginregister.dart';
// import 'package:cakecraft/screen/customizecakes.dart';
import 'package:ainurcake/screen/view_all.dart';
import 'package:ainurcake/slider/slidder.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ainurcake/screen/homepagedrawer.dart';
import 'package:ainurcake/api/api_service.dart';
import 'package:ainurcake/model/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            // await FirebaseAuth.instance.signOut();
                            // exit(0);
                            print("signout");
                          },
                          child: const Text("Yes"),
                          style: ElevatedButton.styleFrom(
                              // primary: Colors.blue.shade500),
                              ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("No",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                            // primary: Colors.white,
                            ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  TextEditingController searchController = TextEditingController();
  List<CartModel> cartdetail = [];
  List<CategoryModel> categories = [];

  // List<ProductModel> prDetail2 = [
  //   ProductModel(id: 1, images: 'images/avall.png', name: 'All'),
  //   ProductModel(id: 2, images: 'images/sig.png', name: 'Signature Cakes'),
  //   ProductModel(id: 3, images: 'images/ice.png', name: 'Ice Cream Cakes'),
  //   ProductModel(
  //       id: 4, images: 'images/all/all3.png', name: 'Fresh Cream Cakes'),
  //   ProductModel(id: 5, images: 'images/teacake/cake3.png', name: 'Tea Cakes'),
  //   ProductModel(id: 6, images: 'images/all/all14.png', name: 'Pastries'),
  //   ProductModel(id: 7, images: 'images/all/all7.png', name: 'Designer Cakes'),
  //   ProductModel(id: 8, images: 'images/almo.png', name: 'Dry Cake'),
  // ];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    // final String baseUrl = "http://192.168.100.50/api";
    var apiService = ApiService();
    final response =
        await http.get(Uri.parse('${apiService.baseUrl}/categories'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        categories =
            jsonResponse.map((data) => CategoryModel.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    //   expensensiontile
    // bottomsheet

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Ainur Cake',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 5, bottom: 5),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0)),
                ),
              ),
            ),
          ),
        ),
        drawer: const HomDrawer(),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      child: Center(
                          child: Text(
                        'How would you like to order?',
                        style: TextStyle(color: Colors.blue[400], fontSize: 15),
                      )),
                    ),
                    // Padding(
                    //     padding: const EdgeInsets.only(
                    //         top: 20, bottom: 10, right: 10),
                    //     child: SizedBox(
                    //       width: 150,
                    //       height: 32,
                    //       child: TextButton.icon(
                    //         style: ButtonStyle(
                    //             shape: MaterialStateProperty.all<
                    //                     RoundedRectangleBorder>(
                    //                 RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           side: const BorderSide(color: Colors.blue),
                    //         ))),
                    //         onPressed: () {
                    //           Navigator.of(context).push(MaterialPageRoute(
                    //               builder: (context) => const GoogleMaps()));
                    //         },
                    //         icon: Image.asset('images/mapicon.jpg'),
                    //         label: const Text('Find Location',
                    //             style: TextStyle(
                    //                 color: Colors.blue, fontSize: 13)),
                    //       ),
                    //     )),
                  ],
                ),
                const CarSlider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Categories cakes'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ViewCake()));
                            },
                            child: const Text('View All'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         child: SizedBox(
                //           height: 375,
                //           child: FutureBuilder<List<ProductModel>>(
                //             future:
                //                 apiService.fetchProductsByCategory(categoryId),
                //             builder: (BuildContext context,
                //                 AsyncSnapshot<List<ProductModel>> snapshot) {
                //               if (snapshot.connectionState ==
                //                   ConnectionState.waiting) {
                //                 return Center(
                //                     child: CircularProgressIndicator());
                //               } else if (snapshot.hasError) {
                //                 return Center(
                //                     child: Text('Error: ${snapshot.error}'));
                //               } else {
                //                 return GridView.builder(
                //                   gridDelegate:
                //                       const SliverGridDelegateWithFixedCrossAxisCount(
                //                     crossAxisCount: 2,
                //                     mainAxisExtent: 180,
                //                   ),
                //                   itemCount: snapshot.data!.length,
                //                   scrollDirection: Axis.horizontal,
                //                   shrinkWrap: true,
                //                   itemBuilder:
                //                       (BuildContext context, int index) {
                //                     return CustomCard(
                //                       cpic: snapshot.data![index].images,
                //                       cname: snapshot.data![index].name,
                //                       onTap: () {
                //                         Navigator.of(context).push(
                //                           MaterialPageRoute(
                //                             builder: (context) => CakeScreen(
                //                               temp: snapshot.data![index].name,
                //                               cartDetail: cartdetail,
                //                             ),
                //                           ),
                //                         );
                //                       },
                //                     );
                //                   },
                //                 );
                //               }
                //             },
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: SizedBox(
                          height: 375,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 180),
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCard(
                                cname: categories[index].name,
                                onTap: () {
                                  int categoryId =
                                      getCake(categories[index].name);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CakeScreen(
                                            categoryId: categoryId,
                                            cartDetail: cartdetail,
                                          )));
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                const MyBlinkingButton(),
                const SizedBox(
                  height: 8,
                ),
                // Center(
                //   child: SizedBox(
                //     height: 50,
                //     width: 320,
                //     child: TextButton(
                //       style: ButtonStyle(
                //         backgroundColor: MaterialStateProperty.all(Colors.blue),
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(10))),
                //       ),
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const CustomCake()));
                //       },
                //       child: const Text(
                //         'Customize Cake',
                //         style: TextStyle(
                //             color: Colors.white, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ],
        )),
      ),
    );
  }

  getCake(String? cakeClick) {
    var select = 0;
    if (cakeClick == 'Kue Basah') {
      select = 1; // Misalnya 1 adalah ID untuk Kue Basah
    } else if (cakeClick == 'Kue Kering') {
      select = 2; // Misalnya 2 adalah ID untuk Kue Kering
    } else if (cakeClick == 'Kue Tart') {
      select = 3; // Misalnya 3 adalah ID untuk Kue Tart
    }
    return select;
  }

  // getCake(String? cakeClick) {
  //   var select = "";
  //   if (cakeClick == 'All') {
  //     select = "All";
  //   } else if (cakeClick == 'Signature Cakes') {
  //     select = "Signature Cakes";
  //   } else if (cakeClick == 'Ice Cream Cakes') {
  //     select = "Ice Cream Cakes";
  //   } else if (cakeClick == 'Fresh Cream Cakes') {
  //     select = "Fresh Cream Cakes";
  //   } else if (cakeClick == 'Signature') {
  //     select = "Signature";
  //   } else if (cakeClick == 'Tea Cakes') {
  //     select = 'Tea Cakes';
  //   } else if (cakeClick == 'Pastries') {
  //     select = "Pastries";
  //   } else if (cakeClick == 'Designer Cakes') {
  //     select = "Designer Cake";
  //   } else {
  //     select = "Dry Cake";
  //   }
  //   return select;
  // }
}
