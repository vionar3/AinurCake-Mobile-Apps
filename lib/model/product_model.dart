class ProductModel{
  int? id;
  String? images;
  String? name;

  ProductModel({required this.id,required this.images,required this.name});

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(
        id: json['id'],
        images: json['images'],
        name: json['name'],
    );
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> tojson=Map<String,dynamic>();
    tojson['id']=this.id;
    tojson['images']=this.images;
    tojson['name']=this.name;
    return tojson;
  }
}

