import 'dart:convert';
/// store_transfer : 0
/// store_avliable : 24266.18248835802
/// transfers : [{"id":25,"amount":"100","total_amount":"681.6","remain_amount":"581.6","bank_name":"asd asd asd","account_number":"213131231232","full_name_third":"test test tesr","street":null,"created":"2020-11-02 10:55:46","status":"pending","image":"https://bargainia.com.sa/storage/uploads/tmpphp7sct7f.jfif"},{"id":25,"amount":"100","total_amount":"681.6","remain_amount":"581.6","bank_name":"asd asd asd","account_number":"213131231232","full_name_third":"test test tesr","street":null,"created":"2020-11-02 10:55:46","status":"pending","image":"https://bargainia.com.sa/storage/uploads/tmpphp7sct7f.jfif"}]
/// sell_all : 25543.349987745285
/// bargina : 1277.1674993872643
/// seller : 24266.18248835802

TransferModel transferModelFromJson(String str) => TransferModel.fromJson(json.decode(str));
String transferModelToJson(TransferModel data) => json.encode(data.toJson());
class TransferModel {
  TransferModel({
      dynamic storeTransfer,
      dynamic storeAvliable,
      List<Transfers>? transfers, 
      dynamic sellAll,
      dynamic bargina,
      dynamic seller,}){
    _storeTransfer = storeTransfer;
    _storeAvliable = storeAvliable;
    _transfers = transfers;
    _sellAll = sellAll;
    _bargina = bargina;
    _seller = seller;
}

  TransferModel.fromJson(dynamic json) {
    _storeTransfer = json['store_transfer'];
    _storeAvliable = json['store_avliable'];
    if (json['transfers'] != null) {
      _transfers = [];
      json['transfers'].forEach((v) {
        _transfers?.add(Transfers.fromJson(v));
      });
    }
    _sellAll = json['sell_all'];
    _bargina = json['bargina'];
    _seller = json['seller'];
  }
  dynamic _storeTransfer;
  dynamic _storeAvliable;
  List<Transfers>? _transfers;
  dynamic _sellAll;
  dynamic _bargina;
  dynamic _seller;

  dynamic get storeTransfer => _storeTransfer;
  dynamic get storeAvliable => _storeAvliable;
  List<Transfers>? get transfers => _transfers;
  dynamic get sellAll => _sellAll;
  dynamic get bargina => _bargina;
  dynamic get seller => _seller;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['store_transfer'] = _storeTransfer;
    map['store_avliable'] = _storeAvliable;
    if (_transfers != null) {
      map['transfers'] = _transfers?.map((v) => v.toJson()).toList();
    }
    map['sell_all'] = _sellAll;
    map['bargina'] = _bargina;
    map['seller'] = _seller;
    return map;
  }

}

/// id : 25
/// amount : "100"
/// total_amount : "681.6"
/// remain_amount : "581.6"
/// bank_name : "asd asd asd"
/// account_number : "213131231232"
/// full_name_third : "test test tesr"
/// street : null
/// created : "2020-11-02 10:55:46"
/// status : "pending"
/// image : "https://bargainia.com.sa/storage/uploads/tmpphp7sct7f.jfif"

Transfers transfersFromJson(String str) => Transfers.fromJson(json.decode(str));
String transfersToJson(Transfers data) => json.encode(data.toJson());
class Transfers {
  Transfers({
      int? id, 
      String? amount, 
      String? totalAmount, 
      String? remainAmount, 
      String? bankName, 
      String? accountNumber, 
      String? fullNameThird, 
      dynamic street, 
      String? created, 
      String? status, 
      String? image,}){
    _id = id;
    _amount = amount;
    _totalAmount = totalAmount;
    _remainAmount = remainAmount;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _fullNameThird = fullNameThird;
    _street = street;
    _created = created;
    _status = status;
    _image = image;
}

  Transfers.fromJson(dynamic json) {
    _id = json['id'];
    _amount = json['amount'];
    _totalAmount = json['total_amount'];
    _remainAmount = json['remain_amount'];
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
    _fullNameThird = json['full_name_third'];
    _street = json['street'];
    _created = json['created'];
    _status = json['status'];
    _image = json['image'];
  }
  int? _id;
  String? _amount;
  String? _totalAmount;
  String? _remainAmount;
  String? _bankName;
  String? _accountNumber;
  String? _fullNameThird;
  dynamic _street;
  String? _created;
  String? _status;
  String? _image;

  int? get id => _id;
  String? get amount => _amount;
  String? get totalAmount => _totalAmount;
  String? get remainAmount => _remainAmount;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get fullNameThird => _fullNameThird;
  dynamic get street => _street;
  String? get created => _created;
  String? get status => _status;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['amount'] = _amount;
    map['total_amount'] = _totalAmount;
    map['remain_amount'] = _remainAmount;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['full_name_third'] = _fullNameThird;
    map['street'] = _street;
    map['created'] = _created;
    map['status'] = _status;
    map['image'] = _image;
    return map;
  }

}