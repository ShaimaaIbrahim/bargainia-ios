/// id : 45
/// title : "iPhone 11 Pro"
/// description : "no description"
/// price : "120"
/// price_discount : 0
/// total : 126
/// image : "https://bargainia.com.sa/storage/uploads/tmpphpxjc2ix.jpg"
/// count_rate : 0
/// is_favourite : 0

class ProductsModel {
  ProductsModel({
      dynamic id,
      dynamic title,
      dynamic description,
      dynamic price,
      dynamic priceDiscount,
      dynamic total,
      dynamic image,
      dynamic countRate,
      dynamic older,
      dynamic isFavourite,}){
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _priceDiscount = priceDiscount;
    _total = total;
    _image = image;
    _countRate = countRate;
    _older= older;
    _isFavourite = isFavourite;
}

  ProductsModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _priceDiscount = json['price_discount'];
    _total = json['total'];
    _image = json['image'];
    _older = json['older'];
    _countRate = json['count_rate'];
    _isFavourite = json['is_favourite'];
  }
  dynamic _id;
  dynamic _title;
  dynamic _description;
  dynamic _price;
  dynamic _priceDiscount;
  dynamic _total;
  dynamic _image;
  dynamic _countRate;
  dynamic _older;
  dynamic _isFavourite;

  dynamic get id => _id;
  dynamic get title => _title;
  dynamic get description => _description;
  dynamic get price => _price;
  dynamic get priceDiscount => _priceDiscount;
  dynamic get total => _total;
  dynamic get image => _image;
  dynamic get countRate => _countRate;
  dynamic get older => _older;
  dynamic get isFavourite => _isFavourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['price_discount'] = _priceDiscount;
    map['total'] = _total;
    map['image'] = _image;
    map['older'] = _older;
    map['count_rate'] = _countRate;
    map['is_favourite'] = _isFavourite;
    return map;
  }

}