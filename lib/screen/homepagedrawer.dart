import 'package:ainurcake/about/about_us.dart';
import 'package:ainurcake/feedback/userfeedback.dart';
import 'package:ainurcake/screen/changepassword.dart';
import 'package:ainurcake/screen/signin.dart';
import 'package:ainurcake/screen/contact.dart';
import 'package:ainurcake/screen/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ainurcake/api/api_service.dart';

class HomDrawer extends StatefulWidget {
  const HomDrawer({Key? key}) : super(key: key);

  @override
  State<HomDrawer> createState() => _HomDrawerState();
}

class _HomDrawerState extends State<HomDrawer> {
  Future<bool> showExitPopup(BuildContext context) async {
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
                              await logout(); // Perform the logout operation
                              Navigator.of(context)
                                  .pop(true); // Return true to indicate logout
                            },
                            child: const Text("Yes"),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(
                                  false); // Return false to indicate no logout
                            },
                            child: const Text("No",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false; // Ensure false is returned if the dialog is dismissed without selection
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');
    var apiService = ApiService();
    if (token != null) {
      var url = Uri.parse('${apiService.baseUrl}/logout');
      try {
        var response = await http.post(
          url,
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200) {
          await prefs.remove('user_token');
          print('Logged out successfully');
        } else {
          print('Failed to log out: ${response.body}');
        }
      } catch (e) {
        print('Error logging out: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset('images/logo22.png'),
                    height: 100,
                  ),
                  const Text(
                    'Pakistan No 1 Bakery',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.white70,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/splash.png'),
                ),
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.account_circle_rounded, color: Colors.blue),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserProfile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cake, color: Colors.blue),
              title: const Text('About us'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback_rounded, color: Colors.blue),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserFeedback()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.password, color: Colors.blue),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePassword()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.call, color: Colors.blue),
              title: const Text('Contact us'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ContactUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.blue),
              title: const Text('Log Out'),
              onTap: () async {
                bool shouldLogout = await showExitPopup(context);
                if (shouldLogout) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Signin()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
