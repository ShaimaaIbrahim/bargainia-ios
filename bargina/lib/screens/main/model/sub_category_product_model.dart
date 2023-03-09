import 'dart:convert';
/// id : 46
/// title : null
/// description : "no description"
/// price : "120"
/// price_discount : null
/// total : 126
/// image : "https://bargainia.com.sa/storage/uploads/tmpphpusllt5.jpg"
/// count_rate : 0
/// is_favourite : 0

SubCategoryProductModel subCategoryProductModelFromJson(String str) => SubCategoryProductModel.fromJson(json.decode(str));
String subCategoryProductModelToJson(SubCategoryProductModel data) => json.encode(data.toJson());
class SubCategoryProductModel {
  SubCategoryProductModel({
      int? id, 
      dynamic title, 
      String? description, 
      String? price, 
      dynamic priceDiscount, 
      dynamic total,
      String? image, 
      dynamic countRate,
      dynamic older,
      int? isFavourite,}){
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _priceDiscount = priceDiscount;
    _total = total;
    _image = image;
    _older = older;
    _countRate = countRate;
    _isFavourite = isFavourite;
}

  SubCategoryProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _priceDiscount = json['price_discount'];
    _total = json['total'];
    _image = json['image'];
    _countRate = json['count_rate'];
    _older = json['older'];
    _isFavourite = json['is_favourite'];
  }
  int? _id;
  dynamic _title;
  String? _description;
  String? _price;
  dynamic _priceDiscount;
  dynamic _total;
  String? _image;
  dynamic _countRate;
  dynamic _older;
  int? _isFavourite;

  int? get id => _id;
  dynamic get title => _title;
  String? get description => _description;
  String? get price => _price;
  dynamic get priceDiscount => _priceDiscount;
  dynamic get total => _total;
  String? get image => _image;
  dynamic get countRate => _countRate;
  dynamic get older => _older;
  int? get isFavourite => _isFavourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['price_discount'] = _priceDiscount;
    map['total'] = _total;
    map['image'] = _image;
    map['count_rate'] = _countRate;
    map['older'] =_older;
    map['is_favourite'] = _isFavourite;
    return map;
  }

}