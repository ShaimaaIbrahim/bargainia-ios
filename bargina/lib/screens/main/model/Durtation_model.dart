class DurtationModel {
  DurtationModel({
      this.id, 
      this.title, 
      this.value,});

  DurtationModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
  }
  int? id;
  String? title;
  int? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['value'] = value;
    return map;
  }

}