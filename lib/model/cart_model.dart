class CartModel {
  String? image;
  String? name;
  int? price;
  int quantity; // New attribute

  CartModel({this.image, this.name, this.price, this.quantity = 1});

  static List<CartModel> cart() => [];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      image: json['product_image'],
      name: json['product_name'],
      price: json['prodct_price'],
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> tojson = Map<String, dynamic>();
    tojson['image'] = this.image;
    tojson['name'] = this.name;
    tojson['price'] = this.price;
    tojson['quantity'] = this.quantity;
    return tojson;
  }
}
