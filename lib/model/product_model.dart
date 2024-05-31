// class ProductModel{
//   int? id;
//   String? images;
//   String? name;

//   ProductModel({required this.id,required this.images,required this.name});

//   factory ProductModel.fromJson(Map<String,dynamic>json){
//     return ProductModel(
//         id: json['id'],
//         images: json['images'],
//         name: json['name'],
//     );
//   }
//   Map<String,dynamic>toJson(){
//     final Map<String,dynamic> tojson=Map<String,dynamic>();
//     tojson['id']=this.id;
//     tojson['images']=this.images;
//     tojson['name']=this.name;
//     return tojson;
//   }
// }

class ProductModel {
  int? id;
  String? name;
  int? categoryId;
  String? image;
  int? price;
  String? unit;
  String? description;

  ProductModel({
    this.id,
    this.categoryId,
    this.name,
    this.image,
    this.price,
    this.unit,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['product_id'] is String
          ? int.parse(json['product_id'])
          : json['product_id'],
      name: json['product_name'],
      categoryId: json['product_category'] is String
          ? int.parse(json['product_category'])
          : json['product_category'],
      image: json['product_image'],
      price: json['product_price'] is String
          ? int.parse(json['product_price'])
          : json['product_price'],
      unit: json['unit'],
      description: json['product_description'],
    );
  }
}
