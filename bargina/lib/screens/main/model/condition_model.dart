import 'dart:convert';
/// id : 0
/// title : "الضمان مع الكرتون"
/// desc : "<li> الحالة الأصلية , ولا توجد علامات اهتراء </ li> <li> سلك الطاقة / الشاحن غير مطلوب </ li> <li> عبوة البيع بالتجزئة والأدلة غير مطلوبة </ li>"

ConditionModel conditionModelFromJson(String str) => ConditionModel.fromJson(json.decode(str));
String conditionModelToJson(ConditionModel data) => json.encode(data.toJson());
class ConditionModel {
  ConditionModel({
      int? id, 
      String? title, 
      String? desc,}){
    _id = id;
    _title = title;
    _desc = desc;
}

  ConditionModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _desc = json['desc'];
  }
  int? _id;
  String? _title;
  String? _desc;

  int? get id => _id;
  String? get title => _title;
  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['desc'] = _desc;
    return map;
  }

}