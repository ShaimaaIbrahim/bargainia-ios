import 'package:purchases_flutter/purchases_flutter.dart';

class InAppPurchases{

  static Future inAppPurchases({required String transactionId,required String productId})async{
    await Purchases.setAttributes({"transaction_id": transactionId});
     await Purchases.purchaseProduct(
      productId,
      type: PurchaseType.inapp,
    );
  }

}

