/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImUwNmE5MzcyNzI3OWFjYzg0ZDVkNDk2NDU4ZGUyMDI4NTQzYjQ0NjE5YWU1OTFjMTRiYTM2NGI4YzdkNTFjZTdlN2NkYjU2NTA0ZTE3NTQ3In0.eyJhdWQiOiIxIiwianRpIjoiZTA2YTkzNzI3Mjc5YWNjODRkNWQ0OTY0NThkZTIwMjg1NDNiNDQ2MTlhZTU5MWMxNGJhMzY0YjhjN2Q1MWNlN2U3Y2RiNTY1MDRlMTc1NDciLCJpYXQiOjE2Mzk4NDUzNjIsIm5iZiI6MTYzOTg0NTM2MiwiZXhwIjoxNjcxMzgxMzYyLCJzdWIiOiIxODMiLCJzY29wZXMiOltdfQ.CzaxbBS7SLP82i0gEb4zwmF_3vLX_EwGKskdr6YSv2GhUFTC4KquI3KXTDXHSrSeYrpPXh6Cs_Q5gCmKa4adPe-hCJgOcYmHYU6Fr0rf3t494Cp7ccHb8IvBWI78DB6h3D9sSbBbs81PdOJGI7MbsQ6mCe_l2GHypBdRR2HA6hZJGfFgfNxyHX-OURD0gGppksMCNyKFTWV8MrbLkOiPYXz22X_eGDEFcdisq8p6LelCSiZZB9L5bI0DPJO7mxcyczoNsCEjy8oO3nQhzrZhXd7gdht_a5hM156ZwNVC0WNE0L74A6iqO8U7B83nOdQijVQffvFihPlpDY1njPfb9xvdUrmLUEhh1LfLJ5a3dzSArjzl-8RJGYV1JmJ24JZelN1oRrYjtYA--bM59ooYWDbGyKxOjfFv42UlNJDfxL9SyIjwMCNjGI5CE0BsrTI8MhsQNU3D9jzZm8sDcKR-35sXGCxQahL-ty8Xrn0W9WFexpk74e6sIAPIdV_OUEnahZKNL8NDLyXWIrqm21mpMVluFQk35ai4XE-T9NCrBuR3Ycu_Y7J93mKpt9cKTaWqKbfS2Y49eF6S8_rIv4iRaDFKVvCXESyMkPXujcHo63Ho8jf8EyEOBJ_ly8EMbD06F4usMkU-aCaDfyajvUs7NLBKE7ol7BQjEh7cWX5CvMg"
/// user : {"id":183,"first_name":"test","last_name":"test","email":"phone1@yahoo.com","phone":"010132481828","fax":null,"profile_id":null,"provide_name":null,"type":0,"newsletter":0,"offer":0,"status":0,"code":"9809","_token":null,"created_at":"2021-12-18 16:35:31","updated_at":"2021-12-18 16:35:31","deleted_at":null}

class PhoneCodeVerifyModel {
  PhoneCodeVerifyModel({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  PhoneCodeVerifyModel.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;

  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 183
/// first_name : "test"
/// last_name : "test"
/// email : "phone1@yahoo.com"
/// phone : "010132481828"
/// fax : null
/// profile_id : null
/// provide_name : null
/// type : 0
/// newsletter : 0
/// offer : 0
/// status : 0
/// code : "9809"
/// _token : null
/// created_at : "2021-12-18 16:35:31"
/// updated_at : "2021-12-18 16:35:31"
/// deleted_at : null

class User {
  User({
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

  User.fromJson(dynamic json) {
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