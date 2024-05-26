import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ainurcake/model/user_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserModel loggedInUser = UserModel();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');
    if (token != null) {
      var url = Uri.parse('http://192.168.100.46/api/user');
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          loggedInUser = UserModel.fromJson(jsonResponse);
          isLoading = false;
        });

        print("data masuk");
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Failed to fetch user data",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
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
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: GlobalKey<FormState>(),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'images/splash.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              child: Image.asset('images/cclogo.png'),
                              height: 180,
                            ),
                            const Text(
                              'Pakistan No 1 Bakkery',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              shadowColor: Colors.black87,
                              color: Colors.blue.shade500,
                              margin: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    const Text(
                                      '  Username:  ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${loggedInUser.username}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 10,
                              color: Colors.blue.shade300,
                              margin: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    const Text(
                                      '  Email:  ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${loggedInUser.email}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Colors.blue.shade100,
                              elevation: 10,
                              margin: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    const Text(
                                      '   Address:  ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
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
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Colors.blue.shade100,
                              elevation: 10,
                              margin: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    const Text(
                                      '   Phone:  ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      "${loggedInUser.phone}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
