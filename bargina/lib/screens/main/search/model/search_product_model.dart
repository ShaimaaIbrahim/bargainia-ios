/// id : 45
/// title : "iPhone 11 Pro"
/// description : "no description"
/// price : "120"
/// price_discount : 0
/// total : 126
/// image : "https://bargainia.com.sa/storage/uploads/tmpphpxjc2ix.jpg"
/// count_rate : null
/// is_favourite : 0

class SearchProductModel {
  SearchProductModel({
      dynamic id,
      String? title, 
      String? description, 
      String? price,
    dynamic priceDiscount,
    dynamic total,
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

  SearchProductModel.fromJson(dynamic json) {
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
  dynamic _id;
  String? _title;
  String? _description;
  String? _price;
  dynamic _priceDiscount;
  dynamic _total;
  String? _image;
  dynamic _countRate;
  int? _isFavourite;

  dynamic get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get price => _price;
  dynamic get priceDiscount => _priceDiscount;
  dynamic get total => _total;
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