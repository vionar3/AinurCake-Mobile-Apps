import 'package:flutter/material.dart';
import 'package:ainurcake/slider/contactslidder.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ainur Cake'),
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
              const Text('Curahjeru Tengah, Curah Jeru, Kec.Paji, Kabupaten Situbondo, Jawa Timur 68323'),
              SizedBox(
                width: 120,
                height: 32,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GoogleMap()));
                  },
                  child: const Text('Open map', style: TextStyle(color: Colors.blue, fontSize: 13)),
                ),
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
              const Text("088248378452 (Irfan)"),
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

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: Center(
        child: Text(
          'Google Map Placeholder', // Ganti ini dengan widget Google Maps yang sesungguhnya
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
