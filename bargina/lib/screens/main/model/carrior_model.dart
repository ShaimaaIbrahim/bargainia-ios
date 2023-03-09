import 'dart:convert';
/// id : 245
/// lookup_id : 65
/// name : "بارجينيا"
/// image : "tmpphptufvx3.png"

CarriorModel carriorModelFromJson(String str) => CarriorModel.fromJson(json.decode(str));
String carriorModelToJson(CarriorModel data) => json.encode(data.toJson());
class CarriorModel {
  CarriorModel({
      int? id, 
      int? lookupId, 
      String? name, 
      String? image,}){
    _id = id;
    _lookupId = lookupId;
    _name = name;
    _image = image;
}

  CarriorModel.fromJson(dynamic json) {
    _id = json['id'];
    _lookupId = json['lookup_id'];
    _name = json['name'];
    _image = json['image'];
  }
  int? _id;
  int? _lookupId;
  String? _name;
  String? _image;

  int? get id => _id;
  int? get lookupId => _lookupId;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lookup_id'] = _lookupId;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}