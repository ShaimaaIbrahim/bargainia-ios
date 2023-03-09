class FeeModel {
  FeeModel({
      this.fee, 
      this.barginiaFee,});

  FeeModel.fromJson(dynamic json) {
    fee = json['fee'];
    barginiaFee = json['barginia_fee'];
  }
  String? fee;
  String? barginiaFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fee'] = fee;
    map['barginia_fee'] = barginiaFee;
    return map;
  }

}