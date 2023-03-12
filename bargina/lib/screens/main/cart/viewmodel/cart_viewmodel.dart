import 'dart:developer';

import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/screens/main/cart/checkout/pages/summary_page.dart';
import 'package:bargina/screens/main/cart/model/cart_entity.dart';
import 'package:bargina/screens/main/model/ship_price_model.dart';
import 'package:bargina/services/db_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Locator.dart';
import '../../../../enums/ScreenState.dart';
import '../../../../models/Resources.dart';
import '../../../../models/Status.dart';
import '../../../../models/purchases_model.dart';
import '../../../../services/api_services.dart';
import '../../../../utils/common_functions.dart';
import '../model/new_order_model.dart';

class CartViewModel extends BaseViewModel {
  static const platform = MethodChannel("com.app.bargina");

  final ApiService _apiService = ApiService();

  String count = "";

  int currentPage = 0;

  changeCurrentPage(i) {
    currentPage = i;
    notifyListeners();
  }

  Future<int> getCartItemsCount() async {
    var items = await locator<DbServices>().retrieveCartItems();
    return items.length;
  }

  String getCartItemsCountBadge() {
    getCartItemsCount().then((value) {
      count = value.toString();
    });
    return count;
  }

  List<bool> checkAddress = [];
  List<bool> checkPayment = [];
  List<bool> checkShips = [];

  List<dynamic>? addresses;

  dynamic? selectedAddressId;
  dynamic selectedCartItemId;
  dynamic paymentMethod;
  dynamic shipWay;
  NewOrderModel? newOrderModel;
  dynamic orderDetailsModel;
  int quantity = 1;

  List<dynamic>? paymentMethods;
  List<dynamic>? shippingMethods;
  ShipPriceModel? shipPriceModel;

  List<CartEntity>? cartItems;
  int selectedShip = 0;
  bool check = false;

  changeCheck(i) {
    check = !check;
    selectedShip = i;
    notifyListeners();
  }

  getCartItems() async {
    cartItems = await locator<DbServices>().retrieveCartItems();
    notifyListeners();
  }

  Future<void> getPaymentsMethods(BuildContext context) async {
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getPaymentsMethods();
    switch (response.status) {
      case Status.SUCCESS:
        paymentMethods = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  Future<void> getShippingMethods(BuildContext context) async {
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getShippingMethods();
    switch (response.status) {
      case Status.SUCCESS:
        shippingMethods = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }



  Future<String> checkoutpage(BuildContext context, total) async {
   //  const MethodChannel _channel = MethodChannel('com.app.bargina');

     setState(ViewState.Busy);

     Resource response1 = await _apiService.createCheckoutId(total.toString());
    print('res res res ${response1.data}');
    switch (response1.status) {
      case Status.SUCCESS:

        // final result = await _channel.invokeMethod(
        //   'start_payment_transaction',
        //   {
        //     'checkoutID': response1.data,
        //     // 'brand': brandType.name.toUpperCase(),
        //     // 'card': card.toMap(),
        //   },
        // );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PaymentPage(checkOutId: response1.data, orderId: orderId)),
        // );

      return response1.data;

      case Status.ERROR:
        showSnackBar(response1.errorMessage!, context);
        return "";
    }
     setState(ViewState.Idle);
     return "";
  }

  setSelectedAddressId(id, index) {
    checkAddress.fillRange(0, 30, false);
    selectedAddressId = id;
    checkAddress[index] = !checkAddress[index];
    log('address is $id');
    notifyListeners();
  }

  //  void increaseQuantity(q){
  //  // quantity = q;
  //   quantity++;
  //   notifyListeners();
  //  }
  //
  // void decreaseQuantity(q){
  //   // quantity = q;
  //    if(quantity<= 1) return;
  //      quantity--;
  //      notifyListeners();
  // }

  void increase(CartEntity cartEntity) async {
    cartEntity.quantity = cartEntity.quantity! + 1;
    await locator<DbServices>().updateQuantity(cartEntity.id!, cartEntity);
    getCartItems();
  }

  void decrease(CartEntity cartEntity) async {
    if (cartEntity.quantity == 1) return;
    cartEntity.quantity = cartEntity.quantity! - 1;
    await locator<DbServices>().updateQuantity(cartEntity.id!, cartEntity);
    getCartItems();
  }

  void setSelectedCartItem(int? id) {
    selectedCartItemId = id;
    notifyListeners();
  }

  // void generateChecks() {
  //   for(int i =0 ; i< 100; i++){
  //     checks.add(false);
  //   }
  // }

  void selectItem(int index) {
    checkShips.fillRange(0, 30, false);
    checkShips[index] = !checkShips[index];
    shipWay = shippingMethods![index];
    print('my way ${shipWay.id}');
    notifyListeners();
  }

  void selectPaymethods(int index) {
    checkPayment.fillRange(0, 30, false);
    checkPayment[index] = !checkPayment[index];
    paymentMethod = paymentMethods![index];
    notifyListeners();
  }

  Future<void> getMyAddresses(BuildContext context) async {
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getMyAddresses();
    switch (response.status) {
      case Status.SUCCESS:
        addresses = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void newOrder(
      BuildContext context, product_id, quantity, CartViewModel vm, bool digital) async {
    setState(ViewState.Busy);

    Resource<NewOrderModel> response = await _apiService.neworder(
        product_id,
        quantity,
        "",
        paymentMethod.wayCost ?? 0,
        selectedAddressId,
        shipWay.id);

    switch (response.status) {
      case Status.SUCCESS:
        newOrderModel = response.data!;
        //showSnackBar(newOrderModel!.msg!, context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => SummaryPage(
                digital: digital,
                id: newOrderModel!.orderId!,
                viewModel: vm,
                productid: product_id,
                payment: paymentMethod,
                quantity: quantity)));
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage, context);
        break;
    }
  }

  Future<PurchasesModel?> purchasesOrder(
      BuildContext context, product_id,) async {
    setState(ViewState.Busy);
    Resource<Map<String,dynamic>> response = await _apiService.purchasesOrder(product_id);
    switch (response.status) {
      case Status.SUCCESS:
        return PurchasesModel.fromJson(response.data!);
      case Status.ERROR:
        setState(ViewState.Idle);
        print(">>>>>>><<<<error<<>>>>>>>>");
        showSnackBar(response.errorMessage, context);
        break;
    }

  }



  Future<void> calculateShippingPrice(BuildContext context, product_id,
      quantity, CartViewModel viewModel) async {
    setState(ViewState.Busy);
    Resource<ShipPriceModel> response =
        await _apiService.calculateShippingPrice(
            product_id,
            quantity,
            "",
            viewModel.paymentMethod.wayCost,
            viewModel.selectedAddressId,
            viewModel.shipWay.id);
    print('ohh $product_id  $quantity');
    switch (response.status) {
      case Status.SUCCESS:
        shipPriceModel = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void deleteCartItem(int? id) async {
    await locator<DbServices>().deleteDbItem(id!).then((_) {
      // getCartItems();
    });
  }

  Future<void> getOrderDetails(BuildContext context, id) async {
    //setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.getOrderDetails(id);
    switch (response.status) {
      case Status.SUCCESS:
        orderDetailsModel = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        //setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  var prodiD;
  var quantityy = 1;

  void setInitial(productId, quantity) {
    prodiD = productId;
    quantityy = quantity;
    notifyListeners();
  }

  void generateChecks() {
    for (int i = 0; i < 30; i++) {
      checkPayment.add(false);
      checkAddress.add(false);
      checkShips.add(false);
    }
    notifyListeners();
  }
}
