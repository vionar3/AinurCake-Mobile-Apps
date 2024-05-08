class CartModel{
  String? image;
  String? name;
  int? price;

  CartModel({this.image,this.name,this.price});


  static List<CartModel> cart()=>[];

  factory CartModel.fromJson(Map<String,dynamic>json){
    return CartModel(
      image: json['image'],
      name: json['name'],
      price: json['price']
    );
  }

  Map<String,dynamic>toJson(){
    final Map<String,dynamic> tojson=Map<String,dynamic>();
    tojson['image']=this.image;
    tojson['name']=this.name;
    tojson['price']=this.price;
    return tojson;
  }
}
