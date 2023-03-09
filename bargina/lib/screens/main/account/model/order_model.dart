/// order_id : 272
/// created_at : "2022-02-23 19:29:30"
/// final_amount : "1.05"
/// type : 1
/// order_type : "تحت التنفيذ"
/// products_order : [{"product_name":"ايفون 12 ميني"}]

class OrderModel {
  OrderModel({
      int? orderId, 
      String? createdAt, 
      String? finalAmount, 
      int? type, 
      String? orderType, 
      List<ProductsOrder>? productsOrder,}){
    _orderId = orderId;
    _createdAt = createdAt;
    _finalAmount = finalAmount;
    _type = type;
    _orderType = orderType;
    _productsOrder = productsOrder;
}

  OrderModel.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _createdAt = json['created_at'];
    _finalAmount = json['final_amount'];
    _type = json['type'];
    _orderType = json['order_type'];
    if (json['products_order'] != null) {
      _productsOrder = [];
      json['products_order'].forEach((v) {
        _productsOrder?.add(ProductsOrder.fromJson(v));
      });
    }
  }
  int? _orderId;
  String? _createdAt;
  String? _finalAmount;
  int? _type;
  String? _orderType;
  List<ProductsOrder>? _productsOrder;

  int? get orderId => _orderId;
  String? get createdAt => _createdAt;
  String? get finalAmount => _finalAmount;
  int? get type => _type;
  String? get orderType => _orderType;
  List<ProductsOrder>? get productsOrder => _productsOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['created_at'] = _createdAt;
    map['final_amount'] = _finalAmount;
    map['type'] = _type;
    map['order_type'] = _orderType;
    if (_productsOrder != null) {
      map['products_order'] = _productsOrder?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_name : "ايفون 12 ميني"

class ProductsOrder {
  ProductsOrder({
      String? productName,}){
    _productName = productName;
}

  ProductsOrder.fromJson(dynamic json) {
    _productName = json['product_name'];
  }
  String? _productName;

  String? get productName => _productName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_name'] = _productName;
    return map;
  }

}