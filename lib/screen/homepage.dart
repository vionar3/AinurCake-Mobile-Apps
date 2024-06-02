import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ainurcake/button/animated_button.dart';
import 'package:ainurcake/helper_widget/custom_card.dart';
import 'package:ainurcake/model/cart_model.dart';
import 'package:ainurcake/model/category_model.dart';
import 'package:ainurcake/screen/cake_screen.dart';
import 'package:ainurcake/screen/view_all.dart';
import 'package:ainurcake/slider/slidder.dart';
import 'package:ainurcake/screen/homepagedrawer.dart';
import 'package:ainurcake/api/api_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ainurcake/shimmer/card_shimmer_effect.dart';

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
                          print("signout");
                        },
                        child: const Text("Yes"),
                        style: ElevatedButton.styleFrom(),
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
                        style: ElevatedButton.styleFrom(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  TextEditingController searchController = TextEditingController();
  List<CartModel> cartdetail = [];
  List<CategoryModel> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    var apiService = ApiService();
    final response =
        await http.get(Uri.parse('${apiService.baseUrl}/categories'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        categories =
            jsonResponse.map((data) => CategoryModel.fromJson(data)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10),
                        child: Center(
                          child: Text(
                            'How would you like to order?',
                            style: TextStyle(
                                color: Colors.blue[400], fontSize: 15),
                          ),
                        ),
                      ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: SizedBox(
                            height: 375,
                            child: isLoading
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 180),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      // return Shimmer.fromColors(
                                      //   baseColor: Colors.grey[300]!,
                                      //   highlightColor: Colors.grey[100]!,
                                      //   period: Duration(
                                      //       seconds:
                                      //           4), // Durasi shimmer 4 detik
                                      //   child: CustomCardShimmer(),
                                      // );
                                      return CustomCardShimmer();
                                    },
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 180),
                                    itemCount: categories.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomCard(
                                        cpic: categories[index].image,
                                        cname: categories[index].name,
                                        onTap: () {
                                          int categoryId =
                                              getCake(categories[index].name);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CakeScreen(
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
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getCake(String? cakeClick) {
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
}
