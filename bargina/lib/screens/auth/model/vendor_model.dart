/// vendor : {"user_id":96,"commercial_registration_image":"exam_page.PNG","vat_registration_image":"exam_page.PNG","display_name":"mohamed2","legal_name":"arafat2","commercial_registration_no":"656545456","vat_registration_no":"01013248182","bank_iban_no":"01013248182","phone":"01013248182","updated_at":"2022-04-24 22:22:50","created_at":"2022-04-24 22:22:50","id":23}

class VendorModel {
  VendorModel({
      Vendor? vendor,}){
    _vendor = vendor;
}

  VendorModel.fromJson(dynamic json) {
    _vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
  }
  Vendor? _vendor;

  Vendor? get vendor => _vendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vendor != null) {
      map['vendor'] = _vendor?.toJson();
    }
    return map;
  }

}

/// user_id : 96
/// commercial_registration_image : "exam_page.PNG"
/// vat_registration_image : "exam_page.PNG"
/// display_name : "mohamed2"
/// legal_name : "arafat2"
/// commercial_registration_no : "656545456"
/// vat_registration_no : "01013248182"
/// bank_iban_no : "01013248182"
/// phone : "01013248182"
/// updated_at : "2022-04-24 22:22:50"
/// created_at : "2022-04-24 22:22:50"
/// id : 23

class Vendor {
  Vendor({
      int? userId, 
      String? commercialRegistrationImage, 
      String? vatRegistrationImage, 
      String? displayName, 
      String? legalName, 
      String? commercialRegistrationNo, 
      String? vatRegistrationNo, 
      String? bankIbanNo, 
      String? phone, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _userId = userId;
    _commercialRegistrationImage = commercialRegistrationImage;
    _vatRegistrationImage = vatRegistrationImage;
    _displayName = displayName;
    _legalName = legalName;
    _commercialRegistrationNo = commercialRegistrationNo;
    _vatRegistrationNo = vatRegistrationNo;
    _bankIbanNo = bankIbanNo;
    _phone = phone;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Vendor.fromJson(dynamic json) {
    _userId = json['user_id'];
    _commercialRegistrationImage = json['commercial_registration_image'];
    _vatRegistrationImage = json['vat_registration_image'];
    _displayName = json['display_name'];
    _legalName = json['legal_name'];
    _commercialRegistrationNo = json['commercial_registration_no'];
    _vatRegistrationNo = json['vat_registration_no'];
    _bankIbanNo = json['bank_iban_no'];
    _phone = json['phone'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  int? _userId;
  String? _commercialRegistrationImage;
  String? _vatRegistrationImage;
  String? _displayName;
  String? _legalName;
  String? _commercialRegistrationNo;
  String? _vatRegistrationNo;
  String? _bankIbanNo;
  String? _phone;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  int? get userId => _userId;
  String? get commercialRegistrationImage => _commercialRegistrationImage;
  String? get vatRegistrationImage => _vatRegistrationImage;
  String? get displayName => _displayName;
  String? get legalName => _legalName;
  String? get commercialRegistrationNo => _commercialRegistrationNo;
  String? get vatRegistrationNo => _vatRegistrationNo;
  String? get bankIbanNo => _bankIbanNo;
  String? get phone => _phone;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['commercial_registration_image'] = _commercialRegistrationImage;
    map['vat_registration_image'] = _vatRegistrationImage;
    map['display_name'] = _displayName;
    map['legal_name'] = _legalName;
    map['commercial_registration_no'] = _commercialRegistrationNo;
    map['vat_registration_no'] = _vatRegistrationNo;
    map['bank_iban_no'] = _bankIbanNo;
    map['phone'] = _phone;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}