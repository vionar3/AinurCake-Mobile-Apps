import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ainurcake/api/api_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();

  @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value) {
  //     loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  bool visibilityOld = false;
  bool visibilityNew = false;

  var oldPass = "";
  var newPass = "";

  final oldPasswordEditingController = TextEditingController();
  final newPasswordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  void dispose() {
    oldPasswordEditingController.dispose();
    newPasswordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }

  Future<void> changePassword() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('user_token');
    var apiService = ApiService();

    var url = Uri.parse('${apiService.baseUrl}/change-password');
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {
        'old_password': oldPasswordEditingController.text,
        'new_password': newPasswordEditingController.text,
        'new_password_confirmation': confirmPasswordEditingController.text,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Password changed successfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Failed to change password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  // final currentUser = FirebaseAuth.instance.currentUser;
  // changePassword() async {
  //   try {
  //     await currentUser!.updatePassword(newPass);
  //     FirebaseAuth.instance.signOut();
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       PageRouteBuilder(
  //           pageBuilder: (context, a, b) => const Check(),
  //           transitionDuration: const Duration(seconds: 0)),
  //       (route) => false,
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text(
  //         "Your Password has been changed. Login Again !",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       backgroundColor: Colors.blue,
  //     ));
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text(
  //         "Your Password has not changed",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       backgroundColor: Colors.blue,
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ainur Cake'),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
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
                    'Pakistan No 1 Bakery',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            ListView(
              children: [
                SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: visibilityOld,
                          decoration: InputDecoration(
                            labelText: 'Old Password',
                            hintText: 'Enter Old Password',
                            labelStyle: const TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(
                                color: Colors.red, fontSize: 15),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibilityOld = !visibilityOld;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye),
                            ),
                          ),
                          controller: oldPasswordEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Old Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: visibilityNew,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            hintText: 'Enter New Password',
                            labelStyle: const TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(
                                color: Colors.red, fontSize: 15),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibilityNew = !visibilityNew;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye),
                            ),
                          ),
                          controller: newPasswordEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter New Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: visibilityOld,
                          decoration: InputDecoration(
                            labelText: 'Confirmation Password',
                            hintText: 'Enter confirmation Password',
                            labelStyle: const TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(
                                color: Colors.red, fontSize: 15),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibilityOld = !visibilityOld;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye),
                            ),
                          ),
                          controller: confirmPasswordEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Old Password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: 200,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          changePassword();
                        }
                      },
                      child: const Text(
                        'Change Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
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
