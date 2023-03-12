class PurchasesModel {
  PurchasesModel({
    this.msg,
    this.status,
    this.orderId,
    this.orderReference,
    this.productId
  });

  String? msg;
  bool? status;
  int? orderId;
  String? orderReference;
  String? productId;

  factory PurchasesModel.fromJson(Map<String, dynamic> json) => PurchasesModel(
    msg: json["msg"],
    status: json["status"],
    orderId: json["order_id"],
    orderReference: json["order_reference"].toString(),
    productId: json["product_purchase_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
    "order id": orderId,
    "order reference": orderReference,
    "productId": productId,
  };
}