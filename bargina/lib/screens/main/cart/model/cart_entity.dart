
class CartEntity {
  int? id;
  String? name;
  String? mainImg;
  String? price;
  String? priceAfterDiscount;
  int? quantity;

  CartEntity({this.id,this.name, this.mainImg,
    this.price, this.priceAfterDiscount, this.quantity});

  CartEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mainImg = json['mainImg'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mainImg'] = mainImg;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    return map;
  }
}