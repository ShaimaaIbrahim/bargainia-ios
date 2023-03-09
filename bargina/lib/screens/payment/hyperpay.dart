// Copyright 2022 NyarTech LLC. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:bargina/screens/payment/extensions/payment_mode_ext.dart';
import 'package:bargina/screens/payment/extensions/payment_status_ext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../Locator.dart';
import '../../services/shared_prefrence_services.dart';
import '../../utils/constants.dart';
import 'config.dart';
import 'enums/brand_type.dart';
import 'enums/payment_status.dart';
import 'models/apple_pay_settings.dart';
import 'models/card_info.dart';
import 'models/checkout_settings.dart';

class HyperpayPlugin {

  HyperpayPlugin(this._config);
  //static HyperpayPlugin instance = HyperpayPlugin._();

  static const MethodChannel _channel = MethodChannel('com.app.bargina');

  late String _config;

  CheckoutSettings? _checkoutSettings;
  String _checkoutID = '';

  /// Read the configurations used to setup this instance of HyperPay.
  String get config => _config;

  /// Setup HyperPay instance with the required stuff to make a successful
  /// payment transaction.
  ///
  /// See [HyperpayConfig], [PaymentMode]
   Future<void> setup({required String config}) async {
    await _channel.invokeMethod(
      'setup_service'
    );
  }

  // /// Instantiate a checkout session.
  // void initSession({required CheckoutSettings checkoutSetting}) async {
  //   // ensure anything from previous session is cleaned up.
  //   _clearSession();
  //   _checkoutSettings = checkoutSetting;
  // }
  //
  // /// Used to clear any lefovers from previous session
  // /// before starting a new one.
  // void _clearSession() {
  //   if (_checkoutSettings != null) {
  //     _checkoutSettings?.clear();
  //   }
  // }

  Future<PaymentStatus> pay(CardInfo card, BrandType brandType, String checkoutId, orderId) async {
    try {
      final result = await _channel.invokeMethod(
        'start_payment_transaction',
        {
          'checkoutID': checkoutId,
          'brand': brandType.name.toUpperCase(),
          "holderName" : card.holder,
          "cardNumber": card.cardNumber,
          "expiryMonth": card.expiryMonth,
          "expiryYear": card.expiryYear,
          "CVV": card.cvv
        }
      );

      if (kDebugMode) {
        print('result : ${result.toString()}');
      }
      if (result == 'canceled') {
        // Checkout session is still going on.
        return PaymentStatus.canceled;
      }
      else if(result == "success"){
        return PaymentStatus.successful;
      }
      else if(result == "sync"){
         return PaymentStatus.sync;
      }
      return PaymentStatus.init;
    } catch (e) {
      print("error HyperpayPlugin/pay ${e}");
      rethrow;
    }
  }

  /// Perform a transaction natively with Apple Pay.
  ///
  /// This method will throw a [NOT_SUPPORTED] error on any platform other than iOS.
  Future<PaymentStatus> payWithApplePay(ApplePaySettings applePay, checkoutId, orderId) async {
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      throw Exception(
        'Apple Pay is not supported on $defaultTargetPlatform.',
      );
    }

    try {
      final result = await _channel.invokeMethod(
        'start_payment_apple',
        {
          'checkoutID': checkoutId,
          'amount': double.parse(applePay.amount),
          "appleMerchantId": applePay.appleMerchantId,
          "countryCode": "SA",
          "currencyCode": "SAR"
        },
      );

      log('$result', name: "HyperpayPlugin/platformResponse");


      if (result == 'canceled') {
        // Checkout session is still going on.
        return PaymentStatus.canceled;
      }
      else if(result == "success"){
        return PaymentStatus.successful;
      }
      else if(result == "sync"){
        return PaymentStatus.sync;
      }
      return PaymentStatus.init;
    } catch (e) {
      log('$e', name: "HyperpayPlugin/payWithApplePay");
      rethrow;
    }
  }

  Future<dynamic> getpaymentstatus(checkoutId, brand, orderId) async {
    print('order_id : $orderId');
    String myUrl = "https://bargainia.com.sa/api/get_payment_status/${checkoutId}";
    Response response = await Dio().post(myUrl,
        data: {"payment_method": "MASTER", "order_id": orderId},
        options: Options(headers: await getHeaders(true)));
    //print("payment_status: ${response.data}");

    if(response.statusCode == 200){
      return response.data["msg"];
    }
    return response.data["msg"];
    // print("payment_status: ${response.data['result']['code']}");
    // return response.data['result'];
  }

  Future<Map<String, String>> getHeaders(bool isAuthenticated) async {
    final Map<String, String> headers = {};

    var data = await locator<SharedPreferencesServices>().getUserAuthInfo();
    print('shaimaa profiledispaly===================${data.token}');
    // headers.putIfAbsent(ACCEPT_LANGUAGE, () => 'ar');
    // headers.putIfAbsent('Content-Type', () => 'application/json');
    if (isAuthenticated == true) {
      headers['Authorization'] = 'Bearer ${data.token}';
    }

    return headers;
  }
}
