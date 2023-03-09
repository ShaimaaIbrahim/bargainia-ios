import 'dart:convert';
/// result : {"code":"000.200.100","description":"successfully created checkout"}
/// buildNumber : "8854a5c81bde316486906c37de7e1bd18297382d@2022-05-13 13:55:50 +0000"
/// timestamp : "2022-05-14 13:57:49+0000"
/// ndc : "F2FC8341B80DCA3162C73B9EDEA007E9.uat01-vm-tx03"
/// id : "F2FC8341B80DCA3162C73B9EDEA007E9.uat01-vm-tx03"

CheckoutidModel checkoutidModelFromJson(String str) => CheckoutidModel.fromJson(json.decode(str));
String checkoutidModelToJson(CheckoutidModel data) => json.encode(data.toJson());
class CheckoutidModel {
  CheckoutidModel({
     // Result? result,
      dynamic buildNumber,
      dynamic timestamp,
      dynamic ndc,
      dynamic id,}){
   // _result = result;
    _buildNumber = buildNumber;
    _timestamp = timestamp;
    _ndc = ndc;
    _id = id;
}

  CheckoutidModel.fromJson(dynamic json) {
  //  _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _buildNumber = json['buildNumber'];
    _timestamp = json['timestamp'];
    _ndc = json['ndc'];
    _id = json['id'];
  }
 // Result? _result;
  dynamic _buildNumber;
  dynamic _timestamp;
  dynamic _ndc;
  dynamic _id;

  //Result? get result => _result;
  dynamic get buildNumber => _buildNumber;
  dynamic get timestamp => _timestamp;
  dynamic get ndc => _ndc;
  dynamic get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // if (_result != null) {
    //   map['result'] = _result?.toJson();
    // }
    map['buildNumber'] = _buildNumber;
    map['timestamp'] = _timestamp;
    map['ndc'] = _ndc;
    map['id'] = _id;
    return map;
  }

}

/// code : "000.200.100"
/// description : "successfully created checkout"

// Result resultFromJson(String str) => Result.fromJson(json.decode(str));
// String resultToJson(Result data) => json.encode(data.toJson());
// class Result {
//   Result({
//       dynamic code,
//       dynamic description,}){
//     _code = code;
//     _description = description;
// }
//
//   Result.fromJson(dynamic json) {
//     _code = json['code'];
//     _description = json['description'];
//   }
//   dynamic _code;
//   dynamic _description;
//
//   dynamic get code => _code;
//   dynamic get description => _description;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['code'] = _code;
//     map['description'] = _description;
//     return map;
//   }
//
// }