import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ainurcake/model/user_model.dart';
import 'package:ainurcake/screen/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ainurcake/api/api_service.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool cnpasswordVisibility = true;
  bool passwordVisibility = true;
  final _formkey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  final String baseUrl = ApiService().baseUrl;

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      controller: nameController,
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        nameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Username Cannot be empty';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.person),
        hintText: 'Ainur Cake',
        border: UnderlineInputBorder(),
      ),
    );

    final addressField = TextFormField(
      controller: addresController,
      autofocus: false,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        addresController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Address Cannot be empty';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: 'Address',
        prefixIcon: Icon(Icons.home),
        border: UnderlineInputBorder(),
      ),
    );

    final emailField = TextFormField(
      controller: emailController,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) =>
          EmailValidator.validate(value!) ? null : "Please enter a valid email",
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.alternate_email),
        hintText: 'cakecraft123@gmail.com',
        border: UnderlineInputBorder(),
      ),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: passwordVisibility,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.send,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Cannot be empty';
        } else if (value.length < 6) {
          return 'Password must be 6 digits';
        } else if (passwordController.text != confirmPasswordController.text) {
          return 'Password does not match';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.vpn_key_sharp),
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisibility = !passwordVisibility;
            });
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      controller: confirmPasswordController,
      autofocus: false,
      obscureText: cnpasswordVisibility,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Confirm Password Cannot be empty';
        } else if (value.length < 6) {
          return 'Password must be 6 digits';
        } else if (passwordController.text != confirmPasswordController.text) {
          return 'Password does not match';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: const Icon(Icons.vpn_key_sharp),
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              cnpasswordVisibility = !cnpasswordVisibility;
            });
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
      ),
    );

    final phoneField = TextFormField(
      controller: phoneController,
      autofocus: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        phoneController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone number cannot be empty';
        } else if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
          return 'Enter a valid phone number';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: Icon(Icons.phone),
        border: UnderlineInputBorder(),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              ClipPath(
                clipper: ProsteThirdOrderBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    ThirdOrderBezierCurveSection(
                      p1: const Offset(0, 350),
                      p2: const Offset(0, 500),
                      p3: Offset(MediaQuery.of(context).size.width, 350),
                      p4: Offset(MediaQuery.of(context).size.width, 500),
                    ),
                  ],
                ),
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/splash.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 150, left: 20),
                child: Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 200, left: 20),
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 420),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: nameField,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: addressField,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: emailField,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: passwordField,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: confirmPasswordField,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: phoneField,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 320,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          signup(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            addresController.text,
                            phoneController.text,
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            indent: 38,
                            endIndent: 3,
                          ),
                        ),
                        Text(
                          "or",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            indent: 3,
                            endIndent: 38,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
                      width: 320,
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Signin(),
                            ),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signup(String username, String email, String password, String address,
      String phone) async {
    if (_formkey.currentState!.validate()) {
      try {
        var response = await http.post(
          Uri.parse('$baseUrl/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'users_username': username,
            'users_email': email,
            'users_password': password,
            'users_address': address,
            'users_mobile': phone,
          }),
        );

        if (response.statusCode == 201) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Signin()),
          );

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Registered Successfully",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Failed to register: ${jsonDecode(response.body)['message']}",
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Error: $e",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
