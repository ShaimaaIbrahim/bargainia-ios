/// name : "السعودية"
/// id : 75

class AllCountriesModel {
  AllCountriesModel({
      String? name, 
      int? id,}){
    _name = name;
    _id = id;
}

  AllCountriesModel.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
  }
  String? _name;
  int? _id;

  String? get name => _name;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    return map;
  }

}