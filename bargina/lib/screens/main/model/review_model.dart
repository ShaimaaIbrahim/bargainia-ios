import 'dart:convert';
/// id : 2
/// name : "mariina emad"
/// review : "good good"
/// customer_id : 52
/// customer_first_name : "test2"
/// customer_last_name : "joooo2"
/// product_id : 87
/// rate : 4

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));
String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());
class ReviewModel {
  ReviewModel({
      int? id, 
      String? name, 
      String? review, 
      int? customerId, 
      String? customerFirstName, 
      String? customerLastName, 
      int? productId, 
      int? rate,}){
    _id = id;
    _name = name;
    _review = review;
    _customerId = customerId;
    _customerFirstName = customerFirstName;
    _customerLastName = customerLastName;
    _productId = productId;
    _rate = rate;
}

  ReviewModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _review = json['review'];
    _customerId = json['customer_id'];
    _customerFirstName = json['customer_first_name'];
    _customerLastName = json['customer_last_name'];
    _productId = json['product_id'];
    _rate = json['rate'];
  }
  int? _id;
  String? _name;
  String? _review;
  int? _customerId;
  String? _customerFirstName;
  String? _customerLastName;
  int? _productId;
  int? _rate;

  int? get id => _id;
  String? get name => _name;
  String? get review => _review;
  int? get customerId => _customerId;
  String? get customerFirstName => _customerFirstName;
  String? get customerLastName => _customerLastName;
  int? get productId => _productId;
  int? get rate => _rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['review'] = _review;
    map['customer_id'] = _customerId;
    map['customer_first_name'] = _customerFirstName;
    map['customer_last_name'] = _customerLastName;
    map['product_id'] = _productId;
    map['rate'] = _rate;
    return map;
  }

}