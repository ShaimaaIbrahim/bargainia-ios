/// id : 187
/// first_name : "mohamed2"
/// last_name : "arafat2"
/// email : "mohamed.arafat25@gmail.com"
/// phone : "01013248182"
/// newsletter : 0
/// bank_name : "ahli"
/// account_number : "878787878787"
/// full_name_third : "test test est"
/// address : "home"
/// default : 0
/// street : "street"
/// postal_code : "123456"
/// state : "state"
/// country_id : 75
/// city_id : 1
/// city : null
/// country : "السعودية"

class MyAccountModel {
  MyAccountModel({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      int? newsletter, 
      String? bankName, 
      String? accountNumber, 
      String? fullNameThird, 
      String? address, 
      //int? default,
      String? street, 
      String? postalCode, 
      String? state, 
      int? countryId, 
      int? cityId, 
      dynamic city, 
      String? country,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _newsletter = newsletter;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _fullNameThird = fullNameThird;
    _address = address;
    //_default = default;
    _street = street;
    _postalCode = postalCode;
    _state = state;
    _countryId = countryId;
    _cityId = cityId;
    _city = city;
    _country = country;
}

  MyAccountModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _newsletter = json['newsletter'];
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
    _fullNameThird = json['full_name_third'];
    _address = json['address'];
    _default = json['default'];
    _street = json['street'];
    _postalCode = json['postal_code'];
    _state = json['state'];
    _countryId = json['country_id'];
    _cityId = json['city_id'];
    _city = json['city'];
    _country = json['country'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  int? _newsletter;
  String? _bankName;
  String? _accountNumber;
  String? _fullNameThird;
  String? _address;
  int? _default;
  String? _street;
  String? _postalCode;
  String? _state;
  int? _countryId;
  int? _cityId;
  dynamic _city;
  String? _country;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  int? get newsletter => _newsletter;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get fullNameThird => _fullNameThird;
  String? get address => _address;
  //int? get default => _default;
  String? get street => _street;
  String? get postalCode => _postalCode;
  String? get state => _state;
  int? get countryId => _countryId;
  int? get cityId => _cityId;
  dynamic get city => _city;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['newsletter'] = _newsletter;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['full_name_third'] = _fullNameThird;
    map['address'] = _address;
    map['default'] = _default;
    map['street'] = _street;
    map['postal_code'] = _postalCode;
    map['state'] = _state;
    map['country_id'] = _countryId;
    map['city_id'] = _cityId;
    map['city'] = _city;
    map['country'] = _country;
    return map;
  }

}