/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImZiM2FmMzU4YWY2Y2ZmOWQzMTU5NWRjZjNiMGZlNTJmOGI2NWMxYzQ5MjIyMmVhMjc3NzdjMTI0MDhkY2RiMWM3ODJmZDJlZDQ3MTg1NTMxIn0.eyJhdWQiOiIxIiwianRpIjoiZmIzYWYzNThhZjZjZmY5ZDMxNTk1ZGNmM2IwZmU1MmY4YjY1YzFjNDkyMjIyZWEyNzc3N2MxMjQwOGRjZGIxYzc4MmZkMmVkNDcxODU1MzEiLCJpYXQiOjE2Mzk5NDgyODIsIm5iZiI6MTYzOTk0ODI4MiwiZXhwIjoxNjcxNDg0MjgyLCJzdWIiOiIxOTAiLCJzY29wZXMiOltdfQ.oU9Hv5fgCNfjT1VjGCSUNLwtWhL5KVguIYhmjwiLGJWjE-dsC-Z935PqImJ5TCBrryp8_KleVgI4mLLZpNNDOMVFL47UqM3IarTMKR_SrF6wlAnS0aaJNTUh2eMx42oM10FDDj17U5_YIbHp1QThNpY0UlWJNdFhSoaVjQH4ro5L3lX3Yml1jL_1FuYqBq-yMTYVJL9gND_r2Os8PlMyWR0pUieA0vAxmmfW-_FALSoIfnroYXTYRwl2wRfAP5dkAdAGKSahdMwYlz8Dsep_uDpJBKjjJZhvcNt6Q3XR7e_SxjtymY89C7iKbrlkRHQ7p1P2DIVdvx1N--bi0CQ4NzEdhP7ANP9jRX_OQ8mYot6TAxeMw79tUkUJqkNuH8vWg8HpfX9ungfYayKL_PBjGxFgxdCYms43FRW4goHFFWtugTFcp_XCMfT3kO9X1Y1qtmHR8h95W05LzzQYAdKZlGE4U8IiaR2_G57QyE_H5u-ldH59faqnxo4hNiPICr0XR53DPCTADOirKq-2w_nalGHNPVx9KY1x7kPU0WwSUHM5vRplNKooVYMuniEc1BeeYjXOgKFxR-KHqMo2U6JwuNu-LuqO24pmblO6fJ0IfcfH_s7TVe17k07FyVk9p8LWp-OK909Az5nOatcff-mlv3sA0eJCyX4MM-HluKJ4ftc"
/// user : {"id":190,"first_name":"test","last_name":"test","email":"phone12@yahoo.com","phone":"01013248181","fax":null,"profile_id":null,"provide_name":null,"type":0,"newsletter":0,"offer":0,"status":0,"code":"7059","_token":null,"created_at":"2021-12-19 21:06:10","updated_at":"2021-12-19 21:06:10","deleted_at":null}

 class LoginModel {
  LoginModel({
      String? token, 
      UserLogin? user,}){
    _token = token;
    _user = user;
}

  LoginModel.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? UserLogin.fromJson(json['user']) : null;
  }
  String? _token;
  UserLogin? _user;

  String? get token => _token;
  UserLogin? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 190
/// first_name : "test"
/// last_name : "test"
/// email : "phone12@yahoo.com"
/// phone : "01013248181"
/// fax : null
/// profile_id : null
/// provide_name : null
/// type : 0
/// newsletter : 0
/// offer : 0
/// status : 0
/// code : "7059"
/// _token : null
/// created_at : "2021-12-19 21:06:10"
/// updated_at : "2021-12-19 21:06:10"
/// deleted_at : null

 class UserLogin {
  UserLogin({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      dynamic fax, 
      dynamic profileId, 
      dynamic provideName, 
      int? type, 
      int? newsletter, 
      int? offer, 
      int? status, 
      String? code, 
      dynamic token, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _fax = fax;
    _profileId = profileId;
    _provideName = provideName;
    _type = type;
    _newsletter = newsletter;
    _offer = offer;
    _status = status;
    _code = code;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  UserLogin.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _fax = json['fax'];
    _profileId = json['profile_id'];
    _provideName = json['provide_name'];
    _type = json['type'];
    _newsletter = json['newsletter'];
    _offer = json['offer'];
    _status = json['status'];
    _code = json['code'];
    _token = json['_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  dynamic _fax;
  dynamic _profileId;
  dynamic _provideName;
  int? _type;
  int? _newsletter;
  int? _offer;
  int? _status;
  String? _code;
  dynamic _token;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get fax => _fax;
  dynamic get profileId => _profileId;
  dynamic get provideName => _provideName;
  int? get type => _type;
  int? get newsletter => _newsletter;
  int? get offer => _offer;
  int? get status => _status;
  String? get code => _code;
  dynamic get token => _token;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['fax'] = _fax;
    map['profile_id'] = _profileId;
    map['provide_name'] = _provideName;
    map['type'] = _type;
    map['newsletter'] = _newsletter;
    map['offer'] = _offer;
    map['status'] = _status;
    map['code'] = _code;
    map['_token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}