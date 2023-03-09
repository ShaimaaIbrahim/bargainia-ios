/// id : 331
/// title : "apple 11"
/// description : null
/// price : "1"
/// price_discount : 100
/// total : 1.1
/// image : "https://phplaravel-425085-2297893.cloudwaysapps.com/storage/uploads"
/// count_rate : null
/// is_favourite : 0

class FilterModel {
  FilterModel({
      int? id, 
      String? title, 
      dynamic description, 
      String? price, 
      int? priceDiscount, 
      double? total, 
      String? image, 
      dynamic countRate, 
      int? isFavourite,}){
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _priceDiscount = priceDiscount;
    _total = total;
    _image = image;
    _countRate = countRate;
    _isFavourite = isFavourite;
}

  FilterModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _priceDiscount = json['price_discount'];
    _total = json['total'];
    _image = json['image'];
    _countRate = json['count_rate'];
    _isFavourite = json['is_favourite'];
  }
  int? _id;
  String? _title;
  dynamic _description;
  String? _price;
  int? _priceDiscount;
  double? _total;
  String? _image;
  dynamic _countRate;
  int? _isFavourite;

  int? get id => _id;
  String? get title => _title;
  dynamic get description => _description;
  String? get price => _price;
  int? get priceDiscount => _priceDiscount;
  double? get total => _total;
  String? get image => _image;
  dynamic get countRate => _countRate;
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
    map['is_favourite'] = _isFavourite;
    return map;
  }

}