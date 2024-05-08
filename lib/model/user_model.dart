class UserModel{
  String? uid;
  String? username;
  String? email;
  String? address;
  String? usertype;


  UserModel({this.uid,this.username,this.email,this.address,this.usertype});

  factory UserModel.fromMap(map){
    return UserModel(
        uid: map['uid'],
        username: map['username'],
        email: map['email'],
        address: map['address'],
        usertype: map['usertype']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'address': address,
      'usertype':usertype
    };
  }
}
