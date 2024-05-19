import 'package:ainurcake/model/user_model.dart';
import 'package:ainurcake/screen/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:email_validator/email_validator.dart';

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
  bool cnpasswordVisibility = true;
  bool passwordVisibility = true;
  final _formkey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
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
          return 'Password must be 6 digit';
        } else if (passwordController.text != confirmPasswordController.text) {
          return 'Password do not match';
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
              icon: const Icon(Icons.remove_red_eye))),
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
          return 'Password must be 6 digit';
        } else if (passwordController.text != confirmPasswordController.text) {
          return 'Password do not match';
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
              icon: const Icon(Icons.remove_red_eye))),
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
                          fit: BoxFit.cover)),
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
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 150, left: 20),
                child: Text(
                  'Create',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 200, left: 20),
                child: Text(
                  'Account',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          print("daftar");
                          // signup(emailController.text, passwordController.text);
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        )),
                        Text(
                          "or",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          indent: 3,
                          endIndent: 38,
                        ))
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
                                side: const BorderSide(color: Colors.grey)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Signin()));
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void signup(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => {postDetailsToFirestore()});
  //   }
  // }

  // postDetailsToFirestore() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;

  //   UserModel userModel = UserModel();

  //   userModel.usertype = "users";
  //   userModel.username = nameController.text;
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   userModel.address = addresController.text;

  //   await firebaseFirestore
  //       .collection("users")
  //       .doc(user.uid)
  //       .set(userModel.toMap());
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const Signin()),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text(
  //       "Registered Successfully",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     backgroundColor: Colors.blue,
  //   ));
  // }
}
