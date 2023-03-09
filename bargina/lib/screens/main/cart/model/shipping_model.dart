import 'dart:convert';
/// name : "جي تي اكسبريس"
/// id : 2
/// logo : null
/// describe : "سيتم توصيل الشحنة الخاصة بك من خلال شركة ارامكس في غضون ٣  أيام"

ShippingModel shippingModelFromJson(String str) => ShippingModel.fromJson(json.decode(str));
String shippingModelToJson(ShippingModel data) => json.encode(data.toJson());
class ShippingModel {
  ShippingModel({
      String? name, 
      int? id, 
      dynamic logo, 
      String? describe,}){
    _name = name;
    _id = id;
    _logo = logo;
    _describe = describe;
}

  ShippingModel.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _logo = json['logo'];
    _describe = json['describe'];
  }
  String? _name;
  int? _id;
  dynamic _logo;
  String? _describe;

  String? get name => _name;
  int? get id => _id;
  dynamic get logo => _logo;
  String? get describe => _describe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['logo'] = _logo;
    map['describe'] = _describe;
    return map;
  }

}