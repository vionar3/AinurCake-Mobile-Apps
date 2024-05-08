// import 'package:cakecraft/about/about_us.dart';
// import 'package:cakecraft/feedback/userfeedback.dart';
// import 'package:cakecraft/screen/changepassword.dart';
import 'package:ainurcake/screen/signin.dart';
// import 'package:cakecraft/screen/contact.dart';
// import 'package:cakecraft/screen/user_profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomDrawer extends StatefulWidget {
  const HomDrawer({Key? key}) : super(key: key);

  @override
  State<HomDrawer> createState() => _HomDrawerState();
}

class _HomDrawerState extends State<HomDrawer> {
  @override
  Widget build(BuildContext context) {
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
                    const Text("Do you want to logout?"),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              // await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Signin()));
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

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  SizedBox(
                    child: Image.asset('images/cclogo.png'),
                    height: 100,
                  ),
                  const Text(
                    'Pakistan No 1 Bakkery',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/splash.png'))),
            ),
            // Divider(
            //   color: Colors.blue,
            // ),
            ListTile(
              leading: const Icon(
                Icons.account_circle_rounded,
                color: Colors.blue,
              ),
              title: const Text('Profile'),
              onTap: () {
                print("userprofile");
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const UserProfile()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.cake,
                color: Colors.blue,
              ),
              title: const Text('About us'),
              onTap: () {
                print("aboutus");
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.feedback_rounded,
                color: Colors.blue,
              ),
              title: const Text('Feedback'),
              onTap: () {
                print("userfeedback");
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const UserFeedback()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.password,
                color: Colors.blue,
              ),
              title: const Text('Change Password'),
              onTap: () {
                print("changepassword");
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const ChangePassword()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                color: Colors.blue,
              ),
              title: const Text('Contact us'),
              onTap: () {
                print("contactcus");
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const ContactUs()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              title: const Text('Log Out'),
              onTap: () => showExitPopup(context),
            ),
          ],
        ),
      ),
    );
  }
}
