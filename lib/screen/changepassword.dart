import 'package:ainurcake/model/user_model.dart';
// import 'package:cakecraft/screen/checkloginregister.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  //   FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((
  //       value) {
  //     loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  bool visibility = false;

  var newpass = "";
  final newPasswordEditingController = TextEditingController();

  @override
  void dispose() {
    newPasswordEditingController.dispose();
    super.dispose();
  }

  // final currentUser=FirebaseAuth.instance.currentUser;
  // changePassword() async{
  //   try{
  //     await currentUser!.updatePassword(newpass);
  //     FirebaseAuth.instance.signOut();
  //     Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (context, a,b) => const Check(),
  //         transitionDuration:const Duration(seconds: 0)), (route) => false);
  //     ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text("Your Password has been changed. Login Again !",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue, ) );
  //   }catch(e){
  //     ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text("Your Password has not changed",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue, ) );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ainur Cake'),
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
                    'Pakistan No 1 Bakkery',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 310),
                    child: TextFormField(
                      obscureText: visibility,
                      decoration: InputDecoration(
                          labelText: 'Change Password',
                          hintText: 'Enter New Password',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          errorStyle:
                              const TextStyle(color: Colors.red, fontSize: 15),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          )),
                      controller: newPasswordEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email';
                        } else if (value == '@') {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
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
                                    borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            newpass = newPasswordEditingController.text;
                          });
                        }
                        print("password di ubah");
                        // changePassword();
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
