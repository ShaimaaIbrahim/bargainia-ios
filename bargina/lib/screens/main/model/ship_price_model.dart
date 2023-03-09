import 'dart:convert';
/// status : "done"
/// code : 200
/// ship_price : 0
/// price : 2283.75
/// way_cost : 30
/// total : 9165
/// discount : 0

ShipPriceModel shipPriceModelFromJson(String str) => ShipPriceModel.fromJson(json.decode(str));
String shipPriceModelToJson(ShipPriceModel data) => json.encode(data.toJson());
class ShipPriceModel {
  ShipPriceModel({
      dynamic status,
      dynamic code,
      dynamic shipPrice,
      dynamic price,
      dynamic wayCost,
      dynamic total,
      dynamic discount,}){
    _status = status;
    _code = code;
    _shipPrice = shipPrice;
    _price = price;
    _wayCost = wayCost;
    _total = total;
    _discount = discount;
}

  ShipPriceModel.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _shipPrice = json['ship_price'];
    _price = json['price'];
    _wayCost = json['way_cost'];
    _total = json['total'];
    _discount = json['discount'];
  }
  dynamic _status;
  dynamic _code;
  dynamic _shipPrice;
  dynamic _price;
  dynamic _wayCost;
  dynamic _total;
  dynamic _discount;

  dynamic get status => _status;
  dynamic get code => _code;
  dynamic get shipPrice => _shipPrice;
  dynamic get price => _price;
  dynamic get wayCost => _wayCost;
  dynamic get total => _total;
  dynamic get discount => _discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    map['ship_price'] = _shipPrice;
    map['price'] = _price;
    map['way_cost'] = _wayCost;
    map['total'] = _total;
    map['discount'] = _discount;
    return map;
  }

}