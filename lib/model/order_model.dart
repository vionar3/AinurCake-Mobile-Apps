import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{
  String? username;
  String? cakename;
  String? cakeprice;
  String? cakepic;
  String? location;
  String? totalprice;
  String? date;

  OrderModel({this.username,this.cakename,this.cakeprice,this.cakepic,this.location,this.totalprice,this.date});

  factory OrderModel.fromMap(map){
    return OrderModel(
        username: map['username'],
        cakename: map["cakename"],
        cakeprice: map["cakeprice"],
        cakepic: map["cakepic"],
        location: map["userlocation"],
        totalprice: map["totalprice"],
        date: map['date']
    );
  }

  OrderModel.fromDocumentSnapshot(DocumentSnapshot jsonMap) {
    try {
      username = jsonMap.get('username') != null ? jsonMap.get('username').toString() : '';
      cakename = jsonMap.get('cakename') != null ? jsonMap.get('cakename').toString() : 'abc';
      cakeprice = jsonMap.get('cakeprice') != null ? jsonMap.get('cakeprice').toString() : '';
      cakepic = jsonMap.get('cakepic') != null ? jsonMap.get('cakepic').toString() : '';
      location = jsonMap.get('userlocation') != null ? jsonMap.get('userlocation').toString() : '';
      totalprice = jsonMap.get('totalprice') != null ? jsonMap.get('totalprice').toString() : '';
      date = jsonMap.get('date') != null ? jsonMap.get('date').toString() : '';
    } catch (e) {
      print('exception');
      print(e);
   username = '';
   cakename = '';
   cakeprice = '';
    }
  }
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'cakename': cakename,
      'cakeprice': cakeprice,
      'cakepic': cakepic,
      'userlocation':location,
      'totalprice':totalprice,
      'date':date
    };
  }
}