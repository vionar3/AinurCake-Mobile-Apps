class UserModel {
  int? uid;
  String? username;
  String? email;
  String? address;
  String? phone;

  UserModel({this.uid, this.username, this.email, this.address, this.phone});

  // Named constructor to create an instance from a map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['users_id'],
      username: json['users_username'],
      email: json['users_email'],
      address: json['users_address'],
      phone: json['users_mobile'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'users_id': uid,
      'users_username': username,
      'users_email': email,
      'users_address': address,
      'users_mobile': phone,
    };
  }
}
