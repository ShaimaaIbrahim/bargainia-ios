/// code : 9809
/// user : {"email":"phone1@yahoo.com","first_name":"test","last_name":"test","phone":"010132481828","code":9809,"updated_at":"2021-12-18 16:35:31","created_at":"2021-12-18 16:35:31","id":183}

class RegisterModel {
  RegisterModel({
      int? code, 
      User? user,}){
    _code = code;
    _user = user;
}

  RegisterModel.fromJson(dynamic json) {
    _code = json['code'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? _code;
  User? _user;

  int? get code => _code;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// email : "phone1@yahoo.com"
/// first_name : "test"
/// last_name : "test"
/// phone : "010132481828"
/// code : 9809
/// updated_at : "2021-12-18 16:35:31"
/// created_at : "2021-12-18 16:35:31"
/// id : 183

class User {
  User({
      String? email, 
      String? firstName, 
      String? lastName, 
      String? phone, 
      int? code, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _code = code;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  User.fromJson(dynamic json) {
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _code = json['code'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _phone;
  int? _code;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  int? get code => _code;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['code'] = _code;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}