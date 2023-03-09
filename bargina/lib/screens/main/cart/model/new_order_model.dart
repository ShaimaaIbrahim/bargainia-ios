import 'dart:convert';
/// msg : "Add operation done successfully"
/// status : true
/// order_id : 361

NewOrderModel newOrderModelFromJson(String str) => NewOrderModel.fromJson(json.decode(str));
String newOrderModelToJson(NewOrderModel data) => json.encode(data.toJson());
class NewOrderModel {
  NewOrderModel({
      String? msg, 
      bool? status, 
      int? orderId,}){
    _msg = msg;
    _status = status;
    _orderId = orderId;
}

  NewOrderModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _status = json['status'];
    _orderId = json['order_id'];
  }
  String? _msg;
  bool? _status;
  int? _orderId;

  String? get msg => _msg;
  bool? get status => _status;
  int? get orderId => _orderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    map['status'] = _status;
    map['order_id'] = _orderId;
    return map;
  }

}