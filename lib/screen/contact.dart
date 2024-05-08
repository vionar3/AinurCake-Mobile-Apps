// import 'package:cakecraft/map/google_map.dart';
import 'package:ainurcake/slider/contactslidder.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Craft'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const ContactusSlidder(),
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.location_pin,
                color: Colors.blue,
                size: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Superior Gold Campus,Lahore'),
              SizedBox(
                width: 120,
                height: 32,
                // child: TextButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleMaps()));
                //   },
                //     child: const Text('Open map',style: const TextStyle(color: Colors.blue,fontSize: 13)),
                // ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.mobile_friendly_rounded,
                color: Colors.blue,
                size: 38,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("(061) 6543309882"),
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.lock_clock,
                color: Colors.blue,
                size: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Monday - Friday"),
              const Text("9am - 11pm"),
              const SizedBox(
                height: 20,
              ),
              const Text("Saturday - Sunday"),
              const Text("9am - 1am"),
            ],
          ),
        ],
      ),
    );
  }
}
