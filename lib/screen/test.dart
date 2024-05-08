import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _databaseRef = FirebaseDatabase.instance.ref();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
            child: Column(
              children: [
                _buildImage(context),
                _buildFormFields(),
                _buildSendButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return FutureBuilder(
      future: _getImage(context, "deal.png"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 1.2,
            child: snapshot.data as Widget,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onSaved: (value) {
            _nameController.text = value!;
          },
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.alternate_email),
            hintText: 'cakecraft123@gmail.com',
            border: UnderlineInputBorder(),
          ),
        ),
        TextFormField(
          controller: _priceController,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onSaved: (value) {
            _priceController.text = value!;
          },
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.alternate_email),
            hintText: 'cakecraft123@gmail.com',
            border: UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSendButton() {
    return TextButton(
      onPressed: () {
        _insertData(_nameController.text, _priceController.text);
      },
      child: const Text('Send'),
    );
  }

  void _insertData(String name, String price) {
    final key = _databaseRef.child("Users").push().key;
    _databaseRef
        .child("Users")
        .push()
        .set({"id": key, "name": name, "price": price});
  }

  Future<Widget> _getImage(BuildContext context, String imgName) async {
    late Image image;
    await FireStorageService.loadImage(context, imgName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }
}

class FireStorageService with ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
