// import 'package:cakecraft/admin_panel/admin_homepage.dart';
import 'package:ainurcake/screen/forgot_password.dart';
// import 'package:cakecraft/screen/homepage.dart';
import 'package:ainurcake/screen/signup.dart';
import 'package:ainurcake/screen/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  bool passwordVisibility = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      textInputAction: TextInputAction.done,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Cannot be empty';
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
              icon: const Icon(
                Icons.remove_red_eye,
              ))),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              ClipPath(
                clipper: ProsteThirdOrderBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    ThirdOrderBezierCurveSection(
                      p1: const Offset(0, 350),
                      p2: const Offset(0, 520),
                      p3: Offset(MediaQuery.of(context).size.width, 350),
                      p4: Offset(MediaQuery.of(context).size.width, 520),
                    ),
                  ],
                ),
                child: Container(
                  height: 550,
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
                  'Welcome',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 200, left: 20),
                child: Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 470),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: emailField,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33, right: 33),
                      child: passwordField,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.black38),
                                child: Checkbox(
                                    activeColor: Colors.blue.shade600,
                                    value: _isChecked,
                                    onChanged: handleRemeberme)),
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Text("Remember Me",
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontSize: 12,
                                fontFamily: 'Rubic')),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 85),
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const forgotPassword()));
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
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
                          //   signIn(emailController.text, passwordController.text);
                          print("login");
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        },
                        child: const Text(
                          'Log in',
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
                          //backgroundColor: MaterialStateProperty.all(Colors.transparent),
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
                                  builder: (context) => const Signup()));
                        },
                        child: const Text(
                          'Sign up',
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

  Future<String> checkBothUserBasesForTheUser(String uid) async {
    DocumentSnapshot _userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (_userDoc.exists) return 'users';
    DocumentSnapshot _agencyDoc =
        await FirebaseFirestore.instance.collection('agencies').doc(uid).get();
    if (_agencyDoc.exists) {
      return 'agencies';
    } else {
      return 'null';
    }
  }

  // void signIn(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((_userDoc) {
  //       checkBothUserBasesForTheUser(_userDoc.user!.uid).then((result) => {
  //             print(result),
  //             if (result == "users")
  //               {
  //                 print("user loggined"),
  //                 // Navigator.of(context).pushReplacement(
  //                 //     MaterialPageRoute(builder: (context) => const HomePage()))
  //               }
  //             else
  //               {
  //                 print("admin loggined"),
  //                 // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                 //     builder: (context) => const AdminHomePage()))
  //               }
  //           });
  //     }).catchError((e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //             "Invalid Email/Password",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     });
  //   }
  // }

  void handleRemeberme(bool? value) {
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailController.text = _email;
        passwordController.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
