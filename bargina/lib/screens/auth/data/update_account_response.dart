/// msg : "Updated operation done successfully"
/// status : true

class UpdateAccountResponse {
  UpdateAccountResponse({
      String? msg, 
      bool? status,}){
    _msg = msg;
    _status = status;
}

  UpdateAccountResponse.fromJson(dynamic json) {
    _msg = json['msg'];
    _status = json['status'];
  }
  String? _msg;
  bool? _status;

  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}