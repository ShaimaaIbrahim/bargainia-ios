/// id : 134
/// address : null
/// default : 1
/// street : "test"
/// postal_code : "66556"
/// state : "aaaaaaaaaa"
/// country_id : 75
/// city_id : 1
/// city : null
/// country : "السعودية"

class AddressModel {
  AddressModel({
      int? id, 
      dynamic address, 
      int? def,
      String? street, 
      String? postalCode, 
      String? state, 
      int? countryId, 
      int? cityId, 
      dynamic city, 
      String? country,}){
    _id = id;
    _address = address;
    _default = def;
    _street = street;
    _postalCode = postalCode;
    _state = state;
    _countryId = countryId;
    _cityId = cityId;
    _city = city;
    _country = country;
}

  AddressModel.fromJson(dynamic json) {
    _id = json['id'];
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
  dynamic _address;
  int? _default;
  String? _street;
  String? _postalCode;
  String? _state;
  int? _countryId;
  int? _cityId;
  dynamic _city;
  String? _country;

  int? get id => _id;
  dynamic get address => _address;
  int? get def => _default;
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