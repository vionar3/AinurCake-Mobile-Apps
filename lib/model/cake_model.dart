class CakeModel{
  int? id;
  String? image;
  String? name;
  int? price;
  CakeModel({required this.id,required this.image,required this.name,required this.price});

  factory CakeModel.fromJson(Map<String,dynamic>json){
    return CakeModel(id: json['id'], image: json['image'], name: json['name'], price: json['price']);
  }

  Map<String,dynamic>toJson(){
    final Map<String,dynamic> tojson=Map<String,dynamic>();
    tojson['id']=this.id;
    tojson['image']=this.image;
    tojson['name']=this.name;
    tojson['price']=this.price;
    return tojson;
  }
}