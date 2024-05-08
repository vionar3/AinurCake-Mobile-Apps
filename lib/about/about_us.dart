import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Craft'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: const BorderSide(
                                          color: Colors.blue, width: 2)),
                                ),
                              ),
                              onPressed: () async {
                                launch('tel:03097745300');
                              },
                              child: const Icon(
                                Icons.call,
                                color: Colors.blue,
                                size: 30,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue, width: 2),
                              color: Colors.white),
                          child: Image.asset(
                            'images/cclogo.png',
                            height: 105,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: const BorderSide(
                                          color: Colors.blue, width: 2)),
                                ),
                              ),
                              onPressed: () {
                                launch('smsto:03097745300');
                              },
                              child: const Icon(
                                Icons.message,
                                color: Colors.blue,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Rating',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text('Since',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        Text('Version',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 52),
                          child: Text('2021',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 105),
                          child: Text('1.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    height: 5,
                    thickness: 1,
                    color: Colors.blue,
                  ),
                  const Text('About Us',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25)),
                  const Divider(
                    height: 5,
                    thickness: 1,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12),
                          color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 5, left: 7, right: 7),
                        child: Text(
                          'A cake craft is an establishment that produces and sells flour-based food baked in an oven such as bread, cookies, cakes, donuts, pastries, and pies. Some retail bakeries are also categorized as cafés, serving coffee and tea to customers who wish to consume the baked goods on the premises. In general, there are three major stages in the baking process: expansion of the dough, drying of the surface, and crust browning. The bakery will appeal to all households and residents. The bakery will appeal to all households and residents. Whether someone is working class, a business executive, a teacher, or a student.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(height: 1.7, letterSpacing: 0.8),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
