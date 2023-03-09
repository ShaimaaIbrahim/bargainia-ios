/// id : 78
/// name : "جدة"

class CitiesModel {
  CitiesModel({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  CitiesModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}