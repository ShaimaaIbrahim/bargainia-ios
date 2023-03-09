import 'dart:convert';
/// name : "دفع فيزا أو ماستر كارد "
/// id : 1
/// logo : "tmpphpyhqpqd.png"
/// way_cost : 0

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));
String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());
class PaymentModel {
  PaymentModel({
      String? name, 
      int? id, 
      String? logo, 
      int? wayCost,}){
    _name = name;
    _id = id;
    _logo = logo;
    _wayCost = wayCost;
}

  PaymentModel.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _logo = json['logo'];
    _wayCost = json['way_cost'];
  }
  String? _name;
  int? _id;
  String? _logo;
  int? _wayCost;

  String? get name => _name;
  int? get id => _id;
  String? get logo => _logo;
  int? get wayCost => _wayCost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['logo'] = _logo;
    map['way_cost'] = _wayCost;
    return map;
  }

}